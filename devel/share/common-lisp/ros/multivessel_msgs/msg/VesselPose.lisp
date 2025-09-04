; Auto-generated. Do not edit!


(cl:in-package multivessel_msgs-msg)


;//! \htmlinclude VesselPose.msg.html

(cl:defclass <VesselPose> (roslisp-msg-protocol:ros-message)
  ((vessel_id
    :reader vessel_id
    :initarg :vessel_id
    :type cl:integer
    :initform 0)
   (vessel_details
    :reader vessel_details
    :initarg :vessel_details
    :type multivessel_msgs-msg:VesselDetails
    :initform (cl:make-instance 'multivessel_msgs-msg:VesselDetails))
   (position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (orientation
    :reader orientation
    :initarg :orientation
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion)))
)

(cl:defclass VesselPose (<VesselPose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VesselPose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VesselPose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name multivessel_msgs-msg:<VesselPose> is deprecated: use multivessel_msgs-msg:VesselPose instead.")))

(cl:ensure-generic-function 'vessel_id-val :lambda-list '(m))
(cl:defmethod vessel_id-val ((m <VesselPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multivessel_msgs-msg:vessel_id-val is deprecated.  Use multivessel_msgs-msg:vessel_id instead.")
  (vessel_id m))

(cl:ensure-generic-function 'vessel_details-val :lambda-list '(m))
(cl:defmethod vessel_details-val ((m <VesselPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multivessel_msgs-msg:vessel_details-val is deprecated.  Use multivessel_msgs-msg:vessel_details instead.")
  (vessel_details m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <VesselPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multivessel_msgs-msg:position-val is deprecated.  Use multivessel_msgs-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'orientation-val :lambda-list '(m))
(cl:defmethod orientation-val ((m <VesselPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multivessel_msgs-msg:orientation-val is deprecated.  Use multivessel_msgs-msg:orientation instead.")
  (orientation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VesselPose>) ostream)
  "Serializes a message object of type '<VesselPose>"
  (cl:let* ((signed (cl:slot-value msg 'vessel_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'vessel_details) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'orientation) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VesselPose>) istream)
  "Deserializes a message object of type '<VesselPose>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'vessel_id) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'vessel_details) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'orientation) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VesselPose>)))
  "Returns string type for a message object of type '<VesselPose>"
  "multivessel_msgs/VesselPose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VesselPose)))
  "Returns string type for a message object of type 'VesselPose"
  "multivessel_msgs/VesselPose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VesselPose>)))
  "Returns md5sum for a message object of type '<VesselPose>"
  "92ab806db689eaace64c0360e37c19a4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VesselPose)))
  "Returns md5sum for a message object of type 'VesselPose"
  "92ab806db689eaace64c0360e37c19a4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VesselPose>)))
  "Returns full string definition for message of type '<VesselPose>"
  (cl:format cl:nil "# Vessel pose information with vessel detail.~%int64 vessel_id~%multivessel_msgs/VesselDetails vessel_details~%geometry_msgs/Point position~%geometry_msgs/Quaternion orientation~%================================================================================~%MSG: multivessel_msgs/VesselDetails~%# Details of a vessel such as name, lenght, width etc. which could also be found in AIS data.~%int64 vessel_id~%std_msgs/String CallSign~%int64 Cargo~%float64 Draft~%std_msgs/String IMO~%float64 Length~%std_msgs/String MMSI~%std_msgs/String TransceiverClass~%std_msgs/String VesselName~%int64 VesselType~%float64 Width~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VesselPose)))
  "Returns full string definition for message of type 'VesselPose"
  (cl:format cl:nil "# Vessel pose information with vessel detail.~%int64 vessel_id~%multivessel_msgs/VesselDetails vessel_details~%geometry_msgs/Point position~%geometry_msgs/Quaternion orientation~%================================================================================~%MSG: multivessel_msgs/VesselDetails~%# Details of a vessel such as name, lenght, width etc. which could also be found in AIS data.~%int64 vessel_id~%std_msgs/String CallSign~%int64 Cargo~%float64 Draft~%std_msgs/String IMO~%float64 Length~%std_msgs/String MMSI~%std_msgs/String TransceiverClass~%std_msgs/String VesselName~%int64 VesselType~%float64 Width~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VesselPose>))
  (cl:+ 0
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'vessel_details))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'orientation))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VesselPose>))
  "Converts a ROS message object to a list"
  (cl:list 'VesselPose
    (cl:cons ':vessel_id (vessel_id msg))
    (cl:cons ':vessel_details (vessel_details msg))
    (cl:cons ':position (position msg))
    (cl:cons ':orientation (orientation msg))
))
