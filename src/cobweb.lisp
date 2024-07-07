(in-package :cobweb)

(defgeneric set-hierarchy (obj parent index)
  (:documentation "Set the hierachy on initialization.")
  (:method (obj parent index) t)
  (:method ((obj xhtml) (parent xhtml) (index integer))
    (setf (parent obj) parent)
    (setf (coords obj) index)))

(defgeneric parse-dom (input)
  (:documentation "Parses the DOM at each node after an element 
has been initiated."))

(defmethod parse-dom ((input xhtml))
  (when (slot-boundp input 'html-body)
    (loop for x across (html-body input)
          as i = 0 then (incf i)
          do (set-hierarchy x input i)))
  input)

(defun sexp-parse (input)
  (labels ((rec-slots (slots ls &optional (set-slots nil))
             (if (member (car ls) slots)
                 (rec-slots slots (cddr ls)
                            (cons (car ls)
                                  (cons (cadr ls) set-slots)))
                 `(list ,@set-slots :body (vector ,@(rec ls)))))
           (rec (input)
             (cond ((null input) input)
                   ((atom input) input)
                   ((symbolp (car input))
                    (let ((lookup (gethash (car input) *elem-tags*)))
                      (if lookup 
                          `(parse-dom
                            (apply #'make-instance
                                   ',(read-from-string
                                      (format nil "~:@(elem-~a~)" (car input)))
                                   ,(rec-slots lookup (cdr input))))
                          (cons (car input)
                                (mapcar #'rec (cdr input)))))) 
                   ((listp (car input))
                    (cons (rec (car input))
                          (mapcar #'rec (cdr input))))
                   (t (cons (car input)
                            (mapcar #'rec (cdr input)))))))
    (rec input)))

(defmacro with-html (&body body)
  `(vector ,@(sexp-parse body)))

(defmacro with-html-write (stream &body body)
  `(let ((html (vector ,@(sexp-parse body))))
     (values html (html-writer html ,stream))))
