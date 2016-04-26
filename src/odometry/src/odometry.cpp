#include <ros/ros.h>
#include <jaguar4x4/MotorDataArray.h>
#include <tf/transform_broadcaster.h>
#include <nav_msgs/Odometry.h>
#include <geometry_msgs/Quaternion.h>
#include <geometry_msgs/TransformStamped.h>

class Encoder_Subscriber_and_Odometry_Publisher {
private:
    ros::NodeHandle n_;
    ros::Publisher odom_pub_;
    ros::Subscriber encoder_sub_;
    double distancePerCount, vx, vy, dt, delta_x, delta_y, delta_th;
    int deltaLF, deltaRF, deltaLR, deltaRR;
    ros::Time current_time, last_time;

public:
    Encoder_Subscriber_and_Odometry_Publisher() {
        //Topic you want to publish
        odom_pub_ = n_.advertise<nav_msgs::Odometry>("/odom", 50);

        // Time initialization
        current_time = ros::Time::now();
        last_time = ros::Time::now();

        //Topic you want to subscribe
        encoder_sub_ = n_.subscribe("/drrobot_motor", 100, &Encoder_Subscriber_and_Odometry_Publisher::ticks_to_velocity, this);
    }

    void ticks_to_velocity(const jaguar4x4::MotorDataArray::ConstPtr& ticks) {
        distancePerCount = (3.14159265 * 0.1524) / 64000;

        deltaLF = ticks -> motorData[0].encoderDiff;
        deltaRF = ticks -> motorData[1].encoderDiff;
        deltaLR = ticks -> motorData[2].encoderDiff;
        deltaRR = ticks -> motorData[3].encoderDiff;

        vx = deltaLF * distancePerCount; // (current_time_encoder - last_time_encoder).toSec();
        vy = deltaRF * distancePerCount; // (current_time_encoder - last_time_encoder).toSec();

ROS_INFO("#####################%d#######################", deltaLF);
ROS_INFO("#####################%d#######################", deltaRF);
ROS_INFO("#####################%d#######################", deltaLR);
ROS_INFO("#####################%d#######################", deltaRR);
ROS_INFO("--------------------------------------------------");
ROS_INFO("--------------------------------------------------");
    }

}; //End of class Encoder_Subscriber_and_Odometry_Publisher

int main(int argc, char **argv) {
    //Initiate ROS
    ros::init(argc, argv, "odometry_publisher");

    //Create an object of class Encoder_Subscriber_and_Odometry_Publisher that will take care of everything
    Encoder_Subscriber_and_Odometry_Publisher ESOP_Object;
    ros::spin();

    return 0;
}