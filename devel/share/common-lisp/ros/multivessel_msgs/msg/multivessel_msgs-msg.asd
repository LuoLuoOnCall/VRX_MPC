
(cl:in-package :asdf)

(defsystem "multivessel_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Perception" :depends-on ("_package_Perception"))
    (:file "_package_Perception" :depends-on ("_package"))
    (:file "VesselDetails" :depends-on ("_package_VesselDetails"))
    (:file "_package_VesselDetails" :depends-on ("_package"))
    (:file "VesselPose" :depends-on ("_package_VesselPose"))
    (:file "_package_VesselPose" :depends-on ("_package"))
  ))