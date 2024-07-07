(defsystem "cobweb-gen"
  :depends-on ("drakma" "com.inuoe.jzon" "local-time")
  :components
  ((:module "src"
    :components ((:file "gen")))))
