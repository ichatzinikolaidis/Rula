; Auto-generated. Do not edit!


(cl:in-package jaguar4x4-msg)


;//! \htmlinclude MotorDataArray.msg.html

(cl:defclass <MotorDataArray> (roslisp-msg-protocol:ros-message)
  ((motorData
    :reader motorData
    :initarg :motorData
    :type (cl:vector jaguar4x4-msg:MotorData)
   :initform (cl:make-array 0 :element-type 'jaguar4x4-msg:MotorData :initial-element (cl:make-instance 'jaguar4x4-msg:MotorData))))
)

(cl:defclass MotorDataArray (<MotorDataArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotorDataArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotorDataArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name jaguar4x4-msg:<MotorDataArray> is deprecated: use jaguar4x4-msg:MotorDataArray instead.")))

(cl:ensure-generic-function 'motorData-val :lambda-list '(m))
(cl:defmethod motorData-val ((m <MotorDataArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jaguar4x4-msg:motorData-val is deprecated.  Use jaguar4x4-msg:motorData instead.")
  (motorData m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotorDataArray>) ostream)
  "Serializes a message object of type '<MotorDataArray>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'motorData))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'motorData))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotorDataArray>) istream)
  "Deserializes a message object of type '<MotorDataArray>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'motorData) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'motorData)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'jaguar4x4-msg:MotorData))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotorDataArray>)))
  "Returns string type for a message object of type '<MotorDataArray>"
  "jaguar4x4/MotorDataArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotorDataArray)))
  "Returns string type for a message object of type 'MotorDataArray"
  "jaguar4x4/MotorDataArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotorDataArray>)))
  "Returns md5sum for a message object of type '<MotorDataArray>"
  "ad620d64c056e380a64d71e49dea0fa7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotorDataArray)))
  "Returns md5sum for a message object of type 'MotorDataArray"
  "ad620d64c056e380a64d71e49dea0fa7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotorDataArray>)))
  "Returns full string definition for message of type '<MotorDataArray>"
  (cl:format cl:nil "#this message will be used for motor data information~%MotorData[] motorData~%================================================================================~%MSG: jaguar4x4/MotorData~%#motor sensor data message from Dr Robot ~%Header header 	   #timestamp in the header is the time the driver~%int64 motorPower	   # motor driver power from motor driver board~%int64 encoderPos	   #encoder position reading~%int64 encoderVel	   #encoder velocity reading~%int64 encoderDiff	   #encoder position differnece reading referee last reading~%float32 motorTemp   #motor temperature reading~%float32 motorCurrent	  #motor current feedback reading~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotorDataArray)))
  "Returns full string definition for message of type 'MotorDataArray"
  (cl:format cl:nil "#this message will be used for motor data information~%MotorData[] motorData~%================================================================================~%MSG: jaguar4x4/MotorData~%#motor sensor data message from Dr Robot ~%Header header 	   #timestamp in the header is the time the driver~%int64 motorPower	   # motor driver power from motor driver board~%int64 encoderPos	   #encoder position reading~%int64 encoderVel	   #encoder velocity reading~%int64 encoderDiff	   #encoder position differnece reading referee last reading~%float32 motorTemp   #motor temperature reading~%float32 motorCurrent	  #motor current feedback reading~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotorDataArray>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'motorData) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotorDataArray>))
  "Converts a ROS message object to a list"
  (cl:list 'MotorDataArray
    (cl:cons ':motorData (motorData msg))
))
