#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Int64.h"
#include <jaguar4x4/MotorData.h>
#include <jaguar4x4/MotorDataArray.h>
#include <tf/transform_broadcaster.h>
#include <nav_msgs/Odometry.h>
#include <math.h>
#include <algorithm>

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
	double left;
	double right;

	double rate;

	ros::Duration t_delta;

	ros::Time t_next;
	ros::Time then;

	double left_ticks;
	double right_ticks;

	double ticks_meter;

	double base_width;

	double linear, angular;

	double x_,y_, heading_;

	long deltaLF, deltaRF, deltaLR, deltaRR;

	ros::Time current_time, last_time;

	void encodersCb(const jaguar4x4::MotorDataArray::ConstPtr&);

	void integrateRungeKutta2(double, double);

	void integrateExact(double, double);

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
	left = 0;
	right = 0;

	rate = 10;

	ticks_meter = (2*M_PI*0.135)/300; // Wheel displacement per tick.

	base_width = 0.52;

	t_delta = ros::Duration(1.0 / rate);
	t_next = ros::Time::now() + t_delta;
	
	then = ros::Time::now();

	linear = 0;
	angular = 0;
 
	x_ = 0; y_=0; heading_=0;
	
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

void Odometry::integrateRungeKutta2(double linear, double angular) {
	const double direction = heading_ + angular * 0.5;

    /// Runge-Kutta 2nd order integration:
    x_       += linear * cos(direction);
    y_       += linear * sin(direction);
    heading_ += angular;
}

void Odometry::integrateExact(double linear, double angular) {
    if (fabs(angular) < 1e-6) integrateRungeKutta2(linear, angular);
    else {
    	/// Exact integration (should solve problems when angular is zero):
    	const double heading_old = heading_;
    	const double r = linear/angular;
    	heading_ += angular;
    	x_       +=  r * (sin(heading_) - sin(heading_old));
    	y_       += -r * (cos(heading_) - cos(heading_old));
    }
}

//Update function
void Odometry::update() {
	ros::Time now = ros::Time::now();

	double elapsed;

	double d_left, d_right, d, th,x,y;

	if (now > t_next) {
		elapsed = now.toSec() - then.toSec();

		d_left = left * ticks_meter;
		d_right = right * ticks_meter;

		d = (d_left + d_right ) / 2.0;

		th = ( d_right - d_left ) / base_width;
		
		linear = d /elapsed;

		angular = th / elapsed;

		integrateExact(linear, angular);

		geometry_msgs::Quaternion odom_quat ;

		odom_quat.x = 0.0;
		odom_quat.y = 0.0;
		odom_quat.z = 0.0;

		odom_quat.z = sin( heading_ / 2 );
		odom_quat.w = cos( heading_ / 2 );

		//first, we'll publish the transform over tf
		geometry_msgs::TransformStamped odom_trans;
		odom_trans.header.stamp = now;
		odom_trans.header.frame_id = "odom";
		odom_trans.child_frame_id = "base_link";

		odom_trans.transform.translation.x = x_;
		odom_trans.transform.translation.y = y_;
		odom_trans.transform.translation.z = 0.0;
		odom_trans.transform.rotation = odom_quat;

		//send the transform
		odom_broadcaster.sendTransform(odom_trans);

		//next, we'll publish the odometry message over ROS
		nav_msgs::Odometry odom;
		odom.header.stamp = now;
		odom.header.frame_id = "odom";

		//set the position
		odom.pose.pose.position.x = x_;
		odom.pose.pose.position.y = y_;
		odom.pose.pose.position.z = 0.0;
		odom.pose.pose.orientation = odom_quat;
		odom.pose.covariance[0] = 0.001;
		odom.pose.covariance[7] = 0.001;
		odom.pose.covariance[14] = 1000000.0;
		odom.pose.covariance[21] = 1000000.0;
		odom.pose.covariance[28] = 1000000.0;
		odom.pose.covariance[35] = 1000.0;

		//set the velocity
		odom.child_frame_id = "base_link";
		odom.twist.twist.linear.x = linear;
		odom.twist.twist.linear.y = 0;
		odom.twist.twist.angular.z = angular;
		odom.twist.covariance[0] = 0.001;
		odom.twist.covariance[7] = 0.001;
		odom.twist.covariance[14] = 1000000.0;
		odom.twist.covariance[21] = 1000000.0;
		odom.twist.covariance[28] = 1000000.0;
		odom.twist.covariance[35] = 1000.0;


		//publish the message
		odom_pub.publish(odom);

		then = now;

		ros::spinOnce();
	}
}

// Left encoder callback
void Odometry::encodersCb(const jaguar4x4::MotorDataArray::ConstPtr& ticks) {
	deltaLF = ticks -> motorData[0].encoderDiff;
	deltaRF = ticks -> motorData[1].encoderDiff;
	deltaLR = ticks -> motorData[2].encoderDiff;
	deltaRR = ticks -> motorData[3].encoderDiff;
	if (abs(deltaLF-deltaLR)>1.5) left = (double)std::min(deltaLF,deltaLR);
	else left = ((double)(deltaLF+deltaLR))*0.5;
	if (abs(deltaRF-deltaRR)>1.5) right = -(double)std::min(deltaRF,deltaRR);
	else right = -((double)(deltaRF+deltaRR))*0.5;
}

int main(int argc, char **argv) {
	ros::init(argc, argv,"diff_tf");
	Odometry obj;
	obj.spin();

	return 0;
}