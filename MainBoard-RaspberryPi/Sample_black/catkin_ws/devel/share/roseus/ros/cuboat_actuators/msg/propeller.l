;; Auto-generated. Do not edit!


(when (boundp 'cuboat_actuators::propeller)
  (if (not (find-package "CUBOAT_ACTUATORS"))
    (make-package "CUBOAT_ACTUATORS"))
  (shadow 'propeller (find-package "CUBOAT_ACTUATORS")))
(unless (find-package "CUBOAT_ACTUATORS::PROPELLER")
  (make-package "CUBOAT_ACTUATORS::PROPELLER"))

(in-package "ROS")
;;//! \htmlinclude propeller.msg.html


(defclass cuboat_actuators::propeller
  :super ros::object
  :slots (_front _back _left _right ))

(defmethod cuboat_actuators::propeller
  (:init
   (&key
    ((:front __front) 0)
    ((:back __back) 0)
    ((:left __left) 0)
    ((:right __right) 0)
    )
   (send-super :init)
   (setq _front (round __front))
   (setq _back (round __back))
   (setq _left (round __left))
   (setq _right (round __right))
   self)
  (:front
   (&optional __front)
   (if __front (setq _front __front)) _front)
  (:back
   (&optional __back)
   (if __back (setq _back __back)) _back)
  (:left
   (&optional __left)
   (if __left (setq _left __left)) _left)
  (:right
   (&optional __right)
   (if __right (setq _right __right)) _right)
  (:serialization-length
   ()
   (+
    ;; uint16 _front
    2
    ;; uint16 _back
    2
    ;; uint16 _left
    2
    ;; uint16 _right
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _front
       (write-word _front s)
     ;; uint16 _back
       (write-word _back s)
     ;; uint16 _left
       (write-word _left s)
     ;; uint16 _right
       (write-word _right s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _front
     (setq _front (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _back
     (setq _back (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _left
     (setq _left (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _right
     (setq _right (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get cuboat_actuators::propeller :md5sum-) "6a6f565cf70a0be5a8e5d7b7cab7b826")
(setf (get cuboat_actuators::propeller :datatype-) "cuboat_actuators/propeller")
(setf (get cuboat_actuators::propeller :definition-)
      "uint16 front
uint16 back
uint16 left
uint16 right

")



(provide :cuboat_actuators/propeller "6a6f565cf70a0be5a8e5d7b7cab7b826")


