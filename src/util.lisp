(in-package :cobweb)

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

(defun slotkey (x)
  (intern (string x) :keyword))

(defun getattrs (attrs)
  (cons 'list
        (mapcar (lambda (x)
                  `(list ,(slotkey x)
                         `,,x))
                attrs)))

(defun parse-slots (expr attrs)
  (loop for i = 0 then (1+ j)
        for j = (position-if #'keywordp expr :start i)
        while j
        nconcing (when (member (nth j expr) attrs)
                   (list (nth j expr)
                         (nth (1+ j) expr)))))

(defun parse-attrs (input attrs)
  (labels ((rec (input)
             (let ((i (car input)))
               (if (and (keywordp i)
                        (member i attrs))
                   (cons (list i (cadr i))
                         (rec (cddr input)))
                   input))))
    (rec input)))

(defmacro with-attrs (expr attrs &body body)
  (let ((g1 (gensym))
        (g2 (gensym)))
    `(let ((,g1 ',expr)
           (,g2 ',attrs))
       (destructuring-bind (attrs body)
           (loop for i = 0 then (1+ j)
                 for j = (position-if #'keywordp ,g1 :start i)
                 while j
                 nconcing (when (member (nth j ,g1) ,g2)
                            (list (nth j ,g1)
                                  (nth (1+ j) ,g1)))
                   into attrs
                 finally (return (list attrs (cons :body (subseq ,g1 i)))))
         ;; (loop for x in ,expr
         ;;       as i = 1 then (incf i)
         ;;       until (not (and (keywordp x)
         ;;                       (member x ,attrs)))
         ;;       nconcing (list x (nth (1+ i) expr)) into attrs
         ;;       finally (return (list attrs (cons :body (subseq ,expr i)))))
         ,@body))))
