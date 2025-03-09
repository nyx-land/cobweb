(in-package :cobweb.core)

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
                                      :key #'car)))
      (remove-if-not (lambda (x) (slot-boundp object (car x)))
                     slot-list))))

(defun make-class-name (name)
  (read-from-string
   (format nil "~@:(elem-~a~)"
           name)))

(defun make-slots (attrs)
  (mapcar (lambda (x)
            (let ((name (read-from-string (format nil "~@:(attr-~a~)"
                                                  x)))
                  (key (intern (symbol-name x) :keyword)))
              `(,name :initarg ,key :accessor ,name)))
          attrs))

(defun parse-attrs (input attrs)
  (labels ((rec (input &optional (slots nil))
             (let ((i (car input))
                   (j (cadr input)))
               (if (and (keywordp i)
                        (member i attrs))
                   (rec (cddr input) (cons i (cons j slots)))
                   ;;(cons i (cons j (rec (cddr input))))
                   `(list ,@slots :body (vector ,@input))
                   ;;(list :slots slots) (list :body `(vector ,@input))
                   ))))
    (rec input)))
