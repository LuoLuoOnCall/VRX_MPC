#ifndef WAMV14_H_
#define WAMV14_H_

#include <eigen3/Eigen/Dense>
#include <iostream>
#include <math.h>

class WAMV14
{
    public:
        //构造函数
        WAMV14(float ts, int integration_step, Eigen::Matrix<float,6,1> x_init);
        WAMV14(Eigen::Matrix<float, 6, 1>  x0,Eigen::Matrix<float, 2, 1>  Thrust0, float ts, int integration_step);
        //析构函数
        ~WAMV14();
        //状态更新
        void state_update(Eigen::Matrix<float, 2, 1> Thrust_c,Eigen::Matrix<float,3,1> tau_w);
        //获取当前状态
        Eigen::Matrix<float,6,1> get_states();
        //获取当前推力
        Eigen::Matrix<float,2,1> get_thrust();
        //获取当前模型总扰动项
        Eigen::Matrix<float,3,1> get_disturbance();
        //符号函数
        int mySign(float x);

    private:
        Eigen::Matrix<float,6,1> x; //无人艇状态
        Eigen::Matrix<float,2,1> Thrust; //无人艇推力状态
        float Thrustdot_max = 100.0; //推力速度限幅，根据实际情况设置
        float Thrust_max = 250.0; //推力限幅，与wamv_gazebo_thruster_config.xacro中的maxForceFwd一致
        float Ths; //无人艇推力积分常数
        float L = 4.9;  // length，与wamv_gazebo_dynamics_plugin.xacro中的boatLength一致
        float T = 0.213; // draft，与wamv_gazebo_dynamics_plugin.xacro中的hullRadius一致
        float Bhull = 0.4; // 浮筒beam，根据wamv_base.urdf中的浮筒半径0.2调整
        float B = 2.06; // 浮筒中心间距，根据wamv_base.urdf中的浮筒位置(±1.03)调整
        float rho = 997.8; // 水的密度，与wamv_gazebo_dynamics_plugin.xacro中的waterDensity一致
        float m = 180; // mass，与wamv_base.urdf中的质量值一致
        float Cd = 1.1; // 方形系数，保持不变
        float BOA = 2.4; //width，与wamv_gazebo_dynamics_plugin.xacro中的boatWidth一致
        Eigen::Matrix<float,3,1> Fur; //总扰动 

        float m_sample_time; //采样步长
        int m_integration_step; //积分步长
        float m_dt; //单次积分时间
};
#endif
