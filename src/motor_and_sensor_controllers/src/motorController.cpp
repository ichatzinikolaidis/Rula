#include <ros/ros.h>

// ROS messages
#include <geometry_msgs/Twist.h>
#include <std_msgs/String.h>

// Custom messages
#include <jaguar4x4/MotorData.h>
#include <jaguar4x4/MotorDataArray.h>
#include <jaguar4x4/MotorBoardInfoArray.h>
#include <jaguar4x4/MotorBoardInfo.h>

// Include original driver files
#include <DrRobotMotionSensorDriver.hpp>

// Include other libraries
#include <boost/thread.hpp>
#include <boost/lexical_cast.hpp>

// Define constants
#define MOTOR_NUM 8
#define MOTOR_BOARD_NUM 4

using namespace std;
using namespace DrRobot_MotionSensorDriver;

class Motor_Controller_Node {

public:
	ros::NodeHandle node; // Initialize ROS node
	ros::Publisher motorInfo_pub;
    ros::Publisher motorBoardInfo_pub;
    ros::Subscriber cmd_vel; // Listen to topics regarding commanded velocity

    Motor_Controller_Node() {
    	robotID = "Jaguar4x4"; // Name of robot
    	ROS_INFO("I get name: [%s]", robotID.c_str());
    	robotType = "Jaguar"; // Type of robot
    	ROS_INFO("I get type: [%s]", robotType.c_str());
    	robotCommMethod = "Network"; // Method of communication
    	ROS_INFO("I get communication method: [%s]", robotCommMethod.c_str());
    	robotIP = "192.168.0.60"; // Robot's IP address
    	ROS_INFO("I get IP address: [%s]", robotIP.c_str());
    	commPortNum = 10001; // Port number
    	ROS_INFO("I get port number: [%d]", commPortNum);
    	wheelRadius = 0.135; // Wheel radius
    	ROS_INFO("I get wheel radius: [%f]", wheelRadius);
    	wheelDis = 0.52; // Distance between two opposite wheels
    	ROS_INFO("I get wheel distance: [%f]", wheelDis);
    	minSpeed = 0.1; // Minimum speed in meter/sec
    	ROS_INFO("I get minimum speed: [%f]", minSpeed);
    	maxSpeed = 1.0; // Maximum speed in meter/sec
    	ROS_INFO("I get maximum speed: [%f]", maxSpeed);
    	encoderOneCircleCnt = 300; // Number of encoders per circle
    	ROS_INFO("I get number of encoders per circle: [%d]", encoderOneCircleCnt);

    	drrobotMotionDriver = new DrRobotMotionSensorDriver(); // Creation of an instance of the basic robot's class

    	// Construction of DrRobotMotionConfig struct
    	robotConfig.commMethod = Network;
    	robotConfig.robotType = Jaguar;
    	robotConfig.portNum = commPortNum;
    	strcpy(robotConfig.robotIP, robotIP.c_str());

    	drrobotMotionDriver -> setDrRobotMotionDriverConfig(&robotConfig);

    	// Create publishers for motor data information
    	motorInfo_pub = node.advertise<jaguar4x4::MotorDataArray>("drrobot_motor", 1);
    	motorBoardInfo_pub = node.advertise<jaguar4x4::MotorBoardInfoArray>("drrobot_motorboard", 1);
    }

    // Destructor
    ~Motor_Controller_Node() {}

    // Open network connection and start communication
    int start() {
    	int res = -1;
    	res = drrobotMotionDriver -> openNetwork(robotConfig.robotIP, robotConfig.portNum); // Try connection
        if (res == 0) { // Connection successful
        	ROS_INFO("Open port number at: [%d]", robotConfig.portNum);
        }
        else { // Connection failed
        	ROS_INFO("Could not open network connection to [%s,%d]", robotConfig.robotIP, robotConfig.portNum);
        }

        cmd_vel = node.subscribe<std_msgs::String>("cmd_vel", 1, boost::bind(&Motor_Controller_Node::cmdReceived, this, _1)); // Listen to commanded velocity topics
        return(0);
    }

    // Stop communication
    int stop() {
    	drrobotMotionDriver->close();
    	usleep(1000000);
    	return(0);
    }

    // Send command to robot
    void cmdReceived(const std_msgs::String::ConstPtr& cmd_data) {
    	ROS_INFO("Received motor command: [%s]", cmd_data->data.c_str());
    	int nLen = strlen(cmd_data -> data.c_str());
    	drrobotMotionDriver -> sendCommand(cmd_data -> data.c_str(), nLen); // Send command to robot
    }

