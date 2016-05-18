#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include "sensor_msgs/Imu.h"

void poseCallback(const sensor_msgs::Imu& msg){
    static tf::TransformBroadcaster tf_br;
    tf::Transform transform;
    Quaternion 

    transform.setOrigin( tf::Vector3(0.0, 0.0, 0.0) );
    transform.setRotation(msg.orientation);
    br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "odom", "base_link"));
}

int main(int argc, char** argv){
    ros::init(argc, argv, "static_odom_frame");
    ros::NodeHandle node;
    ros::Subscriber sub = node.subscribe("/imu/data", 10, &poseCallback);

    ros::spin();
    return 0;
}