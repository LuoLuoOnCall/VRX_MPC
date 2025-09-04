// Auto-generated. Do not edit!

// (in-package multivessel_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class VesselDetails {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vessel_id = null;
      this.CallSign = null;
      this.Cargo = null;
      this.Draft = null;
      this.IMO = null;
      this.Length = null;
      this.MMSI = null;
      this.TransceiverClass = null;
      this.VesselName = null;
      this.VesselType = null;
      this.Width = null;
    }
    else {
      if (initObj.hasOwnProperty('vessel_id')) {
        this.vessel_id = initObj.vessel_id
      }
      else {
        this.vessel_id = 0;
      }
      if (initObj.hasOwnProperty('CallSign')) {
        this.CallSign = initObj.CallSign
      }
      else {
        this.CallSign = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('Cargo')) {
        this.Cargo = initObj.Cargo
      }
      else {
        this.Cargo = 0;
      }
      if (initObj.hasOwnProperty('Draft')) {
        this.Draft = initObj.Draft
      }
      else {
        this.Draft = 0.0;
      }
      if (initObj.hasOwnProperty('IMO')) {
        this.IMO = initObj.IMO
      }
      else {
        this.IMO = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('Length')) {
        this.Length = initObj.Length
      }
      else {
        this.Length = 0.0;
      }
      if (initObj.hasOwnProperty('MMSI')) {
        this.MMSI = initObj.MMSI
      }
      else {
        this.MMSI = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('TransceiverClass')) {
        this.TransceiverClass = initObj.TransceiverClass
      }
      else {
        this.TransceiverClass = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('VesselName')) {
        this.VesselName = initObj.VesselName
      }
      else {
        this.VesselName = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('VesselType')) {
        this.VesselType = initObj.VesselType
      }
      else {
        this.VesselType = 0;
      }
      if (initObj.hasOwnProperty('Width')) {
        this.Width = initObj.Width
      }
      else {
        this.Width = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VesselDetails
    // Serialize message field [vessel_id]
    bufferOffset = _serializer.int64(obj.vessel_id, buffer, bufferOffset);
    // Serialize message field [CallSign]
    bufferOffset = std_msgs.msg.String.serialize(obj.CallSign, buffer, bufferOffset);
    // Serialize message field [Cargo]
    bufferOffset = _serializer.int64(obj.Cargo, buffer, bufferOffset);
    // Serialize message field [Draft]
    bufferOffset = _serializer.float64(obj.Draft, buffer, bufferOffset);
    // Serialize message field [IMO]
    bufferOffset = std_msgs.msg.String.serialize(obj.IMO, buffer, bufferOffset);
    // Serialize message field [Length]
    bufferOffset = _serializer.float64(obj.Length, buffer, bufferOffset);
    // Serialize message field [MMSI]
    bufferOffset = std_msgs.msg.String.serialize(obj.MMSI, buffer, bufferOffset);
    // Serialize message field [TransceiverClass]
    bufferOffset = std_msgs.msg.String.serialize(obj.TransceiverClass, buffer, bufferOffset);
    // Serialize message field [VesselName]
    bufferOffset = std_msgs.msg.String.serialize(obj.VesselName, buffer, bufferOffset);
    // Serialize message field [VesselType]
    bufferOffset = _serializer.int64(obj.VesselType, buffer, bufferOffset);
    // Serialize message field [Width]
    bufferOffset = _serializer.float64(obj.Width, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VesselDetails
    let len;
    let data = new VesselDetails(null);
    // Deserialize message field [vessel_id]
    data.vessel_id = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [CallSign]
    data.CallSign = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [Cargo]
    data.Cargo = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [Draft]
    data.Draft = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [IMO]
    data.IMO = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [Length]
    data.Length = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [MMSI]
    data.MMSI = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [TransceiverClass]
    data.TransceiverClass = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [VesselName]
    data.VesselName = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [VesselType]
    data.VesselType = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [Width]
    data.Width = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.CallSign);
    length += std_msgs.msg.String.getMessageSize(object.IMO);
    length += std_msgs.msg.String.getMessageSize(object.MMSI);
    length += std_msgs.msg.String.getMessageSize(object.TransceiverClass);
    length += std_msgs.msg.String.getMessageSize(object.VesselName);
    return length + 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'multivessel_msgs/VesselDetails';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0022f29c59d319c4a2b71911144da0cf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VesselDetails(null);
    if (msg.vessel_id !== undefined) {
      resolved.vessel_id = msg.vessel_id;
    }
    else {
      resolved.vessel_id = 0
    }

    if (msg.CallSign !== undefined) {
      resolved.CallSign = std_msgs.msg.String.Resolve(msg.CallSign)
    }
    else {
      resolved.CallSign = new std_msgs.msg.String()
    }

    if (msg.Cargo !== undefined) {
      resolved.Cargo = msg.Cargo;
    }
    else {
      resolved.Cargo = 0
    }

    if (msg.Draft !== undefined) {
      resolved.Draft = msg.Draft;
    }
    else {
      resolved.Draft = 0.0
    }

    if (msg.IMO !== undefined) {
      resolved.IMO = std_msgs.msg.String.Resolve(msg.IMO)
    }
    else {
      resolved.IMO = new std_msgs.msg.String()
    }

    if (msg.Length !== undefined) {
      resolved.Length = msg.Length;
    }
    else {
      resolved.Length = 0.0
    }

    if (msg.MMSI !== undefined) {
      resolved.MMSI = std_msgs.msg.String.Resolve(msg.MMSI)
    }
    else {
      resolved.MMSI = new std_msgs.msg.String()
    }

    if (msg.TransceiverClass !== undefined) {
      resolved.TransceiverClass = std_msgs.msg.String.Resolve(msg.TransceiverClass)
    }
    else {
      resolved.TransceiverClass = new std_msgs.msg.String()
    }

    if (msg.VesselName !== undefined) {
      resolved.VesselName = std_msgs.msg.String.Resolve(msg.VesselName)
    }
    else {
      resolved.VesselName = new std_msgs.msg.String()
    }

    if (msg.VesselType !== undefined) {
      resolved.VesselType = msg.VesselType;
    }
    else {
      resolved.VesselType = 0
    }

    if (msg.Width !== undefined) {
      resolved.Width = msg.Width;
    }
    else {
      resolved.Width = 0.0
    }

    return resolved;
    }
};

module.exports = VesselDetails;
