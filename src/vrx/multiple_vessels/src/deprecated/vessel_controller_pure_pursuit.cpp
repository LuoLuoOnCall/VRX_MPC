/*
 * @file vessel_controller_pure_pursuit.cpp
 * @brief Implementation of the Vessel Controller using Pure Pursuit algorithm
 */

#include "vessel_controller_pure_pursuit.h"
#include <ros/package.h>
#include <tf/LinearMath/Quaternion.h>
#include <tf/LinearMath/Matrix3x3.h>
#include <iostream>
#include <cmath>
#include <exception>

// ROS message dependencies
#include <sensor_msgs/Imu.h>
#include <sensor_msgs/NavSatFix.h>
#include <std_msgs/Float64MultiArray.h>
#include <std_msgs/Float32.h>

VesselControllerPurePursuit::VesselControllerPurePursuit(int vesselID) : 
    nh_("~"),
    vessel_id_(vesselID),
    running_(false),
    current_lat_(0.0),
    current_lon_(0.0),
    roll_(0.0),
    pitch_(0.0),
    yaw_(0.0),
    quaternion_x_(0.0),
    quaternion_y_(0.0),
    quaternion_z_(0.0),
    quaternion_w_(0.0),
    current_waypoint_lat_(0.0),
    current_waypoint_lon_(0.0),
    is_on_global_path_(1), // In the beginning, we assume every vessel starts at global path
    intermediate_goal_x_(0.0),
    intermediate_goal_y_(0.0),
    right_cmd_vel_(0.0),
    left_cmd_vel_(0.0),
    right_cmd_angle_(0.0),
    left_cmd_angle_(0.0),
    rate_(10) // 10 Hz
{
    // Get the path to the config file
    config_path_ = ros::package::getPath("multiple_vessels") + "/json_files/config.json";
    
    // Load configuration from JSON file
    std::ifstream config_file(config_path_);
    if (!config_file.is_open()) {
        ROS_ERROR("Failed to open config file: %s", config_path_.c_str());
        return;
    }
    
    try {
        config_file >> config_data_;
    } catch (const std::exception& e) {
        ROS_ERROR("Failed to parse config file: %s", e.what());
        return;
    }
    
    // Get settings from config.json
    controller_pure_pursuit_chosen_ = config_data_["controller"][0]["Pure_Pursuit"][0]["chosen"];
    look_ahead_distance_local_ = config_data_["controller"][0]["Pure_Pursuit"][0]["look_ahead_distance_local_path_meters"];
    look_ahead_distance_global_ = config_data_["controller"][0]["Pure_Pursuit"][0]["look_ahead_distance_global_path_meters"];
    linear_velocity_local_ = config_data_["controller"][0]["Pure_Pursuit"][0]["linear_velocity_propeller_command_local_path"];
    linear_velocity_global_ = config_data_["controller"][0]["Pure_Pursuit"][0]["linear_velocity_propeller_command_global_path"];
    local_wp_reaching_threshold_meters_= config_data_["path_tracker"][0]["local_wp_reaching_treshold_meters"];

    // Get vessel details parameter
    /*std::string vessel_details_param_txt = "/vessel" + std::to_string(vessel_id_) + "_details";
    nh_.getParam(vessel_details_param_txt,vessel_details_);*/

    // Subscribe to GPS and IMU sensors
    std::string sub_topic_gps_txt = "vessel" + std::to_string(vessel_id_) + "/vessel" + std::to_string(vessel_id_) + "/sensors/gps/gps/fix";
    sub_gps_ = nh_.subscribe(sub_topic_gps_txt, 10, &VesselControllerPurePursuit::callbackGps, this);
    
    std::string sub_topic_imu_txt = "vessel" + std::to_string(vessel_id_) + "/vessel" + std::to_string(vessel_id_) + "/sensors/imu/imu/data";
    sub_imu_ = nh_.subscribe(sub_topic_imu_txt, 10, &VesselControllerPurePursuit::callbackImu, this);

    // Subscribe to the current_waypoint topic
    std::string sub_current_waypoint_txt = "vessel" + std::to_string(vessel_id_) + "/current_waypoint";
    sub_current_waypoint_ = nh_.subscribe(sub_current_waypoint_txt, 10, &VesselControllerPurePursuit::callbackCurrentWaypoint, this);

    // Initialize the actuator publishers
    std::string pub_topic_leftThrustcmd_txt = "vessel" + std::to_string(vessel_id_) + "/thrusters/left_thrust_cmd";
    pub_left_thrust_cmd_ = nh_.advertise<std_msgs::Float32>(pub_topic_leftThrustcmd_txt, 10);
    
    std::string pub_topic_rightThrustcmd_txt = "vessel" + std::to_string(vessel_id_) + "/thrusters/right_thrust_cmd";
    pub_right_thrust_cmd_ = nh_.advertise<std_msgs::Float32>(pub_topic_rightThrustcmd_txt, 10);

    std::string pub_topic_leftThrustAngle_txt = "vessel" + std::to_string(vessel_id_) + "/thrusters/left_thrust_angle";
    pub_left_thrust_angle_ = nh_.advertise<std_msgs::Float32>(pub_topic_leftThrustAngle_txt, 10);

    std::string pub_topic_rightThrustAngle_txt = "vessel" + std::to_string(vessel_id_) + "/thrusters/right_thrust_angle";
    pub_right_thrust_angle_ = nh_.advertise<std_msgs::Float32>(pub_topic_rightThrustAngle_txt, 10);
    
    ROS_INFO("%d vessel controller started", vessel_id_);
}

