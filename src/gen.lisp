(defpackage #:cobweb-gen
  (:use :cl)
  (:local-nicknames (:jzon :com.inuoe.jzon))
  (:export :get-spec :write-files))

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

(defun write-attrs (attrs)
  (when attrs
    (loop for tag in attrs
          collect (format nil "attr-~a :initarg :~a :accessor attr-~a"
                          tag tag tag))))


(defun write-class (name super attrs &optional non-tag (stream nil))
  (let ((attr-strings (write-attrs attrs)))
    (format stream "(defclass ~(elem-~a~) (~@[~{~(~a~)~^ ~}~])~:[ ()~;~]~@[
  (~{(~a)~^~%   ~})~]
  (:metaclass xhtml-meta)~@[
  (:tag nil)~])~%~%"
            name super
            attr-strings
            attr-strings
            non-tag)))

(defun export-attr (attr)
  (make-exportable
   (format nil "attr-~a" attr)))

(defun write-exports (tag for-attrs &optional (stream nil))
  (format stream "~12t~a~%"
          (string-trim '(#\( #\))
                       (format nil "~@<~(~s~)~:@>"
                               (alexandria:flatten
                                (list (make-exportable (format nil "elem-~a" tag))
                                      (mapcar #'export-attr for-attrs)))))))

(defun write-spec (f-spec &optional (c-stream nil) (p-stream nil))
  (let* ((elems (gethash :elements f-spec))
         (for-attrs (gethash :for-attrs f-spec))
         (global-attrs (concatenate 'list
                                    (gethash "global" for-attrs)
                                    (gethash "html-global" for-attrs))))
    (write-class "global" '(xhtml) global-attrs t c-stream)
    (write-exports "global" global-attrs p-stream)
    (loop for e in elems
          as heading = (gethash "heading" e)
          as tag = (aref (gethash "linkingText" e) 0)
          as supers = (if (equalp "non-conforming-features"
                                  (gethash "id" heading))
                          '(elem-global fragment non-conforming-features)
                          '(elem-global fragment))
          do (write-class tag supers
                            (remove-duplicates
                             (gethash tag for-attrs) :test #'equalp)
                            nil c-stream)
             (write-exports tag (gethash tag for-attrs) p-stream))))

(defun write-files (spec)
  (let ((f-spec (collect-spec spec))
        (package-src (uiop:read-file-string
                      (asdf:system-relative-pathname
                       :cobweb "src/package-src.lisp")))
        (spec-src (uiop:read-file-string
                   (asdf:system-relative-pathname
                    :cobweb "src/spec-src.lisp")))
        (package-out (open (asdf:system-relative-pathname
                            :cobweb "src/package.lisp")
                           :direction :output
                           :if-exists :supersede
                           :if-does-not-exist :create))
        (spec-out (open (asdf:system-relative-pathname
                         :cobweb "src/spec.lisp")
                        :direction :output
                        :if-exists :supersede
                        :if-does-not-exist :create)))
    (format package-out "~a
;; begin autoexport at ~a~%"
            package-src
            (local-time:format-timestring nil (local-time:now)))
    (format spec-out "~a~%
;; begin autogenerate at ~a~%"
            spec-src
            (local-time:format-timestring nil (local-time:now)))
    (write-spec f-spec spec-out package-out)
    (write-string "))" package-out)
    (close package-out)
    (close spec-out)))

(defun main ()
  (write-files (get-spec)))
