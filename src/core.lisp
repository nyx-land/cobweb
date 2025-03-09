(defpackage #:cobweb.core
  (:use :cl)
  (:export :*global-attrs*
   :xhtml-meta :fragment-meta
   :fragment :xhtml :html-body
   :parent :tag :deftag :render))

(in-package :cobweb.core)

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

;; (defun parse-attrs (input attrs)
;;   (labels ((rec (input &optional (slots nil))
;;              (let ((i (car input))
;;                    (j (cadr input)))
;;                (if (and (keywordp i)
;;                         (member i attrs))
;;                    (rec (cddr input) (cons i (cons j slots)))
;;                    ;;(cons i (cons j (rec (cddr input))))
;;                    `(list ,@slots :body (vector ,@input))
;;                    ;;(list :slots slots) (list :body `(vector ,@input))
;;                    ))))
;;     (rec input)))

(defvar *global-attrs*
  '(slot id class popovertargetaction
    popovertarget popover draggable enterkeyhint inputmode autocorrect
    autocapitalize writingsuggestions spellcheck contenteditable accesskey
    autofocus hidden itemprop itemref itemid itemtype itemscope is style dir
    translate lang title))

(defclass xhtml-meta (c2mop:funcallable-standard-class)
  ((tag :initarg :tag :accessor tag))
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

(defmacro deftag (name supers tag &rest attrs)
  `(values
    (defclass ,(make-class-name name) ,supers
      ,(make-slots attrs)
      (:metaclass xhtml-meta)
      (:tag ,tag))
    (when ,tag
      (defmacro ,name ((&rest attrs
                        &key ,@(remove-duplicates
                                (append attrs *global-attrs*)))
                       &body body)
        (declare (ignorable ,@attrs ,@*global-attrs*))
        (let ((class-name ',(make-class-name name)))
          `(render (apply #'make-instance ',class-name
                          :body (apply #'vector (list ,@body))
                          (list ,@attrs))))))))

(defmethod initialize-instance :after ((class xhtml-meta)
                                       &key (tag t) &allow-other-keys)
  (setf (tag class) tag))

(defmethod reinitialize-instance :after ((class xhtml-meta)
                                         &key (tag t) &allow-other-keys)
  (setf (tag class) tag))

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

(defgeneric render (input &key &allow-other-keys)
  (:documentation "Describes how to render an object possibly by applying some
transformations to return the XHTML tree.")
  (:method ((input xhtml) &key &allow-other-keys)
    input))
