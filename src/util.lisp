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
