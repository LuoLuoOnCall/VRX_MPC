/**
 * @file multi_vessel_controller_node.cpp
 * @brief Main entry point for the multi-vessel controller using Pure Pursuit algorithm
 */

#include "vessel_controller_pure_pursuit.h"
#include <ros/ros.h>
#include <vector>
#include <memory>

int main(int argc, char **argv) {
    ros::init(argc, argv, "multi_vessel_controller");
    ros::NodeHandle nh;
    
    // Get the number of vessels from ROS parameters
    int vessel_count = 0;
    if (!nh.getParam("/vessel_count", vessel_count)) {
        ROS_ERROR("Failed to get vessel_count parameter");
        return 1;
    }
    ROS_INFO("Number of Vessels: %d", vessel_count);
    
    // Create controller objects for each vessel
    std::vector<std::unique_ptr<VesselControllerMPC>> vessel_controllers;
    /*
    for (int i = 0; i < vessel_count; ++i) {
        vessel_controllers.push_back(std::make_unique<VesselControllerMPC>(i + 1));
    }
    */
   vessel_controllers.push_back(std::make_unique<VesselControllerMPC>(5));
    // Start all controllers
    for (auto& controller : vessel_controllers) {
        controller->start();
    }
    
    // Spin to keep the node alive
    ros::spin();
    
    return 0;
}