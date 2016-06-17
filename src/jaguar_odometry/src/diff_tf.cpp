#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Int64.h"
#include <jaguar4x4/MotorData.h>
#include <jaguar4x4/MotorDataArray.h>
#include <tf/transform_broadcaster.h>
#include <nav_msgs/Odometry.h>
#include <math.h>

class Odometry_calc {
public:
	Odometry_calc();
	void spin();

private:
	ros::NodeHandle n;
	ros::Subscriber sub;
	ros::Subscriber wheel_sub;
	ros::Publisher odom_pub;
	tf::TransformBroadcaster odom_broadcaster;

	//Encoder related variables
	double encoder_min, encoder_max;
	double encoder_low_wrap, encoder_high_wrap;
	double prev_LFencoder, prev_RFencoder, prev_LRencoder, prev_RRencoder;
	double LFmult, RFmult, LRmult, RRmult;
	double enc_LF, enc_RF, enc_LR, enc_RR;
	double LF, RF, LR, RR;
	long deltaLF, deltaRF, deltaLR, deltaRR;
	double left, right;
	double d_LF, d_RF, d_LR, d_RR;

	long velLeft, velRight, vx, vtheta;

	double rate;
	ros::Duration t_delta;
	ros::Time t_next, then;
	ros::Time current_time, last_time;
	double ticks_meter;

	double base_width;
	double linear;
	double angular;
	double x_final, y_final, theta_final;

	void encodersCb(const jaguar4x4::MotorDataArray::ConstPtr&);
	void LFencoderCb(double);
	void RFencoderCb(double);
	void LRencoderCb(double);
	void RRencoderCb(double);
	void init_variables();
	void get_node_params();
	void update();
	void integrateRungeKutta2(double, double);
	void integrateExact(double, double);

	bool start;
};

Odometry_calc::Odometry_calc() {
	init_variables();

	ROS_INFO("Started odometry computing node");

	wheel_sub = n.subscribe("/drrobot_motor",100, &Odometry_calc::encodersCb, this);

  	odom_pub = n.advertise<nav_msgs::Odometry>("odom", 100);

	// Retrieving parameters of this node
	get_node_params();
}

void Odometry_calc::init_variables() {
	prev_LFencoder = 0; prev_RFencoder = 0; prev_LRencoder = 0; prev_RRencoder = 0;

	LFmult = 0; RFmult = 0; LRmult = 0; RRmult = 0;

	encoder_min =  -2147483647; // Long int min
	encoder_max =  2147483647; // Long int max

	rate = 100;

	ticks_meter = (M_PI*0.115)/500; // Wheel displacement per tick.

	base_width = 0.9;

	encoder_low_wrap = ((encoder_max - encoder_min) * 0.3) + encoder_min ;
	encoder_high_wrap = ((encoder_max - encoder_min) * 0.7) + encoder_min ;

	t_delta = ros::Duration(1.0 / rate);
	t_next = ros::Time::now() + t_delta;
	
	then = ros::Time::now();
	enc_LF = 0; enc_RF = 0; enc_LR = 0; enc_RR = 0;

	LF = 0; RF = 0; LR = 0; RR = 0;

	left = 0; right = 0;

	linear = 0; angular = 0;
 
	x_final = 0; y_final = 0; theta_final = 0;

	velLeft = 0; velRight = 0; vx = 0; vtheta = 0;
	
	current_time = ros::Time::now();
  	last_time = ros::Time::now();

  	start = true;
}

