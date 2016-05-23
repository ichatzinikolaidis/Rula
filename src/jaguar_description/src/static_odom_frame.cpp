#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include "sensor_msgs/Imu.h"

void poseCallback(const sensor_msgs::Imu& msg){
    static tf::TransformBroadcaster tf_br;
    tf::Transform transform;
    tf::Quaternion q;
    q = tf::Quaternion(msg.orientation.x, msg.orientation.y, msg.orientation.z, msg.orientation.w);
    transform.setOrigin( tf::Vector3(0.0, 0.0, 0.0) );
    transform.setRotation(q);
    tf_br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "odom", "base_link"));
}

int main(int argc, char** argv){
    ros::init(argc, argv, "static_odom_frame");
    ros::NodeHandle node;
    ros::Subscriber sub = node.subscribe("/imu/data", 10, &poseCallback);
    ros::spin();
    return 0;
}