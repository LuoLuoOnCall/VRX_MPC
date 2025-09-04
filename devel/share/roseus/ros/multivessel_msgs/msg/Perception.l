;; Auto-generated. Do not edit!


(when (boundp 'multivessel_msgs::Perception)
  (if (not (find-package "MULTIVESSEL_MSGS"))
    (make-package "MULTIVESSEL_MSGS"))
  (shadow 'Perception (find-package "MULTIVESSEL_MSGS")))
(unless (find-package "MULTIVESSEL_MSGS::PERCEPTION")
  (make-package "MULTIVESSEL_MSGS::PERCEPTION"))

(in-package "ROS")
;;//! \htmlinclude Perception.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass multivessel_msgs::Perception
  :super ros::object
  :slots (_header _vessel_poses ))

(defmethod multivessel_msgs::Perception
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:vessel_poses __vessel_poses) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _vessel_poses __vessel_poses)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:vessel_poses
   (&rest __vessel_poses)
   (if (keywordp (car __vessel_poses))
       (send* _vessel_poses __vessel_poses)
     (progn
       (if __vessel_poses (setq _vessel_poses (car __vessel_poses)))
       _vessel_poses)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; multivessel_msgs/VesselPose[] _vessel_poses
    (apply #'+ (send-all _vessel_poses :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; multivessel_msgs/VesselPose[] _vessel_poses
     (write-long (length _vessel_poses) s)
     (dolist (elem _vessel_poses)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; multivessel_msgs/VesselPose[] _vessel_poses
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _vessel_poses (let (r) (dotimes (i n) (push (instance multivessel_msgs::VesselPose :init) r)) r))
     (dolist (elem- _vessel_poses)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get multivessel_msgs::Perception :md5sum-) "695ac89c2af7449068e335be2fb795dc")
(setf (get multivessel_msgs::Perception :datatype-) "multivessel_msgs/Perception")
(setf (get multivessel_msgs::Perception :definition-)
      "Header header
multivessel_msgs/VesselPose[] vessel_poses

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: multivessel_msgs/VesselPose
# Vessel pose information with vessel detail.
int64 vessel_id
multivessel_msgs/VesselDetails vessel_details
geometry_msgs/Point position
geometry_msgs/Quaternion orientation
================================================================================
MSG: multivessel_msgs/VesselDetails
# Details of a vessel such as name, lenght, width etc. which could also be found in AIS data.
int64 vessel_id
std_msgs/String CallSign
int64 Cargo
float64 Draft
std_msgs/String IMO
float64 Length
std_msgs/String MMSI
std_msgs/String TransceiverClass
std_msgs/String VesselName
int64 VesselType
float64 Width
================================================================================
MSG: std_msgs/String
string data

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :multivessel_msgs/Perception "695ac89c2af7449068e335be2fb795dc")


