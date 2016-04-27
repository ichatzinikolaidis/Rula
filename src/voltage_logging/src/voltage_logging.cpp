#include <ros/ros.h>
#include <jaguar4x4/MotorBoardInfoArray.h>
#include <jaguar4x4/MotorBoardInfo.h>

#include <ios>
#include <fstream>
#include <sstream>

void voltage_logger(const jaguar4x4::MotorBoardInfoArray::ConstPtr& msg) {
	for (int i = 0; i < 4; i++) {
		float volt = msg -> motorBoardInfo[i].volMain;
		std::ostringstream file;
		file << "voltage_log" << i << ".txt";
		const std::string file_name = file.str();
		const char* name_string = file_name.c_str();
		std::ofstream log(name_string, std::ios_base::app | std::ios_base::out);
		log << volt << "\n";
	}
	ros::Duration(10).sleep();
}

int main(int argc, char **argv) {
	ros::init(argc, argv, "voltage_logger");
	ros::NodeHandle n;
	ros::Subscriber sub = n.subscribe("/drrobot_motorboard", 100, voltage_logger);
	ros::spin();

	return 0;
}