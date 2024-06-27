(defsystem "cobweb"
  :depends-on ("closer-mop")
  :components
  ((:module "src"
    :components ((:file "package")
                 (:file "spec")
                 (:file "util")
                 (:file "print")
                 (:file "cobweb")))))