void Odometry_calc::get_node_params() {
	if(n.getParam("rate", rate)) {
		ROS_INFO_STREAM("Rate from param" << rate);	       
	}
	if(n.getParam("encoder_min", encoder_min)){
		ROS_INFO_STREAM("Encoder min from param" << encoder_min);	       
	}
	if(n.getParam("encoder_max", encoder_max)){
		ROS_INFO_STREAM("Encoder max from param" << encoder_max);	       
	}
	if(n.getParam("wheel_low_wrap", encoder_low_wrap)){
		ROS_INFO_STREAM("wheel_low_wrap from param" << encoder_low_wrap);	       
	}
	if(n.getParam("wheel_high_wrap", encoder_high_wrap)){
		ROS_INFO_STREAM("wheel_high_wrap from param" << encoder_high_wrap);	       
	}
	if(n.getParam("ticks_meter", ticks_meter)){
		ROS_INFO_STREAM("Ticks meter" << ticks_meter);	       
	}
	if(n.getParam("base_width", base_width )){
		ROS_INFO_STREAM("Base Width" << base_width );	       
	}
}

//Spin function
void Odometry_calc::spin(){
	ros::Rate loop_rate(rate);
	while (ros::ok()) {
		update();
		loop_rate.sleep();
	}
}

void Odometry_calc::integrateRungeKutta2(double linear, double angular) {
	const double direction = theta_final + angular * 0.5;
    // Runge-Kutta 2nd order integration:
    x_final     += linear * cos(direction);
    y_final     += linear * sin(direction);
    theta_final += angular;
}

void Odometry_calc::integrateExact(double linear, double angular) {
    if (fabs(angular) < 1e-6) integrateRungeKutta2(linear, angular);
    else {
    	// Exact integration (should solve problems when angular is zero):
    	const double theta_finalold = theta_final;
    	const double r = linear/angular;
    	theta_final += angular;
    	x_final     +=  r * (sin(theta_final) - sin(theta_finalold));
    	y_final     += -r * (cos(theta_final) - cos(theta_finalold));
    }
}

//Update function
void Odometry_calc::update() {
	ros::Time now = ros::Time::now();

	double elapsed;

	double d, th, x, y, dx, dr;

	elapsed = now.toSec() - then.toSec();

	linear = (left + right) * 0.5;
	angular = -(left - right) / base_width;
	integrateExact(linear, angular);
	geometry_msgs::Quaternion odom_quat ;

	odom_quat.x = 0.0;
	odom_quat.y = 0.0;
	odom_quat.z = sin(theta_final * 0.5);
	odom_quat.w = cos(theta_final * 0.5);

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
	//odom_broadcaster.sendTransform(odom_trans);

	//next, we'll publish the odometry message over ROS
	nav_msgs::Odometry odom;
	odom.header.stamp = now;
	odom.header.frame_id = "odom";
	odom.child_frame_id = "base_link";

	//set the position
	odom.pose.pose.position.x = x_final;
	odom.pose.pose.position.y = y_final;
	odom.pose.pose.position.z = 0.0;
	odom.pose.pose.orientation = odom_quat;
	odom.pose.covariance[0] = 0.001;
	odom.pose.covariance[7] = 0.001;
	odom.pose.covariance[14] = 0.001;
	odom.pose.covariance[21] = 0.001;
	odom.pose.covariance[28] = 0.001;
	odom.pose.covariance[35] = 0.003;

	//set the velocity
	odom.twist.twist.linear.x = vx * 0.00386;
	odom.twist.twist.linear.y = 0;
	odom.twist.twist.angular.z = vtheta * 0.00308 * 4;
	odom.twist.covariance[0] = 0.001;
	odom.twist.covariance[7] = 0.001;
	odom.twist.covariance[14] = 0.001;
	odom.twist.covariance[21] = 0.001;
	odom.twist.covariance[28] = 0.001;
	odom.twist.covariance[35] = 0.003;

	//publish the message
	odom_pub.publish(odom);

	then = now;

	ros::spinOnce();
}

