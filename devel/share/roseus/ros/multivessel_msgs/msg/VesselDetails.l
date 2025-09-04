;; Auto-generated. Do not edit!


(when (boundp 'multivessel_msgs::VesselDetails)
  (if (not (find-package "MULTIVESSEL_MSGS"))
    (make-package "MULTIVESSEL_MSGS"))
  (shadow 'VesselDetails (find-package "MULTIVESSEL_MSGS")))
(unless (find-package "MULTIVESSEL_MSGS::VESSELDETAILS")
  (make-package "MULTIVESSEL_MSGS::VESSELDETAILS"))

(in-package "ROS")
;;//! \htmlinclude VesselDetails.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass multivessel_msgs::VesselDetails
  :super ros::object
  :slots (_vessel_id _CallSign _Cargo _Draft _IMO _Length _MMSI _TransceiverClass _VesselName _VesselType _Width ))

(defmethod multivessel_msgs::VesselDetails
  (:init
   (&key
    ((:vessel_id __vessel_id) 0)
    ((:CallSign __CallSign) (instance std_msgs::String :init))
    ((:Cargo __Cargo) 0)
    ((:Draft __Draft) 0.0)
    ((:IMO __IMO) (instance std_msgs::String :init))
    ((:Length __Length) 0.0)
    ((:MMSI __MMSI) (instance std_msgs::String :init))
    ((:TransceiverClass __TransceiverClass) (instance std_msgs::String :init))
    ((:VesselName __VesselName) (instance std_msgs::String :init))
    ((:VesselType __VesselType) 0)
    ((:Width __Width) 0.0)
    )
   (send-super :init)
   (setq _vessel_id (round __vessel_id))
   (setq _CallSign __CallSign)
   (setq _Cargo (round __Cargo))
   (setq _Draft (float __Draft))
   (setq _IMO __IMO)
   (setq _Length (float __Length))
   (setq _MMSI __MMSI)
   (setq _TransceiverClass __TransceiverClass)
   (setq _VesselName __VesselName)
   (setq _VesselType (round __VesselType))
   (setq _Width (float __Width))
   self)
  (:vessel_id
   (&optional __vessel_id)
   (if __vessel_id (setq _vessel_id __vessel_id)) _vessel_id)
  (:CallSign
   (&rest __CallSign)
   (if (keywordp (car __CallSign))
       (send* _CallSign __CallSign)
     (progn
       (if __CallSign (setq _CallSign (car __CallSign)))
       _CallSign)))
  (:Cargo
   (&optional __Cargo)
   (if __Cargo (setq _Cargo __Cargo)) _Cargo)
  (:Draft
   (&optional __Draft)
   (if __Draft (setq _Draft __Draft)) _Draft)
  (:IMO
   (&rest __IMO)
   (if (keywordp (car __IMO))
       (send* _IMO __IMO)
     (progn
       (if __IMO (setq _IMO (car __IMO)))
       _IMO)))
  (:Length
   (&optional __Length)
   (if __Length (setq _Length __Length)) _Length)
  (:MMSI
   (&rest __MMSI)
   (if (keywordp (car __MMSI))
       (send* _MMSI __MMSI)
     (progn
       (if __MMSI (setq _MMSI (car __MMSI)))
       _MMSI)))
  (:TransceiverClass
   (&rest __TransceiverClass)
   (if (keywordp (car __TransceiverClass))
       (send* _TransceiverClass __TransceiverClass)
     (progn
       (if __TransceiverClass (setq _TransceiverClass (car __TransceiverClass)))
       _TransceiverClass)))
  (:VesselName
   (&rest __VesselName)
   (if (keywordp (car __VesselName))
       (send* _VesselName __VesselName)
     (progn
       (if __VesselName (setq _VesselName (car __VesselName)))
       _VesselName)))
  (:VesselType
   (&optional __VesselType)
   (if __VesselType (setq _VesselType __VesselType)) _VesselType)
  (:Width
   (&optional __Width)
   (if __Width (setq _Width __Width)) _Width)
  (:serialization-length
   ()
   (+
    ;; int64 _vessel_id
    8
    ;; std_msgs/String _CallSign
    (send _CallSign :serialization-length)
    ;; int64 _Cargo
    8
    ;; float64 _Draft
    8
    ;; std_msgs/String _IMO
    (send _IMO :serialization-length)
    ;; float64 _Length
    8
    ;; std_msgs/String _MMSI
    (send _MMSI :serialization-length)
    ;; std_msgs/String _TransceiverClass
    (send _TransceiverClass :serialization-length)
    ;; std_msgs/String _VesselName
    (send _VesselName :serialization-length)
    ;; int64 _VesselType
    8
    ;; float64 _Width
    8
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
     ;; std_msgs/String _CallSign
       (send _CallSign :serialize s)
     ;; int64 _Cargo
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _Cargo (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _Cargo) (= (length (_Cargo . bv)) 2)) ;; bignum
              (write-long (ash (elt (_Cargo . bv) 0) 0) s)
              (write-long (ash (elt (_Cargo . bv) 1) -1) s))
             ((and (class _Cargo) (= (length (_Cargo . bv)) 1)) ;; big1
              (write-long (elt (_Cargo . bv) 0) s)
              (write-long (if (>= _Cargo 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _Cargo s)(write-long (if (>= _Cargo 0) 0 #xffffffff) s)))
     ;; float64 _Draft
       (sys::poke _Draft (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; std_msgs/String _IMO
       (send _IMO :serialize s)
     ;; float64 _Length
       (sys::poke _Length (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; std_msgs/String _MMSI
       (send _MMSI :serialize s)
     ;; std_msgs/String _TransceiverClass
       (send _TransceiverClass :serialize s)
     ;; std_msgs/String _VesselName
       (send _VesselName :serialize s)
     ;; int64 _VesselType
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _VesselType (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _VesselType) (= (length (_VesselType . bv)) 2)) ;; bignum
              (write-long (ash (elt (_VesselType . bv) 0) 0) s)
              (write-long (ash (elt (_VesselType . bv) 1) -1) s))
             ((and (class _VesselType) (= (length (_VesselType . bv)) 1)) ;; big1
              (write-long (elt (_VesselType . bv) 0) s)
              (write-long (if (>= _VesselType 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _VesselType s)(write-long (if (>= _VesselType 0) 0 #xffffffff) s)))
     ;; float64 _Width
       (sys::poke _Width (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
   ;; std_msgs/String _CallSign
     (send _CallSign :deserialize buf ptr-) (incf ptr- (send _CallSign :serialization-length))
   ;; int64 _Cargo
#+(or :alpha :irix6 :x86_64)
      (setf _Cargo (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _Cargo (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _Draft
     (setq _Draft (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; std_msgs/String _IMO
     (send _IMO :deserialize buf ptr-) (incf ptr- (send _IMO :serialization-length))
   ;; float64 _Length
     (setq _Length (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; std_msgs/String _MMSI
     (send _MMSI :deserialize buf ptr-) (incf ptr- (send _MMSI :serialization-length))
   ;; std_msgs/String _TransceiverClass
     (send _TransceiverClass :deserialize buf ptr-) (incf ptr- (send _TransceiverClass :serialization-length))
   ;; std_msgs/String _VesselName
     (send _VesselName :deserialize buf ptr-) (incf ptr- (send _VesselName :serialization-length))
   ;; int64 _VesselType
#+(or :alpha :irix6 :x86_64)
      (setf _VesselType (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _VesselType (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _Width
     (setq _Width (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get multivessel_msgs::VesselDetails :md5sum-) "0022f29c59d319c4a2b71911144da0cf")
(setf (get multivessel_msgs::VesselDetails :datatype-) "multivessel_msgs/VesselDetails")
(setf (get multivessel_msgs::VesselDetails :definition-)
      "# Details of a vessel such as name, lenght, width etc. which could also be found in AIS data.
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

")



(provide :multivessel_msgs/VesselDetails "0022f29c59d319c4a2b71911144da0cf")


