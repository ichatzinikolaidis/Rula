; Auto-generated. Do not edit!


(cl:in-package jaguar4x4-msg)


;//! \htmlinclude MotorBoardInfo.msg.html

(cl:defclass <MotorBoardInfo> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (status
    :reader status
    :initarg :status
    :type cl:integer
    :initform 0)
   (temp1
    :reader temp1
    :initarg :temp1
    :type cl:float
    :initform 0.0)
   (temp2
    :reader temp2
    :initarg :temp2
    :type cl:float
    :initform 0.0)
   (temp3
    :reader temp3
    :initarg :temp3
    :type cl:float
    :initform 0.0)
   (volMain
    :reader volMain
    :initarg :volMain
    :type cl:float
    :initform 0.0)
   (vol12V
    :reader vol12V
    :initarg :vol12V
    :type cl:float
    :initform 0.0)
   (vol5V
    :reader vol5V
    :initarg :vol5V
    :type cl:float
    :initform 0.0)
   (dinput
    :reader dinput
    :initarg :dinput
    :type cl:integer
    :initform 0)
   (doutput
    :reader doutput
    :initarg :doutput
    :type cl:integer
    :initform 0)
   (ack
    :reader ack
    :initarg :ack
    :type cl:integer
    :initform 0))
)

(cl:defclass MotorBoardInfo (<MotorBoardInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotorBoardInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotorBoardInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name jaguar4x4-msg:<MotorBoardInfo> is deprecated: use jaguar4x4-msg:MotorBoardInfo instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MotorBoardInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jaguar4x4-msg:header-val is deprecated.  Use jaguar4x4-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <MotorBoardInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jaguar4x4-msg:status-val is deprecated.  Use jaguar4x4-msg:status instead.")
  (status m))

(cl:ensure-generic-function 'temp1-val :lambda-list '(m))
(cl:defmethod temp1-val ((m <MotorBoardInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jaguar4x4-msg:temp1-val is deprecated.  Use jaguar4x4-msg:temp1 instead.")
  (temp1 m))

(cl:ensure-generic-function 'temp2-val :lambda-list '(m))
(cl:defmethod temp2-val ((m <MotorBoardInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jaguar4x4-msg:temp2-val is deprecated.  Use jaguar4x4-msg:temp2 instead.")
  (temp2 m))

(cl:ensure-generic-function 'temp3-val :lambda-list '(m))
(cl:defmethod temp3-val ((m <MotorBoardInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jaguar4x4-msg:temp3-val is deprecated.  Use jaguar4x4-msg:temp3 instead.")
  (temp3 m))

(cl:ensure-generic-function 'volMain-val :lambda-list '(m))
(cl:defmethod volMain-val ((m <MotorBoardInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jaguar4x4-msg:volMain-val is deprecated.  Use jaguar4x4-msg:volMain instead.")
  (volMain m))

(cl:ensure-generic-function 'vol12V-val :lambda-list '(m))
(cl:defmethod vol12V-val ((m <MotorBoardInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jaguar4x4-msg:vol12V-val is deprecated.  Use jaguar4x4-msg:vol12V instead.")
  (vol12V m))

(cl:ensure-generic-function 'vol5V-val :lambda-list '(m))
(cl:defmethod vol5V-val ((m <MotorBoardInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jaguar4x4-msg:vol5V-val is deprecated.  Use jaguar4x4-msg:vol5V instead.")
  (vol5V m))

(cl:ensure-generic-function 'dinput-val :lambda-list '(m))
(cl:defmethod dinput-val ((m <MotorBoardInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jaguar4x4-msg:dinput-val is deprecated.  Use jaguar4x4-msg:dinput instead.")
  (dinput m))

(cl:ensure-generic-function 'doutput-val :lambda-list '(m))
(cl:defmethod doutput-val ((m <MotorBoardInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jaguar4x4-msg:doutput-val is deprecated.  Use jaguar4x4-msg:doutput instead.")
  (doutput m))

(cl:ensure-generic-function 'ack-val :lambda-list '(m))
(cl:defmethod ack-val ((m <MotorBoardInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jaguar4x4-msg:ack-val is deprecated.  Use jaguar4x4-msg:ack instead.")
  (ack m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotorBoardInfo>) ostream)
  "Serializes a message object of type '<MotorBoardInfo>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'status)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'temp1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'temp2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'temp3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'volMain))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vol12V))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vol5V))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dinput)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'dinput)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'dinput)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'dinput)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'doutput)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'doutput)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'doutput)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'doutput)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'ack)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotorBoardInfo>) istream)
  "Deserializes a message object of type '<MotorBoardInfo>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'status)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'temp1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'temp2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'temp3) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'volMain) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vol12V) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vol5V) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dinput)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'dinput)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'dinput)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'dinput)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'doutput)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'doutput)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'doutput)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'doutput)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ack) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotorBoardInfo>)))
  "Returns string type for a message object of type '<MotorBoardInfo>"
  "jaguar4x4/MotorBoardInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotorBoardInfo)))
  "Returns string type for a message object of type 'MotorBoardInfo"
  "jaguar4x4/MotorBoardInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotorBoardInfo>)))
  "Returns md5sum for a message object of type '<MotorBoardInfo>"
  "36cf7e6578c8ea959b3e6f20802b9a94")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotorBoardInfo)))
  "Returns md5sum for a message object of type 'MotorBoardInfo"
  "36cf7e6578c8ea959b3e6f20802b9a94")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotorBoardInfo>)))
  "Returns full string definition for message of type '<MotorBoardInfo>"
  (cl:format cl:nil "#this is used for Motor Driver board info~%Header header 	  #std_msg header~%uint32 status	  # as described in motor driver board manual~%float32 temp1	  # temperature 1, internal chip temperature~%float32 temp2	  # driver channel 1 temperature~%float32 temp3	  # driver channel 2 temperature~%float32 volMain  # main power voltage, default is battery voltage~%float32 vol12V	  # 12V power ~%float32 vol5V	  # 5V power~%uint32 dinput	  # digital input, not used now~%uint32 doutput	  # digital output, not used now~%int32 ack	  # 0- right command received(receive \"+\") -1 wrong(\"-\")~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotorBoardInfo)))
  "Returns full string definition for message of type 'MotorBoardInfo"
  (cl:format cl:nil "#this is used for Motor Driver board info~%Header header 	  #std_msg header~%uint32 status	  # as described in motor driver board manual~%float32 temp1	  # temperature 1, internal chip temperature~%float32 temp2	  # driver channel 1 temperature~%float32 temp3	  # driver channel 2 temperature~%float32 volMain  # main power voltage, default is battery voltage~%float32 vol12V	  # 12V power ~%float32 vol5V	  # 5V power~%uint32 dinput	  # digital input, not used now~%uint32 doutput	  # digital output, not used now~%int32 ack	  # 0- right command received(receive \"+\") -1 wrong(\"-\")~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotorBoardInfo>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotorBoardInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'MotorBoardInfo
    (cl:cons ':header (header msg))
    (cl:cons ':status (status msg))
    (cl:cons ':temp1 (temp1 msg))
    (cl:cons ':temp2 (temp2 msg))
    (cl:cons ':temp3 (temp3 msg))
    (cl:cons ':volMain (volMain msg))
    (cl:cons ':vol12V (vol12V msg))
    (cl:cons ':vol5V (vol5V msg))
    (cl:cons ':dinput (dinput msg))
    (cl:cons ':doutput (doutput msg))
    (cl:cons ':ack (ack msg))
))
