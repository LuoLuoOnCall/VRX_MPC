#!/usr/bin/env python
"""
启动脚本，用于同时启动用户定义船只节点目录下的所有Python脚本
"""

import os
import subprocess
import sys
import time

def source_workspace():
    """Source ROS工作空间环境变量"""
    workspace_path = os.path.expanduser("~/vrx_ws")
    setup_bash_path = os.path.join(workspace_path, "devel", "setup.bash")
    
    # 检查setup.bash文件是否存在
    if os.path.exists(setup_bash_path):
        return setup_bash_path
    else:
        print(f"警告: 未找到 {setup_bash_path}，将使用系统默认环境")
        return None

def start_script_in_terminal(script_name, setup_bash_path=None, is_ros_node=False, ros_package=None, ros_executable=None):
    """在新终端标签页中启动单个脚本或ROS节点"""
    try:
        if is_ros_node and ros_package and ros_executable:
            # 对于ROS节点，使用rosrun命令
            command = f"gnome-terminal --tab -- bash -c \"source {setup_bash_path}; rosrun {ros_package} {ros_executable}; bash\""
            print(f"正在启动ROS节点 {ros_package}/{ros_executable}...")
        else:
            # 构建完整的脚本路径
            script_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), script_name)
            
            # 检查脚本是否存在
            if not os.path.exists(script_path):
                print(f"错误: 脚本 {script_path} 不存在")
                return False
                
            # 构建命令
            if setup_bash_path:
                command = f"gnome-terminal --tab -- bash -c \"source {setup_bash_path}; python {script_path}; bash\""
            else:
                command = f"gnome-terminal --tab -- bash -c \"python {script_path}; bash\""
            
            print(f"正在启动 {script_name}...")
        
        # 使用subprocess.Popen启动命令，但不等待其完成
        subprocess.Popen(command, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        return True
    except Exception as e:
        print(f"启动时出错: {e}")
        return False

def main():
    # Source ROS工作空间环境变量
    setup_bash_path = source_workspace()
    
    # 定义要启动的节点列表
    nodes_to_start = [
        ("user_defined_global_path_planner_node.py", False, None, None),
        ("user_defined_perception.py", False, None, None),
        ("user_defined_switch_mechanism.py", False, None, None),
        ("user_defined_local_path_planner_RRT.py", False, None, None),
        (None, True, "multiple_vessels", "multi_vessel_controller_node"),  # C++ MPC控制器
    ]
    
    print("正在启动用户定义船只节点...")
    
    # 启动所有脚本和节点
    started_count = 0
    for script_name, is_ros_node, ros_package, ros_executable in nodes_to_start:
        if is_ros_node:
            # 启动ROS节点 (C++ MPC控制器)
            if start_script_in_terminal(None, setup_bash_path, is_ros_node, ros_package, ros_executable):
                started_count += 1
        else:
            # 启动Python脚本
            if start_script_in_terminal(script_name, setup_bash_path):
                started_count += 1
        
        # 添加小延迟以避免同时启动所有进程时的冲突
        time.sleep(0.5)
    
    if started_count == 0:
        print("没有成功启动任何脚本或节点")
        return
    
    print(f"成功启动 {started_count} 个节点")
    print("所有节点已在独立的终端标签页中运行")

if __name__ == "__main__":
    main()