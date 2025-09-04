/**
 * @file vessel_controller_pure_pursuit.h
 * @brief Vessel Controller ROS node that sends actuator signals to waypoints using Pure Pursuit algorithm
 * 
 * This controller subscribes to /vesselX/current_waypoint topic and uses the waypoint's position
 * and vessel's current position to compute and output actuator signals.
 */

#ifndef VESSEL_CONTROLLER_PURE_PURSUIT_H
#define VESSEL_CONTROLLER_PURE_PURSUIT_H

#include <ros/ros.h>
#include <sensor_msgs/NavSatFix.h>
#include <sensor_msgs/Imu.h>
#include <std_msgs/Float32.h>
#include <std_msgs/Float64MultiArray.h>
#include <geometry_msgs/TwistStamped.h>
#include <tf/transform_datatypes.h>
#include <thread>
#include <vector>
#include <string>
#include <nlohmann/json.hpp>
#include <fstream>
#include <cmath>
#include <GeographicLib/Geodesic.hpp>
#include <eigen3/Eigen/Dense>
#include "nmpc_station_keeping.h"

class VesselControllerMPC {
public:
    /**
     * @brief Constructor for the VesselControllerMPC class
     * @param vesselID The ID of the vessel to control
     */
    explicit VesselControllerMPC(int vesselID);
    
    /**
     * @brief Destructor for the VesselControllerMPC class
     */
    ~VesselControllerMPC();
    
    /**
     * @brief Start the controller thread
     */
    void start();
    
    /**
     * @brief Stop the controller
     */
    void stop();
    
    /**
     * @brief Main run loop for the controller
     */
    void run();

private:
    /**
     * @brief Calculate the intermediate goal for the pure pursuit algorithm
     * 
     * Pure pursuit algorithm works best for goal points that are not too far away.
     */
    void CalculateIntermediateGoal();
    
    /**
     * @brief Convert latitude-longitude coordinates to local XY coordinates
     * @param lat Latitude in degrees
     * @param lon Longitude in degrees
     * @return Pair of X,Y coordinates in meters
     */
    std::pair<double, double> getLocalCoord(double lat, double lon);
    
    /**
     * @brief Callback for current waypoint messages
     * @param msg The waypoint message
     */
    void callbackCurrentWaypoint(const std_msgs::Float64MultiArray::ConstPtr& msg);
    
    /**
     * @brief Callback for GPS messages
     * @param msg The GPS message
     */
    void callbackGps(const sensor_msgs::NavSatFix::ConstPtr& msg);
    
    /**
     * @brief Callback for IMU messages
     * @param msg The IMU message
     */
    void callbackImu(const sensor_msgs::Imu::ConstPtr& msg);

    /**
     * @brief Callback for local velocity messages
     * @param msg The TwistStamped message containing local velocity information
     */
    void callbackLocalVelocity(const geometry_msgs::TwistStamped::ConstPtr& msg);

    // ROS node handle
    ros::NodeHandle nh_;
    
    // ROS subscribers
    ros::Subscriber sub_gps_;
    ros::Subscriber sub_imu_;
    ros::Subscriber sub_current_waypoint_;
    ros::Subscriber sub_local_velocity_;
    
    // ROS publishers
    ros::Publisher pub_left_thrust_cmd_;
    ros::Publisher pub_right_thrust_cmd_;
    ros::Publisher pub_left_thrust_angle_;
    ros::Publisher pub_right_thrust_angle_;
    
    // Thread for running the controller
    std::thread controller_thread_;
    bool running_;
    
    // Configuration parameters
    std::string config_path_;
    nlohmann::json config_data_;
    int vessel_id_;
    
    // Controller parameters
    bool controller_pure_pursuit_chosen_;
    double look_ahead_distance_local_;
    double look_ahead_distance_global_;
    double linear_velocity_local_;
    double linear_velocity_global_;
    double local_wp_reaching_threshold_meters_;
    
    // Current look ahead distance and linear velocity
    double look_ahead_distance_;
    double linear_velocity_;
    
    // Vessel details from ROS parameters
    nlohmann::json vessel_details_;
    
    // Current position and orientation
    double current_lat_;
    double current_lon_;
    double roll_;
    double pitch_;
    double yaw_;
    double quaternion_x_;
    double quaternion_y_;
    double quaternion_z_;
    double quaternion_w_;
    
    // Origin for local coordinates
    double origin_lat_;
    double origin_lon_;
    
    // Current position in local coordinates
    double current_x_;
    double current_y_;
    
    // Waypoint information
    std::vector<double> current_waypoint_;
    std::vector<double> current_waypoint_minus_one_;
    double current_waypoint_lat_;
    double current_waypoint_lon_;
    int is_on_global_path_;
    
    // Waypoint in local coordinates
    double waypoint_x_;
    double waypoint_y_;
    
    // Intermediate goal for pure pursuit
    double intermediate_goal_x_;
    double intermediate_goal_y_;
    
    // Distance between current position and waypoint
    double distance_between_current_wp_to_vessel_;
    
    // Command values for thrusters
    float right_cmd_vel_;
    float left_cmd_vel_;
    float right_cmd_angle_;
    float left_cmd_angle_;
    
    float u_;
    float v_;
    float r_;
    Eigen::Matrix<float, 6, 1> current_states_;
    Eigen::Matrix<float, 6, 1> desired_states_;
    StationKeepingNMPC nmpc_;
    
    // New member variables for desired position and yaw
    double desired_x_;
    double desired_y_;
    double desired_yaw_; // 修复拼写错误
    
    // Rate for controlling loop frequency
    ros::Rate rate_;
};

#endif // VESSEL_CONTROLLER_PURE_PURSUIT_H