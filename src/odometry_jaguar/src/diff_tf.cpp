#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Int64.h"
#include <jaguar4x4/MotorData.h>
#include <jaguar4x4/MotorDataArray.h>
#include <tf/transform_broadcaster.h>
#include <nav_msgs/Odometry.h>
#include <math.h>

class Odometry {

public:
	Odometry();

	void spin();


private:
	ros::NodeHandle n;
	ros::Subscriber sub;
	ros::Subscriber wheel_sub;
	ros::Publisher odom_pub;

	tf::TransformBroadcaster odom_broadcaster;

	//Encoder related variables
	double rate;

	ros::Duration t_delta;

	ros::Time t_next;
	ros::Time then;

	double ticks_meter;

	double base_width;

	double dx;

	double dr;

	double x_final, y_final, theta_final;

	long ticksLF, ticksRF, ticksLR, ticksRR;
	double left_ticks, right_ticks;
	long ticksDiffLF, ticksDiffRF, ticksDiffLR, ticksDiffRR;
	double left_ticks_diff, right_ticks_diff;
	long ticksVelLF, ticksVelRF, ticksVelLR, ticksVelRR;
	double left_ticks_vel, right_ticks_vel;

	ros::Time current_time, last_time;

	void encodersCb(const jaguar4x4::MotorDataArray::ConstPtr& ticks);

	void init_variables();

	void get_node_params();

	void update();
};

Odometry::Odometry() {
	init_variables();

	ROS_INFO("Started odometry computing node");

	wheel_sub = n.subscribe("/drrobot_motor",10, &Odometry::encodersCb, this);

  	odom_pub = n.advertise<nav_msgs::Odometry>("odom", 50);

	// Retrieving parameters of this node
	get_node_params();
}

void Odometry::init_variables() {
	rate = 10;

	ticks_meter = 300/(2*M_PI*0.135); // Wheel encoder ticks per meter.

	base_width = 0.52;

	t_delta = ros::Duration(1.0 / rate);
	t_next = ros::Time::now() + t_delta;
	
	then = ros::Time::now();

	dx = 0;
	dr = 0;
 
	x_final = 0; y_final=0; theta_final=0;
	
	current_time = ros::Time::now();
  	last_time = ros::Time::now();
}

void Odometry::get_node_params() {
	if(n.getParam("rate", rate)) {
		ROS_INFO_STREAM("Rate from param" << rate);	       
	}
	if(n.getParam("ticks_meter", ticks_meter)){
		ROS_INFO_STREAM("Ticks meter" << ticks_meter);	       
	}
	if(n.getParam("base_width", base_width )){
		ROS_INFO_STREAM("Base Width" << base_width );	       
	}
}

//Spin function
void Odometry::spin(){
	ros::Rate loop_rate(rate);
	while (ros::ok()) {
		update();
		loop_rate.sleep();
	}
}

//Update function
void Odometry::update() {
	ros::Time now = ros::Time::now();

	double elapsed;

	double d_left, d_right, d, th,x,y;

	if (now > t_next) {
		elapsed = now.toSec() - then.toSec();

		d_left = left_ticks_diff / ticks_meter;
		d_right = right_ticks_diff / ticks_meter;

		d = (d_left + d_right ) / 2.0;

		th = ( d_right - d_left ) / base_width;
		
		dx = d /elapsed;

		dr = th / elapsed;

		if (d != 0) {
			x = cos( th ) * d;
			y = -sin( th ) * d;
			// Calculate the final position of the robot
			x_final = x_final + ( cos( theta_final ) * x - sin( theta_final ) * y );
			y_final = y_final + ( sin( theta_final ) * x + cos( theta_final ) * y );
		}
		if (th != 0) theta_final = theta_final + th;

		geometry_msgs::Quaternion odom_quat ;

		odom_quat.x = 0.0;
		odom_quat.y = 0.0;
		odom_quat.z = 0.0;

		odom_quat.z = sin( theta_final / 2 );
		odom_quat.w = cos( theta_final / 2 );

		//first, we'll publish the transform over tf
		geometry_msgs::TransformStamped odom_trans;
		odom_trans.header.stamp = now;
		odom_trans.header.frame_id = "odom";
		odom_trans.child_frame_id = "base_link";

		odom_trans.transform.translation.x = x_final;
		odom_trans.transform.translation.y = y_final;
		odom_trans.transform.translation.z = 0.0;
		odom_trans.transform.rotation = odom_quat;

		//send the transform
		odom_broadcaster.sendTransform(odom_trans);

		//next, we'll publish the odometry message over ROS
		nav_msgs::Odometry odom;
		odom.header.stamp = now;
		odom.header.frame_id = "odom";

		//set the position
		odom.pose.pose.position.x = x_final;
		odom.pose.pose.position.y = y_final;
		odom.pose.pose.position.z = 0.0;
		odom.pose.pose.orientation = odom_quat;

		//set the velocity
		odom.child_frame_id = "base_link";
		odom.twist.twist.linear.x = dx;
		odom.twist.twist.linear.y = 0;
		odom.twist.twist.angular.z = dr;

		//publish the message
		odom_pub.publish(odom);

		then = now;

		ros::spinOnce();
	}
}

// Left encoder callback
void Odometry::encodersCb(const jaguar4x4::MotorDataArray::ConstPtr& ticks) {
	ticksLF = ticks -> motorData[0].encoderPos;
	ticksRF = ticks -> motorData[1].encoderPos;
	ticksLR = ticks -> motorData[2].encoderPos;
	ticksRR = ticks -> motorData[3].encoderPos;
	ticksDiffLF = ticks -> motorData[0].encoderDiff;
	ticksDiffRF = ticks -> motorData[1].encoderDiff;
	ticksDiffLR = ticks -> motorData[2].encoderDiff;
	ticksDiffRR = ticks -> motorData[3].encoderDiff;
	ticksVelLF = ticks -> motorData[0].encoderVel;
	ticksVelRF = ticks -> motorData[1].encoderVel;
	ticksVelLR = ticks -> motorData[2].encoderVel;
	ticksVelRR = ticks -> motorData[3].encoderVel;
	left_ticks = double(ticksLF+ticksLR)/2.0;
	right_ticks = -double(ticksRF+ticksRR)/2.0;
	left_ticks_diff = double(ticksDiffLF+ticksDiffLR)/2.0;
	right_ticks_diff = -double(ticksDiffRF+ticksDiffRR)/2.0;
	left_ticks_vel = double(ticksVelLF+ticksVelLR)/2.0;
	right_ticks_vel = -double(ticksVelRF+ticksVelRR)/2.0;
}

int main(int argc, char **argv) {
	ros::init(argc, argv,"diff_tf");
	Odometry obj;
	obj.spin();

	return 0;
}