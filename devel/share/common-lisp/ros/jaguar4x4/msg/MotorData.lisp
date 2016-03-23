; Auto-generated. Do not edit!


(cl:in-package jaguar4x4-msg)


;//! \htmlinclude MotorData.msg.html

(cl:defclass <MotorData> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (motorPower
    :reader motorPower
    :initarg :motorPower
    :type cl:integer
    :initform 0)
   (encoderPos
    :reader encoderPos
    :initarg :encoderPos
    :type cl:integer
    :initform 0)
   (encoderVel
    :reader encoderVel
    :initarg :encoderVel
    :type cl:integer
    :initform 0)
   (encoderDiff
    :reader encoderDiff
    :initarg :encoderDiff
    :type cl:integer
    :initform 0)
   (motorTemp
    :reader motorTemp
    :initarg :motorTemp
    :type cl:float
    :initform 0.0)
   (motorCurrent
    :reader motorCurrent
    :initarg :motorCurrent
    :type cl:float
    :initform 0.0))
)

(cl:defclass MotorData (<MotorData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotorData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotorData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name jaguar4x4-msg:<MotorData> is deprecated: use jaguar4x4-msg:MotorData instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MotorData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jaguar4x4-msg:header-val is deprecated.  Use jaguar4x4-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'motorPower-val :lambda-list '(m))
(cl:defmethod motorPower-val ((m <MotorData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jaguar4x4-msg:motorPower-val is deprecated.  Use jaguar4x4-msg:motorPower instead.")
  (motorPower m))

(cl:ensure-generic-function 'encoderPos-val :lambda-list '(m))
(cl:defmethod encoderPos-val ((m <MotorData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jaguar4x4-msg:encoderPos-val is deprecated.  Use jaguar4x4-msg:encoderPos instead.")
  (encoderPos m))

(cl:ensure-generic-function 'encoderVel-val :lambda-list '(m))
(cl:defmethod encoderVel-val ((m <MotorData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jaguar4x4-msg:encoderVel-val is deprecated.  Use jaguar4x4-msg:encoderVel instead.")
  (encoderVel m))

(cl:ensure-generic-function 'encoderDiff-val :lambda-list '(m))
(cl:defmethod encoderDiff-val ((m <MotorData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jaguar4x4-msg:encoderDiff-val is deprecated.  Use jaguar4x4-msg:encoderDiff instead.")
  (encoderDiff m))

(cl:ensure-generic-function 'motorTemp-val :lambda-list '(m))
(cl:defmethod motorTemp-val ((m <MotorData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jaguar4x4-msg:motorTemp-val is deprecated.  Use jaguar4x4-msg:motorTemp instead.")
  (motorTemp m))

(cl:ensure-generic-function 'motorCurrent-val :lambda-list '(m))
(cl:defmethod motorCurrent-val ((m <MotorData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jaguar4x4-msg:motorCurrent-val is deprecated.  Use jaguar4x4-msg:motorCurrent instead.")
  (motorCurrent m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotorData>) ostream)
  "Serializes a message object of type '<MotorData>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'motorPower)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'encoderPos)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'encoderVel)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'encoderDiff)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'motorTemp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'motorCurrent))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotorData>) istream)
  "Deserializes a message object of type '<MotorData>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'motorPower) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'encoderPos) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'encoderVel) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'encoderDiff) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motorTemp) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motorCurrent) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotorData>)))
  "Returns string type for a message object of type '<MotorData>"
  "jaguar4x4/MotorData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotorData)))
  "Returns string type for a message object of type 'MotorData"
  "jaguar4x4/MotorData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotorData>)))
  "Returns md5sum for a message object of type '<MotorData>"
  "5232fe1210c26e268a1e76fffa8d3933")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotorData)))
  "Returns md5sum for a message object of type 'MotorData"
  "5232fe1210c26e268a1e76fffa8d3933")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotorData>)))
  "Returns full string definition for message of type '<MotorData>"
  (cl:format cl:nil "#motor sensor data message from Dr Robot ~%Header header 	   #timestamp in the header is the time the driver~%int64 motorPower	   # motor driver power from motor driver board~%int64 encoderPos	   #encoder position reading~%int64 encoderVel	   #encoder velocity reading~%int64 encoderDiff	   #encoder position differnece reading referee last reading~%float32 motorTemp   #motor temperature reading~%float32 motorCurrent	  #motor current feedback reading~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotorData)))
  "Returns full string definition for message of type 'MotorData"
  (cl:format cl:nil "#motor sensor data message from Dr Robot ~%Header header 	   #timestamp in the header is the time the driver~%int64 motorPower	   # motor driver power from motor driver board~%int64 encoderPos	   #encoder position reading~%int64 encoderVel	   #encoder velocity reading~%int64 encoderDiff	   #encoder position differnece reading referee last reading~%float32 motorTemp   #motor temperature reading~%float32 motorCurrent	  #motor current feedback reading~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotorData>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
     8
     8
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotorData>))
  "Converts a ROS message object to a list"
  (cl:list 'MotorData
    (cl:cons ':header (header msg))
    (cl:cons ':motorPower (motorPower msg))
    (cl:cons ':encoderPos (encoderPos msg))
    (cl:cons ':encoderVel (encoderVel msg))
    (cl:cons ':encoderDiff (encoderDiff msg))
    (cl:cons ':motorTemp (motorTemp msg))
    (cl:cons ':motorCurrent (motorCurrent msg))
))
