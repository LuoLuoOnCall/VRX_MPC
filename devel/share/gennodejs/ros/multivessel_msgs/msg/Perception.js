// Auto-generated. Do not edit!

// (in-package multivessel_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let VesselPose = require('./VesselPose.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Perception {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.vessel_poses = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('vessel_poses')) {
        this.vessel_poses = initObj.vessel_poses
      }
      else {
        this.vessel_poses = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Perception
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [vessel_poses]
    // Serialize the length for message field [vessel_poses]
    bufferOffset = _serializer.uint32(obj.vessel_poses.length, buffer, bufferOffset);
    obj.vessel_poses.forEach((val) => {
      bufferOffset = VesselPose.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Perception
    let len;
    let data = new Perception(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [vessel_poses]
    // Deserialize array length for message field [vessel_poses]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.vessel_poses = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.vessel_poses[i] = VesselPose.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.vessel_poses.forEach((val) => {
      length += VesselPose.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'multivessel_msgs/Perception';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '695ac89c2af7449068e335be2fb795dc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Perception(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.vessel_poses !== undefined) {
      resolved.vessel_poses = new Array(msg.vessel_poses.length);
      for (let i = 0; i < resolved.vessel_poses.length; ++i) {
        resolved.vessel_poses[i] = VesselPose.Resolve(msg.vessel_poses[i]);
      }
    }
    else {
      resolved.vessel_poses = []
    }

    return resolved;
    }
};

module.exports = Perception;
