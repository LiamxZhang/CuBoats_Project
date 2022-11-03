;; Auto-generated. Do not edit!


(when (boundp 'cuboat_actuators::dock)
  (if (not (find-package "CUBOAT_ACTUATORS"))
    (make-package "CUBOAT_ACTUATORS"))
  (shadow 'dock (find-package "CUBOAT_ACTUATORS")))
(unless (find-package "CUBOAT_ACTUATORS::DOCK")
  (make-package "CUBOAT_ACTUATORS::DOCK"))

(in-package "ROS")
;;//! \htmlinclude dock.msg.html


(defclass cuboat_actuators::dock
  :super ros::object
  :slots (_front _back _left _right ))

(defmethod cuboat_actuators::dock
  (:init
   (&key
    ((:front __front) nil)
    ((:back __back) nil)
    ((:left __left) nil)
    ((:right __right) nil)
    )
   (send-super :init)
   (setq _front __front)
   (setq _back __back)
   (setq _left __left)
   (setq _right __right)
   self)
  (:front
   (&optional (__front :null))
   (if (not (eq __front :null)) (setq _front __front)) _front)
  (:back
   (&optional (__back :null))
   (if (not (eq __back :null)) (setq _back __back)) _back)
  (:left
   (&optional (__left :null))
   (if (not (eq __left :null)) (setq _left __left)) _left)
  (:right
   (&optional (__right :null))
   (if (not (eq __right :null)) (setq _right __right)) _right)
  (:serialization-length
   ()
   (+
    ;; bool _front
    1
    ;; bool _back
    1
    ;; bool _left
    1
    ;; bool _right
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _front
       (if _front (write-byte -1 s) (write-byte 0 s))
     ;; bool _back
       (if _back (write-byte -1 s) (write-byte 0 s))
     ;; bool _left
       (if _left (write-byte -1 s) (write-byte 0 s))
     ;; bool _right
       (if _right (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _front
     (setq _front (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _back
     (setq _back (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _left
     (setq _left (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _right
     (setq _right (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get cuboat_actuators::dock :md5sum-) "18af02cda392c4965ac929bc70f2313c")
(setf (get cuboat_actuators::dock :datatype-) "cuboat_actuators/dock")
(setf (get cuboat_actuators::dock :definition-)
      "bool front
bool back
bool left
bool right

")



(provide :cuboat_actuators/dock "18af02cda392c4965ac929bc70f2313c")


