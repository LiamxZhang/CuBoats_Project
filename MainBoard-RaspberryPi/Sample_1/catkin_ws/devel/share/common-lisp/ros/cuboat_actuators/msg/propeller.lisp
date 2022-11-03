; Auto-generated. Do not edit!


(cl:in-package cuboat_actuators-msg)


;//! \htmlinclude propeller.msg.html

(cl:defclass <propeller> (roslisp-msg-protocol:ros-message)
  ((front
    :reader front
    :initarg :front
    :type cl:fixnum
    :initform 0)
   (back
    :reader back
    :initarg :back
    :type cl:fixnum
    :initform 0)
   (left
    :reader left
    :initarg :left
    :type cl:fixnum
    :initform 0)
   (right
    :reader right
    :initarg :right
    :type cl:fixnum
    :initform 0))
)

(cl:defclass propeller (<propeller>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <propeller>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'propeller)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cuboat_actuators-msg:<propeller> is deprecated: use cuboat_actuators-msg:propeller instead.")))

(cl:ensure-generic-function 'front-val :lambda-list '(m))
(cl:defmethod front-val ((m <propeller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cuboat_actuators-msg:front-val is deprecated.  Use cuboat_actuators-msg:front instead.")
  (front m))

(cl:ensure-generic-function 'back-val :lambda-list '(m))
(cl:defmethod back-val ((m <propeller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cuboat_actuators-msg:back-val is deprecated.  Use cuboat_actuators-msg:back instead.")
  (back m))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <propeller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cuboat_actuators-msg:left-val is deprecated.  Use cuboat_actuators-msg:left instead.")
  (left m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <propeller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cuboat_actuators-msg:right-val is deprecated.  Use cuboat_actuators-msg:right instead.")
  (right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <propeller>) ostream)
  "Serializes a message object of type '<propeller>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'front)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'front)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'back)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'back)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'left)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'left)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'right)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'right)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <propeller>) istream)
  "Deserializes a message object of type '<propeller>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'front)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'front)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'back)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'back)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'left)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'left)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'right)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'right)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<propeller>)))
  "Returns string type for a message object of type '<propeller>"
  "cuboat_actuators/propeller")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'propeller)))
  "Returns string type for a message object of type 'propeller"
  "cuboat_actuators/propeller")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<propeller>)))
  "Returns md5sum for a message object of type '<propeller>"
  "6a6f565cf70a0be5a8e5d7b7cab7b826")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'propeller)))
  "Returns md5sum for a message object of type 'propeller"
  "6a6f565cf70a0be5a8e5d7b7cab7b826")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<propeller>)))
  "Returns full string definition for message of type '<propeller>"
  (cl:format cl:nil "uint16 front~%uint16 back~%uint16 left~%uint16 right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'propeller)))
  "Returns full string definition for message of type 'propeller"
  (cl:format cl:nil "uint16 front~%uint16 back~%uint16 left~%uint16 right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <propeller>))
  (cl:+ 0
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <propeller>))
  "Converts a ROS message object to a list"
  (cl:list 'propeller
    (cl:cons ':front (front msg))
    (cl:cons ':back (back msg))
    (cl:cons ':left (left msg))
    (cl:cons ':right (right msg))
))
