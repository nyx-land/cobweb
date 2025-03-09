(defsystem "cobweb"
  :depends-on ("closer-mop")
  :serial t
  :components
  ((:module "src"
    :components ((:file "core")
                 (:file "spec")
                 (:file "user")))))
