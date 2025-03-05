(in-package :cobweb)

(defparameter *elem-tags* (make-hash-table))

(defclass xhtml-meta (c2mop:funcallable-standard-class)
  ((is-tag :initarg :is-tag :accessor is-tag))
  (:documentation "The HTML metaclass."))

;; TODO: this precedence is awkward
(defclass fragment-meta (xhtml-meta)
  ((layout :initarg :layout :accessor fragment-layout)))

(defmethod c2mop:validate-superclass  
    ((class xhtml-meta) (super c2mop:funcallable-standard-class))  
  t)

(defmethod c2mop:validate-superclass  
    ((class fragment-meta) (super xhtml-meta))  
  t)

(c2mop:ensure-finalized (find-class 'xhtml-meta))
(c2mop:ensure-finalized (find-class 'fragment-meta))

(defmacro deftag (name &rest attrs)
  `(let ((class-name ',(read-from-string
                        (format nil "~@:(elem-~a~)"
                                name))))
     (defmacro ,name (&body body)
       `(destructuring-bind (&key attrs body)
            ',(parse-attrs body ',attrs)
          (apply #'make-instance ',class-name
                 :body (apply #'vector body)
                 attrs)))))

(defgeneric expose-tag (class key)
  (:documentation "Describes how to make a class parseable."))

(defmethod expose-tag :before ((class xhtml-meta) key)
  (declare (ignore key))
  (c2mop:ensure-finalized class))

(defmethod expose-tag (class (key null))
  t)

(defmethod expose-tag (class key)
  (setf (gethash (is-tag class) *elem-tags*)
        (expose-tag (c2mop:class-slots class) :add-slots))
  t)

(defmethod expose-tag ((slots list) (key (eql :add-slots)))
  (loop for slot in slots
        as slot-name = (symbol-name (c2mop:slot-definition-name slot))
        when (search "ATTR-" slot-name)
          collect (car (c2mop:slot-definition-initargs slot))))

(defmethod expose-tag ((class xhtml-meta) (key (eql :elem)))
  (let ((tag (intern (subseq (symbol-name (class-name class)) 5) :keyword)))
    (setf (gethash tag *elem-tags*)
          (cons (class-name class)
                (expose-tag (c2mop:class-slots class) :add-slots)))
    t))

(defmethod initialize-instance :after ((class xhtml-meta)
                                       &key (tag '(:elem)) &allow-other-keys)
  (setf (is-tag class) tag)
  (expose-tag class (car tag)))

(defmethod reinitialize-instance :after ((class xhtml-meta)
                                         &key (tag '(:elem)) &allow-other-keys)
  (setf (is-tag class) tag)
  (expose-tag class (car tag)))

(defclass fragment ()
  ((parent    :initarg :parent :accessor parent)
   (coords    :initarg :coords :accessor coords)
   (html-body :initarg :body   :accessor html-body))
  (:metaclass fragment-meta)
  (:documentation "An abstract middleware class between XHTML and every
HTML element.")
  (:tag nil))

(defclass xhtml (fragment) ()
  (:metaclass xhtml-meta)
  (:tag nil)
  (:default-initargs
   :parent :root))

(defclass non-conforming-features () ()
  (:metaclass xhtml-meta)
  (:tag nil))
