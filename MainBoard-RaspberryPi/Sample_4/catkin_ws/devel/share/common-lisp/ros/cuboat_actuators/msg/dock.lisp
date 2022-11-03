; Auto-generated. Do not edit!


(cl:in-package cuboat_actuators-msg)


;//! \htmlinclude dock.msg.html

(cl:defclass <dock> (roslisp-msg-protocol:ros-message)
  ((front
    :reader front
    :initarg :front
    :type cl:boolean
    :initform cl:nil)
   (back
    :reader back
    :initarg :back
    :type cl:boolean
    :initform cl:nil)
   (left
    :reader left
    :initarg :left
    :type cl:boolean
    :initform cl:nil)
   (right
    :reader right
    :initarg :right
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass dock (<dock>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <dock>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'dock)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cuboat_actuators-msg:<dock> is deprecated: use cuboat_actuators-msg:dock instead.")))

(cl:ensure-generic-function 'front-val :lambda-list '(m))
(cl:defmethod front-val ((m <dock>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cuboat_actuators-msg:front-val is deprecated.  Use cuboat_actuators-msg:front instead.")
  (front m))

(cl:ensure-generic-function 'back-val :lambda-list '(m))
(cl:defmethod back-val ((m <dock>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cuboat_actuators-msg:back-val is deprecated.  Use cuboat_actuators-msg:back instead.")
  (back m))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <dock>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cuboat_actuators-msg:left-val is deprecated.  Use cuboat_actuators-msg:left instead.")
  (left m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <dock>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cuboat_actuators-msg:right-val is deprecated.  Use cuboat_actuators-msg:right instead.")
  (right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <dock>) ostream)
  "Serializes a message object of type '<dock>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'front) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'back) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'left) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'right) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <dock>) istream)
  "Deserializes a message object of type '<dock>"
    (cl:setf (cl:slot-value msg 'front) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'back) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'left) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'right) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<dock>)))
  "Returns string type for a message object of type '<dock>"
  "cuboat_actuators/dock")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'dock)))
  "Returns string type for a message object of type 'dock"
  "cuboat_actuators/dock")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<dock>)))
  "Returns md5sum for a message object of type '<dock>"
  "18af02cda392c4965ac929bc70f2313c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'dock)))
  "Returns md5sum for a message object of type 'dock"
  "18af02cda392c4965ac929bc70f2313c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<dock>)))
  "Returns full string definition for message of type '<dock>"
  (cl:format cl:nil "bool front~%bool back~%bool left~%bool right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'dock)))
  "Returns full string definition for message of type 'dock"
  (cl:format cl:nil "bool front~%bool back~%bool left~%bool right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <dock>))
  (cl:+ 0
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <dock>))
  "Converts a ROS message object to a list"
  (cl:list 'dock
    (cl:cons ':front (front msg))
    (cl:cons ':back (back msg))
    (cl:cons ':left (left msg))
    (cl:cons ':right (right msg))
))
