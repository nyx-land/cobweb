(in-package :cobweb)

(defparameter *elem-tags* (make-hash-table))

(defclass xhtml () 
  ((parent    :initarg :parent :accessor parent)
   (depth     :initarg :depth  :accessor depth)
   (html-body :initarg :body   :accessor html-body)
   (tag       :initarg :tag    :accessor tag))
  (:default-initargs
   :body (vector)))

(defclass fragment (xhtml) ()
  (:documentation "An abstract middleware class between XHTML and every
HTML element."))

(defclass non-conforming-features () ())
