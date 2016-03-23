; Auto-generated. Do not edit!


(cl:in-package jaguar4x4-msg)


;//! \htmlinclude MotorBoardInfoArray.msg.html

(cl:defclass <MotorBoardInfoArray> (roslisp-msg-protocol:ros-message)
  ((motorBoardInfo
    :reader motorBoardInfo
    :initarg :motorBoardInfo
    :type (cl:vector jaguar4x4-msg:MotorBoardInfo)
   :initform (cl:make-array 0 :element-type 'jaguar4x4-msg:MotorBoardInfo :initial-element (cl:make-instance 'jaguar4x4-msg:MotorBoardInfo))))
)

(cl:defclass MotorBoardInfoArray (<MotorBoardInfoArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotorBoardInfoArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotorBoardInfoArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name jaguar4x4-msg:<MotorBoardInfoArray> is deprecated: use jaguar4x4-msg:MotorBoardInfoArray instead.")))

(cl:ensure-generic-function 'motorBoardInfo-val :lambda-list '(m))
(cl:defmethod motorBoardInfo-val ((m <MotorBoardInfoArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jaguar4x4-msg:motorBoardInfo-val is deprecated.  Use jaguar4x4-msg:motorBoardInfo instead.")
  (motorBoardInfo m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotorBoardInfoArray>) ostream)
  "Serializes a message object of type '<MotorBoardInfoArray>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'motorBoardInfo))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'motorBoardInfo))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotorBoardInfoArray>) istream)
  "Deserializes a message object of type '<MotorBoardInfoArray>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'motorBoardInfo) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'motorBoardInfo)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'jaguar4x4-msg:MotorBoardInfo))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotorBoardInfoArray>)))
  "Returns string type for a message object of type '<MotorBoardInfoArray>"
  "jaguar4x4/MotorBoardInfoArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotorBoardInfoArray)))
  "Returns string type for a message object of type 'MotorBoardInfoArray"
  "jaguar4x4/MotorBoardInfoArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotorBoardInfoArray>)))
  "Returns md5sum for a message object of type '<MotorBoardInfoArray>"
  "6532c9526c8bda45f78d29208d92e7a5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotorBoardInfoArray)))
  "Returns md5sum for a message object of type 'MotorBoardInfoArray"
  "6532c9526c8bda45f78d29208d92e7a5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotorBoardInfoArray>)))
  "Returns full string definition for message of type '<MotorBoardInfoArray>"
  (cl:format cl:nil "# array of motor driver boards~%MotorBoardInfo[] motorBoardInfo~%~%================================================================================~%MSG: jaguar4x4/MotorBoardInfo~%#this is used for Motor Driver board info~%Header header 	  #std_msg header~%uint32 status	  # as described in motor driver board manual~%float32 temp1	  # temperature 1, internal chip temperature~%float32 temp2	  # driver channel 1 temperature~%float32 temp3	  # driver channel 2 temperature~%float32 volMain  # main power voltage, default is battery voltage~%float32 vol12V	  # 12V power ~%float32 vol5V	  # 5V power~%uint32 dinput	  # digital input, not used now~%uint32 doutput	  # digital output, not used now~%int32 ack	  # 0- right command received(receive \"+\") -1 wrong(\"-\")~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotorBoardInfoArray)))
  "Returns full string definition for message of type 'MotorBoardInfoArray"
  (cl:format cl:nil "# array of motor driver boards~%MotorBoardInfo[] motorBoardInfo~%~%================================================================================~%MSG: jaguar4x4/MotorBoardInfo~%#this is used for Motor Driver board info~%Header header 	  #std_msg header~%uint32 status	  # as described in motor driver board manual~%float32 temp1	  # temperature 1, internal chip temperature~%float32 temp2	  # driver channel 1 temperature~%float32 temp3	  # driver channel 2 temperature~%float32 volMain  # main power voltage, default is battery voltage~%float32 vol12V	  # 12V power ~%float32 vol5V	  # 5V power~%uint32 dinput	  # digital input, not used now~%uint32 doutput	  # digital output, not used now~%int32 ack	  # 0- right command received(receive \"+\") -1 wrong(\"-\")~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotorBoardInfoArray>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'motorBoardInfo) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotorBoardInfoArray>))
  "Converts a ROS message object to a list"
  (cl:list 'MotorBoardInfoArray
    (cl:cons ':motorBoardInfo (motorBoardInfo msg))
))
