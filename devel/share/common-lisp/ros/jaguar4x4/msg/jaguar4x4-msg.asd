
(cl:in-package :asdf)

(defsystem "jaguar4x4-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "MotorDataArray" :depends-on ("_package_MotorDataArray"))
    (:file "_package_MotorDataArray" :depends-on ("_package"))
    (:file "MotorBoardInfoArray" :depends-on ("_package_MotorBoardInfoArray"))
    (:file "_package_MotorBoardInfoArray" :depends-on ("_package"))
    (:file "GPSInfo" :depends-on ("_package_GPSInfo"))
    (:file "_package_GPSInfo" :depends-on ("_package"))
    (:file "MotorBoardInfo" :depends-on ("_package_MotorBoardInfo"))
    (:file "_package_MotorBoardInfo" :depends-on ("_package"))
    (:file "MotorData" :depends-on ("_package_MotorData"))
    (:file "_package_MotorData" :depends-on ("_package"))
  ))