// Left encoder callback
void Odometry_calc::encodersCb(const jaguar4x4::MotorDataArray::ConstPtr& ticks) {
	if (start) {
		deltaLF = ticks -> motorData[0].encoderPos;
		deltaLR = ticks -> motorData[2].encoderPos;
		deltaRF = -(ticks -> motorData[1].encoderPos);
		deltaRR = -(ticks -> motorData[3].encoderPos);
		Odometry_calc::LFencoderCb((double)deltaLF);
		Odometry_calc::RFencoderCb((double)deltaRF);
		Odometry_calc::LRencoderCb((double)deltaLR);
		Odometry_calc::RRencoderCb((double)deltaRR);
		enc_LF = LF;
		enc_LR = LR;
		enc_RF = RF;
		enc_RR = RR;
		start = false;
	}
	deltaLF = ticks -> motorData[0].encoderPos;
	deltaLR = ticks -> motorData[2].encoderPos;
	deltaRF = -(ticks -> motorData[1].encoderPos);
	deltaRR = -(ticks -> motorData[3].encoderPos);
	Odometry_calc::LFencoderCb((double)deltaLF);
	Odometry_calc::RFencoderCb((double)deltaRF);
	Odometry_calc::LRencoderCb((double)deltaLR);
	Odometry_calc::RRencoderCb((double)deltaRR);

	d_LF = LF - enc_LF;
	d_RF = RF - enc_RF;
	d_LR = LR - enc_LR;
	d_RR = RR - enc_RR;
	enc_LF = LF;
	enc_LR = LR;
	enc_RF = RF;
	enc_RR = RR;
	left = (d_LF+d_LR)*0.5;
	right = (d_RF+d_RR)*0.5;
	left *= ticks_meter;
	right *= ticks_meter;

	long velLF = ticks -> motorData[0].encoderDiff;
	long velLR = ticks -> motorData[2].encoderDiff;
	long velRF = -(ticks -> motorData[1].encoderDiff);
	long velRR = -(ticks -> motorData[3].encoderDiff);
	if (abs(velLF) < abs(velLR)) {
		velLeft = velLF;
	}
	else {
		velLeft = velLR;
	}
	if (abs(velRF) < abs(velRR)) {
		velRight = velRF;
	}
	else {
		velRight = velRR;
	}
	vx = velRight + velLeft;
	vtheta = velRight - velLeft;
}

// Left front encoder callback
void Odometry_calc::LFencoderCb(double enc) {
	if((enc < encoder_low_wrap) && (prev_LFencoder > encoder_high_wrap)) {
		LFmult += 1;
	}

	if((enc > encoder_high_wrap) && (prev_LFencoder < encoder_low_wrap)) {
		LFmult -= 1;
	}

	LF = 1.0 * (enc + LFmult * (encoder_max - encoder_min ));

	prev_LFencoder = enc;
}

// Right front encoder callback
void Odometry_calc::RFencoderCb(double enc) {
	if((enc < encoder_low_wrap) && (prev_RFencoder > encoder_high_wrap)) {
		RFmult += 1;
	}

	if((enc > encoder_high_wrap) && (prev_RFencoder < encoder_low_wrap)) {
		RFmult -= 1;
	}

	RF = 1.0 * (enc + RFmult * (encoder_max - encoder_min ));

	prev_RFencoder = enc;
}
// Left rear encoder callback
void Odometry_calc::LRencoderCb(double enc) {
	if((enc < encoder_low_wrap) && (prev_LRencoder > encoder_high_wrap)) {
		LRmult += 1;
	}

	if((enc > encoder_high_wrap) && (prev_LRencoder < encoder_low_wrap)) {
		LRmult -= 1;
	}

	LR = 1.0 * (enc + LRmult * (encoder_max - encoder_min ));

	prev_LRencoder = enc;
}
// Right rear encoder callback
void Odometry_calc::RRencoderCb(double enc) {
	if((enc < encoder_low_wrap) && (prev_RRencoder > encoder_high_wrap)) {
		RRmult += 1;
	}

	if((enc > encoder_high_wrap) && (prev_RRencoder < encoder_low_wrap)) {
		RRmult -= 1;
	}

	RR = 1.0 * (enc + RRmult * (encoder_max - encoder_min ));

	prev_RRencoder = enc;
}

int main(int argc, char **argv) {
	ros::init(argc, argv,"diff_tf");
	Odometry_calc obj;
	obj.spin();

	return 0;
}