VesselControllerPurePursuit::~VesselControllerPurePursuit() {
    // 停止控制器运行
    stop();
    
    // 等待线程结束
    if (controller_thread_.joinable()) {
        controller_thread_.join();
    }
}

void VesselControllerPurePursuit::start() {
    running_ = true;
    controller_thread_ = std::thread(&VesselControllerPurePursuit::run, this);
}

void VesselControllerPurePursuit::stop() {
    running_ = false;
}

void VesselControllerPurePursuit::run() {
    while (running_ && ros::ok()) {
        try {
            rate_.sleep();
            ros::spinOnce();
            
            if (current_lat_ != 0.0) {
                if (!current_waypoint_.empty()) {
                    // Something got published to the current waypoint topic
                    
                    if (current_waypoint_ != current_waypoint_minus_one_) {
                        // Waypoint has been changed
                        ROS_INFO("For Vessel %d, fresh start to reach the current waypoint: [%f, %f, %f]", 
                                 vessel_id_, current_waypoint_[0], current_waypoint_[1], current_waypoint_[2]);
                        current_waypoint_minus_one_ = current_waypoint_;
                    } else {
                        // Waypoint is not changed. Keep navigating to the waypoint.
                        current_waypoint_lat_ = current_waypoint_[0];
                        current_waypoint_lon_ = current_waypoint_[1];
                        is_on_global_path_ = static_cast<int>(current_waypoint_[2]);

                        // Calculate distance
                        // Note: We're simplifying the distance calculation here
                        double dlat = current_waypoint_lat_ - current_lat_;
                        double dlon = current_waypoint_lon_ - current_lon_;
                        distance_between_current_wp_to_vessel_ = sqrt(dlat*dlat + dlon*dlon) * 111000; // Rough conversion to meters

                        if (is_on_global_path_ == 99) {
                            ROS_INFO("Global waypoints are finished for vessel %d", vessel_id_);
                            running_ = false;
                            return;
                        }
                        
                        if (distance_between_current_wp_to_vessel_ < (local_wp_reaching_threshold_meters_/2)) {
                            // If distance in between is smaller than half of the local threshold, something's going wrong
                            ROS_WARN("Distance to the current waypoint is smaller than half of the reaching threshold.");
                            ROS_WARN("Did trajectory tracker ROS node crashed for vessel %d?", vessel_id_);
                        } else {
                            // Distance is not smaller than half of the local threshold. We are safe to proceed.
                            origin_lat_ = current_lat_;//current_lat_ is reported from GPS callback
                            origin_lon_ = current_lon_;
                            auto local_coords = getLocalCoord(current_lat_, current_lon_);
                            current_x_ = local_coords.first;
                            current_y_ = local_coords.second;
                            // It will return 0,0 since we put the origin to wherever the vessel is at
                            
                            // Get yaw from quaternion using tf
                            tf::Quaternion q(quaternion_x_, quaternion_y_, quaternion_z_, quaternion_w_);
                            tf::Matrix3x3 m(q);
                            m.getRPY(roll_, pitch_, yaw_);
                            
                            auto waypoint_coords = getLocalCoord(current_waypoint_lat_, current_waypoint_lon_);
                            waypoint_x_ = waypoint_coords.first;
                            waypoint_y_ = waypoint_coords.second;

                            double look_ahead_distance, linear_velocity;
                            
                            if (is_on_global_path_ == 0) {
                                // On local path. Set the look ahead distance and linear velocity.
                                look_ahead_distance = look_ahead_distance_local_;
                                linear_velocity = linear_velocity_local_;
                            } else if (is_on_global_path_ == 1) {
                                // On global path. Set the look ahead distance and linear velocity.
                                look_ahead_distance = look_ahead_distance_global_;
                                linear_velocity = linear_velocity_global_;
                            } else if (is_on_global_path_ == 2) {
                                // Generating the local waypoint right now. 
                                // Keep tracking the waypoint from before until local path is generated.
                                look_ahead_distance = look_ahead_distance_local_;
                                linear_velocity = linear_velocity_local_;
                            } else {
                                look_ahead_distance = look_ahead_distance_local_;
                                linear_velocity = linear_velocity_local_;
                            }

                            // Calculate intermediate goal
                            CalculateIntermediateGoal();
                            
                            double alpha = atan2(intermediate_goal_y_ - current_y_, intermediate_goal_x_ - current_x_) - yaw_;
                            double K = 2 * sin(alpha) / look_ahead_distance; // curvature
                            double v = linear_velocity;
                            double w = linear_velocity * K;

                            right_cmd_vel_ = static_cast<float>(v);
                            left_cmd_vel_ = static_cast<float>(v);
                            right_cmd_angle_ = static_cast<float>(-1 * w);
                            left_cmd_angle_ = static_cast<float>(-1 * w);
                            
                            // Publish commands
                            std_msgs::Float32 left_cmd_vel_msg, right_cmd_vel_msg;
                            std_msgs::Float32 left_cmd_angle_msg, right_cmd_angle_msg;
                            
                            left_cmd_vel_msg.data = left_cmd_vel_;
                            right_cmd_vel_msg.data = right_cmd_vel_;
                            left_cmd_angle_msg.data = left_cmd_angle_;
                            right_cmd_angle_msg.data = right_cmd_angle_;
                            
                            pub_left_thrust_cmd_.publish(left_cmd_vel_msg);
                            pub_right_thrust_cmd_.publish(right_cmd_vel_msg);
                            pub_right_thrust_angle_.publish(right_cmd_angle_msg);
                            pub_left_thrust_angle_.publish(left_cmd_angle_msg);
                        }
                    }
                } else {
                    ROS_WARN("No waypoints are published yet. Did you start the switch mechanism, local path planner and path tracker ROS nodes?");
                    rate_.sleep();
                }
            } else {
                ROS_WARN("No GPS information. Is the VRX simulation environment started?");
                ROS_WARN("Or is the vessel_count ROS parameter is set wrong? So is this ROS node is trying to subscribe to a GPS that doesn't exist?");
                rate_.sleep();
            }
        } catch (const std::exception& e) {
            ROS_ERROR("%s", e.what());
        }
    }
}

