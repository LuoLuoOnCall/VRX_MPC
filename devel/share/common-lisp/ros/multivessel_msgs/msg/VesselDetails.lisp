; Auto-generated. Do not edit!


(cl:in-package multivessel_msgs-msg)


;//! \htmlinclude VesselDetails.msg.html

(cl:defclass <VesselDetails> (roslisp-msg-protocol:ros-message)
  ((vessel_id
    :reader vessel_id
    :initarg :vessel_id
    :type cl:integer
    :initform 0)
   (CallSign
    :reader CallSign
    :initarg :CallSign
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String))
   (Cargo
    :reader Cargo
    :initarg :Cargo
    :type cl:integer
    :initform 0)
   (Draft
    :reader Draft
    :initarg :Draft
    :type cl:float
    :initform 0.0)
   (IMO
    :reader IMO
    :initarg :IMO
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String))
   (Length
    :reader Length
    :initarg :Length
    :type cl:float
    :initform 0.0)
   (MMSI
    :reader MMSI
    :initarg :MMSI
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String))
   (TransceiverClass
    :reader TransceiverClass
    :initarg :TransceiverClass
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String))
   (VesselName
    :reader VesselName
    :initarg :VesselName
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String))
   (VesselType
    :reader VesselType
    :initarg :VesselType
    :type cl:integer
    :initform 0)
   (Width
    :reader Width
    :initarg :Width
    :type cl:float
    :initform 0.0))
)