    // Publish information about motor status
    void doUpdate() {
    	drrobotMotionDriver -> readMotorSensorData(&motorSensorData);
    	drrobotMotionDriver -> readMotorBoardData(&motorBoardData);

    	// Motor board information from sensors
    	jaguar4x4::MotorDataArray motorDataArray;
    	motorDataArray.motorData.resize(MOTOR_NUM);
    	for (uint32_t i = 0 ; i < MOTOR_NUM; ++i) {
    		motorDataArray.motorData[i].header.stamp = ros::Time::now();
    		motorDataArray.motorData[i].header.frame_id = string("drrobot_motor");
    		motorDataArray.motorData[i].header.frame_id += boost::lexical_cast<std::string>(i);

    		motorDataArray.motorData[i].motorPower = motorSensorData.motorSensorPWM[i];
    		motorDataArray.motorData[i].encoderPos = motorSensorData.motorSensorEncoderPos[i];
    		motorDataArray.motorData[i].encoderVel = motorSensorData.motorSensorEncoderVel[i];
    		motorDataArray.motorData[i].encoderDiff = motorSensorData.motorSensorEncoderPosDiff[i];
    		motorDataArray.motorData[i].motorTemp = motorSensorData.motorSensorTemperature[i];
    		motorDataArray.motorData[i].motorCurrent = motorSensorData.motorSensorCurrent[i];
    	}

    	// Publish motor board information from sensors
    	motorInfo_pub.publish(motorDataArray);

    	// Motor board status
    	jaguar4x4::MotorBoardInfoArray motorBoardInfoArray;
    	motorBoardInfoArray.motorBoardInfo.resize(MOTOR_BOARD_NUM);
    	for (uint32_t i = 0 ; i < MOTOR_BOARD_NUM; ++i) {
    		motorBoardInfoArray.motorBoardInfo[i].header.stamp = ros::Time::now();
    		motorBoardInfoArray.motorBoardInfo[i].header.frame_id = string("drrobot_motor");
    		motorBoardInfoArray.motorBoardInfo[i].header.frame_id += boost::lexical_cast<std::string>(i);

    		motorBoardInfoArray.motorBoardInfo[i].status = motorBoardData.status[i];
    		motorBoardInfoArray.motorBoardInfo[i].temp1 = motorBoardData.temp1[i];
    		motorBoardInfoArray.motorBoardInfo[i].temp2 = motorBoardData.temp2[i];
    		motorBoardInfoArray.motorBoardInfo[i].temp3 = motorBoardData.temp3[i];

    		motorBoardInfoArray.motorBoardInfo[i].volMain = motorBoardData.volMain[i];
    		motorBoardInfoArray.motorBoardInfo[i].vol12V = motorBoardData.vol12V[i];
    		motorBoardInfoArray.motorBoardInfo[i].vol5V = motorBoardData.vol5V[i];
    		motorBoardInfoArray.motorBoardInfo[i].dinput = motorBoardData.dinput[i];
    		motorBoardInfoArray.motorBoardInfo[i].doutput = motorBoardData.doutput[i];
    		motorBoardInfoArray.motorBoardInfo[i].ack = motorBoardData.ack[i];
    	}

    	// Publish information about board status
    	motorBoardInfo_pub.publish(motorBoardInfoArray);

    	// Send ping command here
    	drrobotMotionDriver -> sendCommand("PING", 4);
    }

private:
	// Define variables
	DrRobotMotionSensorDriver* drrobotMotionDriver;
	struct DrRobotMotionConfig robotConfig;
	struct MotorSensorData motorSensorData;
    struct MotorBoardData motorBoardData;
    std::string robotType;
    std::string robotID;
    std::string robotIP;
    std::string robotCommMethod;
    int commPortNum;
    int encoderOneCircleCnt;
    double wheelDis;
    double wheelRadius;
    double minSpeed;
    double maxSpeed;
};

int main(int argc, char** argv) {
	ros::init(argc, argv, "jaguar4x4_node");

	Motor_Controller_Node drrobotPlayer;
	ros::NodeHandle n;

	// Start up the robot
	if (drrobotPlayer.start() != 0) {
		exit(-1);
	}

	ros::Rate loop_rate(50); //10Hz

	while ( n.ok() ) {
		drrobotPlayer.doUpdate();
		ros::spinOnce();
		loop_rate.sleep();
	}

	// Stop the robot
	drrobotPlayer.stop();
	return(0);
}