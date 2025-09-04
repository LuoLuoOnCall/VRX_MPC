/*
 * Copyright (C) 2025  Lingma
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
*/

#include <functional>
#include <gazebo/common/Events.hh>
#include <gazebo/common/Plugin.hh>
#include <gazebo/gazebo.hh>
#include <gazebo/physics/physics.hh>
#include <geometry_msgs/TwistStamped.h>
#include <ros/ros.h>

namespace gazebo
{
  /// \brief A plugin that publishes the velocity of a link in its local frame.
  class LinkVelocityPlugin : public ModelPlugin
  {
    /// \brief Constructor.
    public: LinkVelocityPlugin() {}

    /// \brief Destructor.
    public: virtual ~LinkVelocityPlugin()
    {
      this->updateConnection.reset();
      this->rosNode->shutdown();
    }

    /// \brief Load the plugin.
    /// \param[in] _model Pointer to the model.
    /// \param[in] _sdf Pointer to the SDF element.
    public: virtual void Load(physics::ModelPtr _model, sdf::ElementPtr _sdf)
    {
      // Check if ROS is initialized
      if (!ros::isInitialized())
      {
        ROS_FATAL_STREAM("A ROS node for Gazebo has not been initialized, unable to load plugin. "
          << "Load the Gazebo system plugin 'libgazebo_ros_api_plugin.so' in the gazebo_ros package)");
        return;
      }

      // Initialize ROS node
      this->rosNode.reset(new ros::NodeHandle(_model->GetName()));

      // Get parameters from SDF
      std::string linkName;
      std::string topicName = "link_velocity";

      if (_sdf->HasElement("bodyName"))
      {
        linkName = _sdf->GetElement("bodyName")->Get<std::string>();
      }
      else
      {
        ROS_ERROR("LinkVelocityPlugin: Missing required parameter 'link_name'");
        return;
      }

      if (_sdf->HasElement("topicName"))
      {
        topicName = _sdf->GetElement("topicName")->Get<std::string>();
      }

      // Get link
      this->link = _model->GetLink(linkName);
      if (!this->link)
      {
        ROS_ERROR_STREAM("LinkVelocityPlugin: Link '" << linkName << "' not found!");
        return;
      }

      // Advertise topic
      this->velocityPub = this->rosNode->advertise<geometry_msgs::TwistStamped>(topicName, 10);

      // Connect to the world update event
      this->updateConnection = event::Events::ConnectWorldUpdateBegin(
          std::bind(&LinkVelocityPlugin::OnUpdate, this));

      ROS_INFO_STREAM("LinkVelocityPlugin loaded for link '" << linkName 
                    << "', publishing to topic '" << topicName << "'");
    }

    /// \brief Update function called on every world update.
    private: void OnUpdate()
    {
      // Get velocity in local frame
      #if GAZEBO_MAJOR_VERSION >= 8
        ignition::math::Vector3d linearVel = this->link->RelativeLinearVel();
        ignition::math::Vector3d angularVel = this->link->RelativeAngularVel();
      #else
        ignition::math::Vector3d linearVel = this->link->GetRelativeLinearVel().Ign();
        ignition::math::Vector3d angularVel = this->link->GetRelativeAngularVel().Ign();
      #endif

      // Create and publish message
      geometry_msgs::TwistStamped msg;
      msg.header.stamp = ros::Time::now();
      msg.header.frame_id = this->link->GetName();
      
      msg.twist.linear.x = linearVel.X();
      msg.twist.linear.y = linearVel.Y();
      msg.twist.linear.z = linearVel.Z();
      
      msg.twist.angular.x = angularVel.X();
      msg.twist.angular.y = angularVel.Y();
      msg.twist.angular.z = angularVel.Z();

      this->velocityPub.publish(msg);
    }

    /// \brief Pointer to the model.
    private: physics::LinkPtr link;

    /// \brief ROS node handle.
    private: std::unique_ptr<ros::NodeHandle> rosNode;

    /// \brief ROS publisher for velocity data.
    private: ros::Publisher velocityPub;

    /// \brief Connection to the world update event.
    private: event::ConnectionPtr updateConnection;
  };

  // Register this plugin with the simulator
  GZ_REGISTER_MODEL_PLUGIN(LinkVelocityPlugin)
}