;; Auto-generated. Do not edit!


(when (boundp 'multivessel_msgs::VesselPose)
  (if (not (find-package "MULTIVESSEL_MSGS"))
    (make-package "MULTIVESSEL_MSGS"))
  (shadow 'VesselPose (find-package "MULTIVESSEL_MSGS")))
(unless (find-package "MULTIVESSEL_MSGS::VESSELPOSE")
  (make-package "MULTIVESSEL_MSGS::VESSELPOSE"))

(in-package "ROS")
;;//! \htmlinclude VesselPose.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass multivessel_msgs::VesselPose
  :super ros::object
  :slots (_vessel_id _vessel_details _position _orientation ))

(defmethod multivessel_msgs::VesselPose
  (:init
   (&key
    ((:vessel_id __vessel_id) 0)
    ((:vessel_details __vessel_details) (instance multivessel_msgs::VesselDetails :init))
    ((:position __position) (instance geometry_msgs::Point :init))
    ((:orientation __orientation) (instance geometry_msgs::Quaternion :init))
    )
   (send-super :init)
   (setq _vessel_id (round __vessel_id))
   (setq _vessel_details __vessel_details)
   (setq _position __position)
   (setq _orientation __orientation)
   self)
  (:vessel_id
   (&optional __vessel_id)
   (if __vessel_id (setq _vessel_id __vessel_id)) _vessel_id)
  (:vessel_details
   (&rest __vessel_details)
   (if (keywordp (car __vessel_details))
       (send* _vessel_details __vessel_details)
     (progn
       (if __vessel_details (setq _vessel_details (car __vessel_details)))
       _vessel_details)))
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:orientation
   (&rest __orientation)
   (if (keywordp (car __orientation))
       (send* _orientation __orientation)
     (progn
       (if __orientation (setq _orientation (car __orientation)))
       _orientation)))
  (:serialization-length
   ()
   (+
    ;; int64 _vessel_id
    8
    ;; multivessel_msgs/VesselDetails _vessel_details
    (send _vessel_details :serialization-length)
    ;; geometry_msgs/Point _position
    (send _position :serialization-length)
    ;; geometry_msgs/Quaternion _orientation
    (send _orientation :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _vessel_id
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _vessel_id (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _vessel_id) (= (length (_vessel_id . bv)) 2)) ;; bignum
              (write-long (ash (elt (_vessel_id . bv) 0) 0) s)
              (write-long (ash (elt (_vessel_id . bv) 1) -1) s))
             ((and (class _vessel_id) (= (length (_vessel_id . bv)) 1)) ;; big1
              (write-long (elt (_vessel_id . bv) 0) s)
              (write-long (if (>= _vessel_id 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _vessel_id s)(write-long (if (>= _vessel_id 0) 0 #xffffffff) s)))
     ;; multivessel_msgs/VesselDetails _vessel_details
       (send _vessel_details :serialize s)
     ;; geometry_msgs/Point _position
       (send _position :serialize s)
     ;; geometry_msgs/Quaternion _orientation
       (send _orientation :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _vessel_id
#+(or :alpha :irix6 :x86_64)
      (setf _vessel_id (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _vessel_id (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; multivessel_msgs/VesselDetails _vessel_details
     (send _vessel_details :deserialize buf ptr-) (incf ptr- (send _vessel_details :serialization-length))
   ;; geometry_msgs/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; geometry_msgs/Quaternion _orientation
     (send _orientation :deserialize buf ptr-) (incf ptr- (send _orientation :serialization-length))
   ;;
   self)
  )

(setf (get multivessel_msgs::VesselPose :md5sum-) "92ab806db689eaace64c0360e37c19a4")
(setf (get multivessel_msgs::VesselPose :datatype-) "multivessel_msgs/VesselPose")
(setf (get multivessel_msgs::VesselPose :definition-)
      "# Vessel pose information with vessel detail.
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



(provide :multivessel_msgs/VesselPose "92ab806db689eaace64c0360e37c19a4")