(cl:defclass VesselDetails (<VesselDetails>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VesselDetails>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VesselDetails)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name multivessel_msgs-msg:<VesselDetails> is deprecated: use multivessel_msgs-msg:VesselDetails instead.")))

(cl:ensure-generic-function 'vessel_id-val :lambda-list '(m))
(cl:defmethod vessel_id-val ((m <VesselDetails>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multivessel_msgs-msg:vessel_id-val is deprecated.  Use multivessel_msgs-msg:vessel_id instead.")
  (vessel_id m))

(cl:ensure-generic-function 'CallSign-val :lambda-list '(m))
(cl:defmethod CallSign-val ((m <VesselDetails>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multivessel_msgs-msg:CallSign-val is deprecated.  Use multivessel_msgs-msg:CallSign instead.")
  (CallSign m))

(cl:ensure-generic-function 'Cargo-val :lambda-list '(m))
(cl:defmethod Cargo-val ((m <VesselDetails>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multivessel_msgs-msg:Cargo-val is deprecated.  Use multivessel_msgs-msg:Cargo instead.")
  (Cargo m))

(cl:ensure-generic-function 'Draft-val :lambda-list '(m))
(cl:defmethod Draft-val ((m <VesselDetails>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multivessel_msgs-msg:Draft-val is deprecated.  Use multivessel_msgs-msg:Draft instead.")
  (Draft m))

(cl:ensure-generic-function 'IMO-val :lambda-list '(m))
(cl:defmethod IMO-val ((m <VesselDetails>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multivessel_msgs-msg:IMO-val is deprecated.  Use multivessel_msgs-msg:IMO instead.")
  (IMO m))

(cl:ensure-generic-function 'Length-val :lambda-list '(m))
(cl:defmethod Length-val ((m <VesselDetails>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multivessel_msgs-msg:Length-val is deprecated.  Use multivessel_msgs-msg:Length instead.")
  (Length m))

(cl:ensure-generic-function 'MMSI-val :lambda-list '(m))
(cl:defmethod MMSI-val ((m <VesselDetails>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multivessel_msgs-msg:MMSI-val is deprecated.  Use multivessel_msgs-msg:MMSI instead.")
  (MMSI m))

(cl:ensure-generic-function 'TransceiverClass-val :lambda-list '(m))
(cl:defmethod TransceiverClass-val ((m <VesselDetails>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multivessel_msgs-msg:TransceiverClass-val is deprecated.  Use multivessel_msgs-msg:TransceiverClass instead.")
  (TransceiverClass m))

(cl:ensure-generic-function 'VesselName-val :lambda-list '(m))
(cl:defmethod VesselName-val ((m <VesselDetails>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multivessel_msgs-msg:VesselName-val is deprecated.  Use multivessel_msgs-msg:VesselName instead.")
  (VesselName m))

(cl:ensure-generic-function 'VesselType-val :lambda-list '(m))
(cl:defmethod VesselType-val ((m <VesselDetails>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multivessel_msgs-msg:VesselType-val is deprecated.  Use multivessel_msgs-msg:VesselType instead.")
  (VesselType m))

(cl:ensure-generic-function 'Width-val :lambda-list '(m))
(cl:defmethod Width-val ((m <VesselDetails>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multivessel_msgs-msg:Width-val is deprecated.  Use multivessel_msgs-msg:Width instead.")
  (Width m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VesselDetails>) ostream)
  "Serializes a message object of type '<VesselDetails>"
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
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'CallSign) ostream)
  (cl:let* ((signed (cl:slot-value msg 'Cargo)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Draft))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'IMO) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Length))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'MMSI) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'TransceiverClass) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'VesselName) ostream)
  (cl:let* ((signed (cl:slot-value msg 'VesselType)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VesselDetails>) istream)
  "Deserializes a message object of type '<VesselDetails>"
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
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'CallSign) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Cargo) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Draft) (roslisp-utils:decode-double-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'IMO) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Length) (roslisp-utils:decode-double-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'MMSI) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'TransceiverClass) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'VesselName) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'VesselType) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Width) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VesselDetails>)))
  "Returns string type for a message object of type '<VesselDetails>"
  "multivessel_msgs/VesselDetails")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VesselDetails)))
  "Returns string type for a message object of type 'VesselDetails"
  "multivessel_msgs/VesselDetails")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VesselDetails>)))
  "Returns md5sum for a message object of type '<VesselDetails>"
  "0022f29c59d319c4a2b71911144da0cf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VesselDetails)))
  "Returns md5sum for a message object of type 'VesselDetails"
  "0022f29c59d319c4a2b71911144da0cf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VesselDetails>)))
  "Returns full string definition for message of type '<VesselDetails>"
  (cl:format cl:nil "# Details of a vessel such as name, lenght, width etc. which could also be found in AIS data.~%int64 vessel_id~%std_msgs/String CallSign~%int64 Cargo~%float64 Draft~%std_msgs/String IMO~%float64 Length~%std_msgs/String MMSI~%std_msgs/String TransceiverClass~%std_msgs/String VesselName~%int64 VesselType~%float64 Width~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VesselDetails)))
  "Returns full string definition for message of type 'VesselDetails"
  (cl:format cl:nil "# Details of a vessel such as name, lenght, width etc. which could also be found in AIS data.~%int64 vessel_id~%std_msgs/String CallSign~%int64 Cargo~%float64 Draft~%std_msgs/String IMO~%float64 Length~%std_msgs/String MMSI~%std_msgs/String TransceiverClass~%std_msgs/String VesselName~%int64 VesselType~%float64 Width~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VesselDetails>))
  (cl:+ 0
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'CallSign))
     8
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'IMO))
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'MMSI))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'TransceiverClass))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'VesselName))
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VesselDetails>))
  "Converts a ROS message object to a list"
  (cl:list 'VesselDetails
    (cl:cons ':vessel_id (vessel_id msg))
    (cl:cons ':CallSign (CallSign msg))
    (cl:cons ':Cargo (Cargo msg))
    (cl:cons ':Draft (Draft msg))
    (cl:cons ':IMO (IMO msg))
    (cl:cons ':Length (Length msg))
    (cl:cons ':MMSI (MMSI msg))
    (cl:cons ':TransceiverClass (TransceiverClass msg))
    (cl:cons ':VesselName (VesselName msg))
    (cl:cons ':VesselType (VesselType msg))
    (cl:cons ':Width (Width msg))
))
