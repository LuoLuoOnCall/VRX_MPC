# USV Gazebo Plugins

This package contains Gazebo plugins for simulating Unmanned Surface Vehicles.

## Link Velocity Plugin

A plugin that publishes the velocity of a link in its local frame to a ROS topic.

### Usage

Add the plugin to your model's SDF file:

```xml
<plugin name="link_velocity_plugin" filename="liblink_velocity_plugin.so">
  <link_name>your_link_name</link_name>
  <topic_name>link_velocity</topic_name>
</plugin>
```

- `link_name` (required): The name of the link to monitor.
- `topic_name` (optional): The ROS topic to publish velocity data to. Defaults to "link_velocity".

### Output

The plugin publishes `geometry_msgs/TwistStamped` messages to the specified topic with the following data:
- `twist.linear`: Linear velocity in the link's local frame (m/s)
- `twist.angular`: Angular velocity in the link's local frame (rad/s)

### Example message

```yaml
header: 
  seq: 1234
  stamp: 
    secs: 123
    nsecs: 456000000
  frame_id: "your_link_name"
twist: 
  linear: 
    x: 1.23
    y: 0.45
    z: 0.0
  angular: 
    x: 0.0
    y: 0.0
    z: 0.12
```