; Auto-generated. Do not edit!


(cl:in-package multivessel_msgs-msg)


;//! \htmlinclude Perception.msg.html

(cl:defclass <Perception> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (vessel_poses
    :reader vessel_poses
    :initarg :vessel_poses
    :type (cl:vector multivessel_msgs-msg:VesselPose)
   :initform (cl:make-array 0 :element-type 'multivessel_msgs-msg:VesselPose :initial-element (cl:make-instance 'multivessel_msgs-msg:VesselPose))))
)

(cl:defclass Perception (<Perception>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Perception>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Perception)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name multivessel_msgs-msg:<Perception> is deprecated: use multivessel_msgs-msg:Perception instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Perception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multivessel_msgs-msg:header-val is deprecated.  Use multivessel_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'vessel_poses-val :lambda-list '(m))
(cl:defmethod vessel_poses-val ((m <Perception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multivessel_msgs-msg:vessel_poses-val is deprecated.  Use multivessel_msgs-msg:vessel_poses instead.")
  (vessel_poses m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Perception>) ostream)
  "Serializes a message object of type '<Perception>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'vessel_poses))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'vessel_poses))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Perception>) istream)
  "Deserializes a message object of type '<Perception>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'vessel_poses) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'vessel_poses)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'multivessel_msgs-msg:VesselPose))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Perception>)))
  "Returns string type for a message object of type '<Perception>"
  "multivessel_msgs/Perception")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Perception)))
  "Returns string type for a message object of type 'Perception"
  "multivessel_msgs/Perception")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Perception>)))
  "Returns md5sum for a message object of type '<Perception>"
  "695ac89c2af7449068e335be2fb795dc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Perception)))
  "Returns md5sum for a message object of type 'Perception"
  "695ac89c2af7449068e335be2fb795dc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Perception>)))
  "Returns full string definition for message of type '<Perception>"
  (cl:format cl:nil "Header header~%multivessel_msgs/VesselPose[] vessel_poses~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: multivessel_msgs/VesselPose~%# Vessel pose information with vessel detail.~%int64 vessel_id~%multivessel_msgs/VesselDetails vessel_details~%geometry_msgs/Point position~%geometry_msgs/Quaternion orientation~%================================================================================~%MSG: multivessel_msgs/VesselDetails~%# Details of a vessel such as name, lenght, width etc. which could also be found in AIS data.~%int64 vessel_id~%std_msgs/String CallSign~%int64 Cargo~%float64 Draft~%std_msgs/String IMO~%float64 Length~%std_msgs/String MMSI~%std_msgs/String TransceiverClass~%std_msgs/String VesselName~%int64 VesselType~%float64 Width~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Perception)))
  "Returns full string definition for message of type 'Perception"
  (cl:format cl:nil "Header header~%multivessel_msgs/VesselPose[] vessel_poses~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: multivessel_msgs/VesselPose~%# Vessel pose information with vessel detail.~%int64 vessel_id~%multivessel_msgs/VesselDetails vessel_details~%geometry_msgs/Point position~%geometry_msgs/Quaternion orientation~%================================================================================~%MSG: multivessel_msgs/VesselDetails~%# Details of a vessel such as name, lenght, width etc. which could also be found in AIS data.~%int64 vessel_id~%std_msgs/String CallSign~%int64 Cargo~%float64 Draft~%std_msgs/String IMO~%float64 Length~%std_msgs/String MMSI~%std_msgs/String TransceiverClass~%std_msgs/String VesselName~%int64 VesselType~%float64 Width~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Perception>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'vessel_poses) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Perception>))
  "Converts a ROS message object to a list"
  (cl:list 'Perception
    (cl:cons ':header (header msg))
    (cl:cons ':vessel_poses (vessel_poses msg))
))
