(defpackage #:cobweb-gen
  (:use :cl)
  (:local-nicknames (:jzon :com.inuoe.jzon)))

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

(defun write-slots (attrs)
  (when attrs
    (loop for tag in attrs
          collect (format nil "attr-~a :initarg :~a :accessor attr-~a"
                          tag tag tag))))

(defun spec-writer (name super attrs)
  (format nil "(defclass ~(el-~a~) (~@[~{~(~a~)~^ ~}~])
  (~@[~{(~a)~^~%   ~}~]))"
          name super (write-slots attrs)))

(defun export-attr (attr)
  (make-exportable
   (format nil "attr-~a" attr)))

(defun collect-exportable (tag for-attrs)
  (let* ((tag-sym (format nil "el-~a" tag))
         (attrs (gethash tag for-attrs)))
    (cons
     (cons (make-exportable tag)
           (read-from-string tag-sym))
     (cons (make-exportable tag-sym)
           (mapcar #'export-attr attrs)))))

(defun write-globals (for-attrs)
  (let ((attrs (concatenate 'list
                            (gethash "global" for-attrs)
                            (gethash "html-global" for-attrs))))
    (list
     (cons (make-exportable 'el-global)
           (mapcar #'export-attr attrs))
     (spec-writer "global" nil attrs))))

(defun write-elements (f-spec)
  (let* ((elems (gethash :elements f-spec))
         (for-attrs (gethash :for-attrs f-spec))
         (globals (write-globals for-attrs))
         (out '(:symbols nil :elems nil :classes nil)))
    (push (car globals) (getf out :symbols))
    (push (cadr globals) (getf out :classes))
    (loop for e in elems
          as heading = (gethash "heading" e)
          as tag = (aref (gethash "linkingText" e) 0)
          as exp = (collect-exportable tag for-attrs)
          do (push (car exp) (getf out :elems))
             (push (cdr exp) (getf out :symbols))
             (push (spec-writer tag
                                (if (equalp "non-conforming-features"
                                            (gethash "id" heading))
                                    '(el-global html-tag non-conforming-features)
                                    '(el-global html-tag))
                                (remove-duplicates
                                 (gethash tag for-attrs) :test #'equalp))
                   (getf out :classes)))
    out))

(defun write-exports (symbols)
  (let ((formatted (format nil "~@<~(~s~)~:@>" (alexandria:flatten symbols))))
    (with-open-file (stream (asdf:system-relative-pathname
                             :cobweb "src/package.lisp")
                            :direction :io
                            :if-exists :overwrite)
      (loop for line = (read-line stream nil :eof)
            until (eq line :eof)
            when (search ";; begin autoexport" line :test #'equalp)
              do (format stream "~12t;; at ~a
~a))"
                         (local-time:format-timestring nil (local-time:now))
                         (string-trim '(#\( #\)) formatted))))))

(defun spec-write-to-file (spec)
  (let* ((f-spec (collect-spec spec))
         (elems (write-elements f-spec)))
    (write-exports (getf elems :symbols))
    (with-open-file (stream (asdf:system-relative-pathname
                             :cobweb "src/spec.lisp")
                            :direction :output
                            :if-does-not-exist :create
                            :if-exists :supersede)
      (format stream "(in-package :cobweb)

;;;; this file has been autogenerated by init.lisp
;;;; at ~a

(defparameter *el-tags* 
  '~(~s~))

(defclass html-tag () 
  ((tag-parent :initarg :parent :accessor parent)
   (depth :initarg :depth :accessor depth)
   (tag-body :initarg :body :accessor body))
  (:default-initargs
   :body (vector)))

(defclass non-conforming-features () ())

"
              (local-time:format-timestring nil (local-time:now))
              (remove-duplicates (getf elems :elems)))      
      (format stream "~{~a~%~%~}" (getf elems :classes)))))

