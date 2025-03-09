(in-package :cobweb)

(defmethod print-object ((object elem-global) stream)
  (with-slots (html-body depth attr-class attr-id) object
    (print-unreadable-object (object stream)
      (format stream "~a ~@[~a ~]~@[~a ~]~@<~:_~a~:>"
              (truncate-name object)
              (when (slot-boundp object 'attr-class)
                (format nil ":CLASS ~s" attr-class))
              (when (slot-boundp object 'attr-id)
                (format nil ":ID ~s" attr-id))
              (when html-body html-body)))))

(defmethod print-object ((object fragment) stream)
  (print-unreadable-object (object stream :type t)
    (format stream "~@[~a~]"
            (when (slot-boundp object 'html-body)
              (format nil "~@<~:_ ~a~:>"
                      (html-body object))))))

(defgeneric html-writer (object stream &optional indent)
  (:documentation "Write the HTML object to something.")
  (:method (object (stream stream) &optional indent)
    (html-writer object stream indent))
  (:method (object (stream t) &optional indent)
    (html-writer object *standard-output* indent))
  (:method (object (stream null) &optional indent)
    (let ((out (make-string-output-stream)))
      (html-writer object out indent)
      (get-output-stream-string out))))

(defmethod html-writer (object (stream stream)
                        &optional (indent nil))
  (format stream "~@[~vt~]~a~%" indent object))

(defmethod html-writer ((object string) (stream stream)
                        &optional (indent nil))
  (format stream "~@[~vt~]~a~%" indent object))

(defmethod html-writer ((object xhtml) (stream stream)
                        &optional (indent nil))
  ;; TODO: make less ugly
  (let* ((tag (when (car (tag (class-of object))) (truncate-name object)))
         (slot-list (bound-slots object))
         (slot-strings (mapcar (lambda (x)
                                 (format nil "~(~a~)=\"~a\""
                                         (cdr x)
                                         (slot-value object (car x))))
                               slot-list)))
    (when tag
      (format stream "~@[~vt~]<~(~a~)~@[ ~{~a~^ ~}~]>"
              indent
              tag
              slot-strings))
    (when (html-body object)
      (format stream "~%")
      (html-writer (html-body object) stream
                   (if indent (+ 2 indent)
                       (if tag 2 nil)))
      (format stream "~@[~vt~]" indent))
    (when tag
      (format stream "</~(~a~)>~%" tag))))

(defmethod html-writer ((object list) (stream stream)
                        &optional (indent nil))
  (loop for x in object
        do (html-writer x stream indent)))

(defmethod html-writer ((object vector) (stream stream)
                        &optional (indent nil))
  (loop for x across object
        do (html-writer x stream indent)))

(defmethod html-writer ((object fragment) (stream stream)
                        &optional (indent nil))
  (loop for x in (html-body object)
        do (html-writer x stream indent)))
