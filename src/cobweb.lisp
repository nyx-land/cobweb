(in-package :cobweb)

(defgeneric set-hierarchy (obj parent index)
  (:documentation "Set the hierachy on initialization.")
  (:method (obj parent index) t))

(defgeneric parse-dom (input)
  (:documentation "Parses the DOM at each node after an element 
has been initiated."))

(defgeneric render (input &key &allow-other-keys)
  (:documentation "Describes how to render an object possibly by applying some
transformations to return the XHTML tree."))

(defmethod initialize-instance :after ((object xhtml)
                                       &key &allow-other-keys)
  (parse-dom object))

(defmethod set-hierarchy ((obj xhtml) (parent xhtml) (index float))
  (setf (parent obj) parent)
  (with-slots (coords) obj
    (setf (coords obj)
          (cons (+ index (car coords))
                (cdr coords)))))

(defmethod parse-dom ((input xhtml))
  (when (and (slot-boundp input 'html-body)
             (not (null (html-body input))))
    (loop for x across (html-body input)
          as i = 0.0 then (+ i 0.1)
          do (set-hierarchy x input i)))
  input)

(defmethod render ((input xhtml-meta) &key &allow-other-keys)
  input
  ;; (apply #'make-instance (class-name input)
  ;;        (cons :coords
  ;;              (cons coords
  ;;                    slots)))
  )

(defmethod render ((input xhtml) &key &allow-other-keys)
  input)

(defun make-body (input &optional (out nil))
  ;; TODO: ugly inefficient hack
  (cond ((null input)
         (if (null out)
             nil
             (apply #'vector (reverse out))))
        ((listp (car input))
         (make-body (append (pop input) input)
                    out))
        (t (make-body (cdr input)
                      (cons (car input) out)))))

(defun sexp-parse (input)
  (labels ((rec-slots (depth slots ls &optional (set-slots nil))
             (if (member (car ls) slots)
                 (rec-slots depth slots (cddr ls)
                            (cons (car ls)
                                  (cons (cadr ls) set-slots)))
                 `(,@set-slots
                   :body (make-body
                          (list ,@(funcall #'rec depth ls))))))
           (rec (depth input)
             (cond ((null input) input)
                   ((atom input) input)
                   ((symbolp (car input))
                    (let ((lookup (gethash (intern (symbol-name (car input)) :keyword)
                                           *elem-tags*))
                          (c+1 (cons (1+ (car depth)) depth)))
                      (if lookup
                          `(render (funcall #'make-instance
                                            ',(car lookup)
                                            :coords ',c+1
                                            ,@(rec-slots
                                               c+1
                                               (cdr lookup)
                                               (cdr input))))
                          (cons (car input)
                                (funcall #'rec depth (cdr input)))))) 
                   ((listp (car input))
                    (cons (funcall #'rec depth (car input))
                          (funcall #'rec depth (cdr input))))
                   (t (cons (car input)
                            (funcall #'rec depth (cdr input)))))))
    (funcall #'rec (list 0.0) input)))

(defmacro with-html (&body body)
  `(progn ,@(sexp-parse body))
  ;;  `(make-instance 'fragment
  ;;                :coords '(0.0)
  ;;                :body (vector ,@(sexp-parse body)))
  )

(defmacro with-html-write (stream &body body)
  `(let ((html (with-html ,@body)))
     (values html (html-writer html ,stream))))
