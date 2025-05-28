(defpackage #:cobweb-gen
  (:use :cl)
  (:local-nicknames (:jzon :com.inuoe.jzon))
  (:export :main))

(in-package :cobweb-gen)

;;;; There's a lot of room for improving the speed of this autogenerator but it shouldn't need
;;;; to be run very often

(defvar *spec-url* "https://raw.githubusercontent.com/w3c/webref/main/ed/dfns/html.json")

(defun refresh-spec (path)
  (let ((clear-old (uiop:directory-files
                    (directory-namestring path)))
        (data (drakma:http-request *spec-url*)))
    (mapcar #'delete-file clear-old)
    (alexandria:write-string-into-file data path)
    data))

(defun get-spec ()
  (let ((spec-path (asdf:system-relative-pathname
                    :cobweb-gen
                    (format nil "data/~a.json"
                            (local-time:timestamp-to-universal
                             (local-time:today))))))
    (if (probe-file spec-path)
        (jzon:parse spec-path)
        (jzon:parse 
         (refresh-spec spec-path)))))

(defun make-exportable (str)
  (intern (string-upcase str) :keyword))

(defun attr-handler (attr f-spec)
  (let ((for-attrs (gethash :for-attrs f-spec)))
    (unless (zerop (length (gethash "for" attr)))
      (map 'list (lambda (x)
                   (push (aref (gethash "linkingText" attr) 0)
                         (gethash x for-attrs)))
           (gethash "for" attr)))
    (push attr (gethash :attrs f-spec))))

(defun collect-spec (spec)
  (let* ((dfns (gethash "dfns" spec))
         (filtered (make-hash-table :size (length dfns))))
    (setf (gethash :for-attrs filtered)
          (make-hash-table :test #'equalp))
    (loop for k across dfns
          as k-type = (gethash "type" k)
          do (cond ((equalp k-type "element-attr")
                    (attr-handler k filtered))
                   ((equalp k-type "element")
                    (push k (gethash :elements filtered)))))
    filtered))

(defun make-syms (attrs)
  (mapcar #'read-from-string attrs))

(defun collect-exports (elem attrs)
  (flet ((to-key (x)
           (intern x :keyword)))
    `(,(to-key (symbol-name elem))
      ,(to-key (format nil "~@:(elem-~a~)" elem))
      ,@(loop for x in attrs
              collect (to-key (format nil "~@:(attr-~a~)" x))))))

(defun collect-defs (f-spec)
  (let* ((elems (gethash :elements f-spec))
         (for-attrs (gethash :for-attrs f-spec))
         (global-attrs (make-syms (concatenate 'list
                                               (gethash "global" for-attrs)
                                               (gethash "html-global" for-attrs)))))
    `(,@(loop for e in elems
              as heading = (gethash "heading" e)
              as tag = (aref (gethash "linkingText" e) 0)
              as supers = (if (equalp "non-conforming-features"
                                      (gethash "id" heading))
                              '(elem-global non-conforming-features)
                              '(elem-global))
              as attrs = (remove-duplicates (make-syms (gethash tag for-attrs)))
              collect `(:def (deftag ,(read-from-string tag) ,supers
                               ,(intern (string-upcase tag) :keyword) ,@attrs)
                         :exp ,(collect-exports (read-from-string tag) attrs)))
      (:def (deftag global (xhtml) nil
              ,@global-attrs)
       :exp ,(collect-exports 'global global-attrs)))))

(defun write-spec (spec)
  (let ((defs (collect-defs spec))
        (definitions nil))
    (with-open-file (stream (asdf:system-relative-pathname
                             :cobweb "src/spec.lisp")
                            :direction :output
                            :if-exists :supersede
                            :if-does-not-exist :create)
      (format stream "~(~s~)

(in-package :cobweb.spec)~%~%"
              `(defpackage #:cobweb.spec
                 (:use :cl :cobweb.core)
                 (:export ,@(remove-duplicates
                             (loop for x in defs
                                   nconcing (destructuring-bind (&key def exp) x
                                              (push def definitions)
                                              exp))))))
      (format stream "~{~(~s~)~^~%~}" definitions))))

(defun main ()
  (write-spec (collect-spec (get-spec))))
