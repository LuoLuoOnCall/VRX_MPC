#!/usr/bin/env python

import os
import sys
import rospy

class CppControllerStarter:
    def __init__(self):
        rospy.init_node('cpp_controller_starter', anonymous=True)
        self.cpp_executable_chosen = True  # 示例条件

    def start_cpp_controller(self):
        """
        启动C++控制器的示例方法
        """
        if self.cpp_executable_chosen == True:
            # 方法1: 使用rosrun启动C++可执行文件
            os.system("gnome-terminal --tab -- bash -c \"source ~/vrx_ws/devel/setup.bash; rosrun multiple_vessels multi_vessel_controller_node; bash\" ")
            
        # 其他可能的启动方式:
        # 方法2: 直接执行可执行文件的完整路径
        # os.system("gnome-terminal --tab -- bash -c \"source ~/vrx_ws/devel/setup.bash; ~/vrx_ws/devel/lib/multiple_vessels/multi_vessel_controller_node\" ")

if __name__ == "__main__":
    controller_starter = CppControllerStarter()
    controller_starter.start_cpp_controller()