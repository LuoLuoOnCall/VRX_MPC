#!/usr/bin/env python3

import json

def modify_ais_data():
    # 读取两个JSON文件
    with open('/home/wubin/vrx_ws/src/vrx/multiple_vessels/json_files/Global_Waypoints_userDefinedVessels.json', 'r') as f:
        user_defined_data = json.load(f)
    
    with open('/home/wubin/vrx_ws/src/vrx/multiple_vessels/json_files/Json_Global_Waypoints.json', 'r') as f:
        global_waypoints_data = json.load(f)
    
    # 获取用户定义船只的轨迹点
    user_vessel_waypoints = user_defined_data["AIS_Data"][0]
    
    # 获取原始第一艘船的轨迹点
    original_vessel_waypoints = global_waypoints_data["AIS_Data"][0]
    
    # 检查点数是否匹配
    if len(user_vessel_waypoints) != len(original_vessel_waypoints):
        print("警告: 两个轨迹的点数不匹配")
    
    # 反向用户定义的数据
    reversed_user_waypoints = list(reversed(user_vessel_waypoints))
    
    # 将第一艘船的LAT和LON替换为反向的用户定义数据
    for i, waypoint in enumerate(global_waypoints_data["AIS_Data"][0]):
        if i < len(reversed_user_waypoints):
            # 保存原始数据（除了LAT和LON）
            original_lat = waypoint["LAT"]
            original_lon = waypoint["LON"]
            
            # 替换LAT和LON
            waypoint["LAT"] = reversed_user_waypoints[i]["LAT"]
            waypoint["LON"] = reversed_user_waypoints[i]["LON"]
            
            print(f"替换轨迹点 {i}: ({original_lat}, {original_lon}) -> ({waypoint['LAT']}, {waypoint['LON']})")
    
    # 将修改后的数据写回文件
    with open('/home/wubin/vrx_ws/src/vrx/multiple_vessels/json_files/Json_Global_Waypoints.json', 'w') as f:
        json.dump(global_waypoints_data, f, indent=3)
    
    print("AIS数据修改完成!")

if __name__ == "__main__":
    modify_ais_data()