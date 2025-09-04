// Auto-generated. Do not edit!

// (in-package multivessel_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let VesselDetails = require('./VesselDetails.js');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class VesselPose {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vessel_id = null;
      this.vessel_details = null;
      this.position = null;
      this.orientation = null;
    }
    else {
      if (initObj.hasOwnProperty('vessel_id')) {
        this.vessel_id = initObj.vessel_id
      }
      else {
        this.vessel_id = 0;
      }
      if (initObj.hasOwnProperty('vessel_details')) {
        this.vessel_details = initObj.vessel_details
      }
      else {
        this.vessel_details = new VesselDetails();
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('orientation')) {
        this.orientation = initObj.orientation
      }
      else {
        this.orientation = new geometry_msgs.msg.Quaternion();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VesselPose
    // Serialize message field [vessel_id]
    bufferOffset = _serializer.int64(obj.vessel_id, buffer, bufferOffset);
    // Serialize message field [vessel_details]
    bufferOffset = VesselDetails.serialize(obj.vessel_details, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.position, buffer, bufferOffset);
    // Serialize message field [orientation]
    bufferOffset = geometry_msgs.msg.Quaternion.serialize(obj.orientation, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VesselPose
    let len;
    let data = new VesselPose(null);
    // Deserialize message field [vessel_id]
    data.vessel_id = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [vessel_details]
    data.vessel_details = VesselDetails.deserialize(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [orientation]
    data.orientation = geometry_msgs.msg.Quaternion.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += VesselDetails.getMessageSize(object.vessel_details);
    return length + 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'multivessel_msgs/VesselPose';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '92ab806db689eaace64c0360e37c19a4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new VesselPose(null);
    if (msg.vessel_id !== undefined) {
      resolved.vessel_id = msg.vessel_id;
    }
    else {
      resolved.vessel_id = 0
    }

    if (msg.vessel_details !== undefined) {
      resolved.vessel_details = VesselDetails.Resolve(msg.vessel_details)
    }
    else {
      resolved.vessel_details = new VesselDetails()
    }

    if (msg.position !== undefined) {
      resolved.position = geometry_msgs.msg.Point.Resolve(msg.position)
    }
    else {
      resolved.position = new geometry_msgs.msg.Point()
    }

    if (msg.orientation !== undefined) {
      resolved.orientation = geometry_msgs.msg.Quaternion.Resolve(msg.orientation)
    }
    else {
      resolved.orientation = new geometry_msgs.msg.Quaternion()
    }

    return resolved;
    }
};

module.exports = VesselPose;
