(defpackage #:cobweb.user
  (:use :cl :cobweb.spec :cobweb.core)
  (:export :with-html :with-html-write))

(in-package :cobweb.user)

(defun truncate-name (object)
  (subseq (symbol-name (class-name (class-of object))) 5))

(defun bound-slots (object)
  (flet ((slot-names (c)
           (mapcar (lambda (x) (cons (c2mop:slot-definition-name x)
                                     (car (c2mop:slot-definition-initargs x))))
                   c)))
    (let* ((filter-slots (slot-names (c2mop:class-slots (find-class 'xhtml))))
           (slot-list (set-difference (slot-names (c2mop:class-slots (class-of object)))
                                      filter-slots
                                      :key #'car))
           (slots-out (remove-if-not (lambda (x) (slot-boundp object (car x)))
                                     slot-list)))
      (mapcar (lambda (x)
                (list (cdr x) (slot-value object (car x))))
              slots-out))))

(defmethod print-object ((object elem-global) stream)
  (with-slots (html-body depth attr-class attr-id) object
    (print-unreadable-object (object stream)
      (format stream "~@<~a~@[ ~{~:_~2i~<~s ~s~:>~^ ~}~]~@[ ~:_~a~]~:>"
              (truncate-name object)
              (bound-slots object)
              (if (equalp #() html-body) nil
                  html-body)))))

(defmethod print-object ((object fragment) stream)
  (print-unreadable-object (object stream :type t)
    (format stream "~@[~a~]"
            (when (slot-boundp object 'html-body)
              (format nil "~@<~:_ ~a~:>"
                      (html-body object))))))

(defgeneric html-writer (stream object &optional at colon indent)
  (:documentation "Write the HTML object to something.")
  ;; (:method (stream object &optional at colon indent)
  ;;   (html-writer stream object at colon indent))
  (:method ((stream t) object &optional at colon indent)
    (html-writer *standard-output* object at colon indent))
  (:method ((stream null) object &optional at colon indent)
    (let ((out (make-string-output-stream)))
      (html-writer out object at colon indent)
      (get-output-stream-string out))))

(defmethod html-writer ((stream stream) object
                        &optional at colon (indent nil))
  (declare (ignore at colon))
  (format stream "~@[~vt~]~a~%" indent object))

(defmethod html-writer ((stream stream) (object string)
                        &optional at colon (indent nil))
  (declare (ignore at colon))
  (format stream "~@[~vt~]~a~%" indent object))

(defmethod html-writer ((stream stream) (object xhtml)
                        &optional at colon (indent nil))
  (declare (ignorable at colon))
  (let* ((tag (when (car (tag (class-of object))) (truncate-name object)))
         (slot-list (bound-slots object)))
    (format stream "~@[~vt~]~@[<~(~a~)~@?>~]~@?~@[~vt~]~@[</~(~a~)>~%~]"
            indent
            tag
            "~@[ ~{~<~(~a~)=\"~a\"~:>~}~]"
            slot-list
            "~@[~%~v/cobweb.user::html-writer/~]"
            (if indent (+ 2 indent) 2)
            (html-body object)
            indent
            tag)))

(defmethod html-writer ((stream stream) (object list)
                        &optional at colon (indent nil))
  (loop for x in object
        do (html-writer stream x at colon indent)))

(defmethod html-writer ((stream stream) (object vector)
                        &optional at colon (indent nil))
  (loop for x across object
        do (html-writer stream x at colon indent)))

(defmethod html-writer ((stream stream) (object fragment)
                        &optional at colon (indent nil))
  (loop for x in (html-body object)
        do (html-writer stream x at colon indent)))

(defmacro with-html (&body body)
  `(make-instance
    'fragment
    :body (list ,@body)))

(defmacro with-html-write (stream &body body)
  `(let ((html (html-body (with-html ,@body))))
     (values html (html-writer ,stream html))))
