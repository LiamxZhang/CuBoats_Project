
(cl:in-package :asdf)

(defsystem "cuboat_actuators-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "dock" :depends-on ("_package_dock"))
    (:file "_package_dock" :depends-on ("_package"))
    (:file "propeller" :depends-on ("_package_propeller"))
    (:file "_package_propeller" :depends-on ("_package"))
    (:file "servoAction" :depends-on ("_package_servoAction"))
    (:file "_package_servoAction" :depends-on ("_package"))
    (:file "servoActionFeedback" :depends-on ("_package_servoActionFeedback"))
    (:file "_package_servoActionFeedback" :depends-on ("_package"))
    (:file "servoActionGoal" :depends-on ("_package_servoActionGoal"))
    (:file "_package_servoActionGoal" :depends-on ("_package"))
    (:file "servoActionResult" :depends-on ("_package_servoActionResult"))
    (:file "_package_servoActionResult" :depends-on ("_package"))
    (:file "servoFeedback" :depends-on ("_package_servoFeedback"))
    (:file "_package_servoFeedback" :depends-on ("_package"))
    (:file "servoGoal" :depends-on ("_package_servoGoal"))
    (:file "_package_servoGoal" :depends-on ("_package"))
    (:file "servoResult" :depends-on ("_package_servoResult"))
    (:file "_package_servoResult" :depends-on ("_package"))
  ))