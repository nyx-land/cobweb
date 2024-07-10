(in-package :cobweb)

(defgeneric set-hierarchy (obj parent index)
  (:documentation "Set the hierachy on initialization.")
  (:method (obj parent index) t))

(defgeneric parse-dom (input)
  (:documentation "Parses the DOM at each node after an element 
has been initiated."))

(defmethod initialize-instance :after ((object xhtml)
                                       &key &allow-other-keys)
  (parse-dom object))

(defmethod set-hierarchy ((obj xhtml) (parent xhtml) (index integer))
  (setf (parent obj) parent)
  (setf (coords parent)
        (list (1+ (car (coords obj)))))
  (setf (coords obj) (cons index (coords obj))))


(defmethod parse-dom ((input xhtml))
  (when (slot-boundp input 'html-body)
    (loop for x across (html-body input)
          as i = 0 then (incf i)
          do (set-hierarchy x input i)))
  ;; (format t "~a: ~a~%"
  ;;         (class-name (class-of input))
  ;;         (coords input))
  input)

(defun make-body (input &optional (out nil))
  ;; TODO: ugly inefficient hack
  (cond ((null input) (apply #'vector (reverse out)))
        ((listp (car input))
         (make-body (append (pop input) input)
                    out))
        (t (make-body (cdr input)
                      (cons (car input) out)))))

(defun sexp-parse (input)
  (labels ((rec-slots (slots ls &optional (set-slots nil))
             (if (member (car ls) slots)
                 (rec-slots slots (cddr ls)
                            (cons (car ls)
                                  (cons (cadr ls) set-slots)))
                 `(list ,@set-slots :body (make-body (list ,@(rec ls))))))
           (rec (input)
             (cond ((null input) input)
                   ((atom input) input)
                   ((symbolp (car input))
                    (let ((lookup (gethash (car input) *elem-tags*)))
                      (if lookup 
                          `(apply #'make-instance
                                  ',(read-from-string
                                     (format nil "~:@(elem-~a~)" (car input)))
                                  ,(rec-slots lookup (cdr input)))
                          (cons (car input)
                                (mapcar #'rec (cdr input)))))) 
                   ((listp (car input))
                    (cons (rec (car input))
                          (mapcar #'rec (cdr input))))
                   (t (cons (car input)
                            (mapcar #'rec (cdr input)))))))
    (rec input)))

(defmacro with-html (&body body)
  `(make-instance
    'fragment
    :body (vector ,@(sexp-parse body))))

(defmacro with-html-write (stream &body body)
  `(let ((html (with-html ,@body)))
     (values html (html-writer html ,stream))))