void VesselControllerPurePursuit::CalculateIntermediateGoal() {
    // This function calculates the intermediate goal for the pure pursuit algorithm.
    // Because pure pursuit algorithm works best for the goal points that are not too far away.
    
    if (distance_between_current_wp_to_vessel_ > look_ahead_distance_global_) { // Using global as default
        double angle_difference = atan2(waypoint_y_ - current_y_, waypoint_x_ - current_x_);
        intermediate_goal_x_ = current_x_ + look_ahead_distance_global_ * cos(angle_difference);
        intermediate_goal_y_ = current_y_ + look_ahead_distance_global_ * sin(angle_difference);
    } else {
        // Distance to waypoint is not bigger than look ahead distance. So we take the current goal as the intermediate goal
        intermediate_goal_x_ = waypoint_x_;
        intermediate_goal_y_ = waypoint_y_;
    }
}

std::pair<double, double> VesselControllerPurePursuit::getLocalCoord(double lat, double lon) {
    // Converts the position information in Lat-Lon to XY.
    const double WORLD_POLAR_M = 6356752.3142;
    const double WORLD_EQUATORIAL_M = 6378137.0;

    double eccentricity = acos(WORLD_POLAR_M / WORLD_EQUATORIAL_M);
    double n_prime = 1 / (sqrt(1 - pow(sin(lat * M_PI / 180.0), 2.0) * pow(sin(eccentricity), 2.0)));
    double m = WORLD_EQUATORIAL_M * pow(cos(eccentricity), 2.0) * pow(n_prime, 3.0);
    double n = WORLD_EQUATORIAL_M * n_prime;

    double diffLon = lon - origin_lon_;
    double diffLat = lat - origin_lat_;

    double surfdistLon = M_PI / 180.0 * cos(lat * M_PI / 180.0) * n;
    double surfdistLat = M_PI / 180.0 * m;

    double x = diffLon * surfdistLon;
    double y = diffLat * surfdistLat;

    return std::make_pair(x, y);
}

void VesselControllerPurePursuit::callbackCurrentWaypoint(const std_msgs::Float64MultiArray::ConstPtr& msg) {
    current_waypoint_.clear();
    for (const auto& data : msg->data) {
        current_waypoint_.push_back(data);
    }
}

void VesselControllerPurePursuit::callbackGps(const sensor_msgs::NavSatFix::ConstPtr& msg) {
    current_lat_ = msg->latitude;
    current_lon_ = msg->longitude;
}

void VesselControllerPurePursuit::callbackImu(const sensor_msgs::Imu::ConstPtr& msg) {
    quaternion_x_ = msg->orientation.x;
    quaternion_y_ = msg->orientation.y;
    quaternion_z_ = msg->orientation.z;
    quaternion_w_ = msg->orientation.w;
}