#!/usr/bin/env python

import roslib, rospy
import time
from geometry_msgs.msg import Twist
from std_msgs.msg import String

cmd_vel_subscriber = None
publisher = None
unlocked = False
max_vel = 1000

def initSubscriberAndPublisher():
	global cmd_vel_subscriber, publisher, unlocked
	rospy.init_node("jaguar_cmd_vel_subscriber")
	publisher = rospy.Publisher("drrobot_motor_cmd", String, queue_size=1)
	cmd_vel_subscriber = rospy.Subscriber("/cmd_vel", Twist, cmdVelCallback)
	time.sleep(2);
	publisher.publish("MMW !MG")
	print "E-brake released!"
	unlocked = True
	print "Waiting for cmd_vel..."
	rospy.spin()

def cmdVelCallback(msg):
	global publisher, unlocked, max_vel
	if not unlocked:
		print "Please wait for the e-brake release!!"
	else:
		'''linear_vel = msg.linear.x * max_vel;
		angular_vel = msg.angular.z;
		print msg.linear.x
		move = False;
		p = "MMW !M "

		if abs(angular_vel) <= 0.001: 
			p = p + str(linear_vel) + " " + str(-linear_vel)
			move = True
		else:
			if(abs(msg.linear.x) >= 0.01):
				if angular_vel > 0: #turn left
					p = p + str(linear_vel) + " " + str(-linear_vel*(1-abs(angular_vel)))
					move = True
				elif angular_vel < 0: #turn right
					p = p + str(linear_vel*(1-abs(angular_vel))) + " " + str(-linear_vel)
					move = True
			else:
				angular_vel = angular_vel * max_vel
				#z-turn
				p = p + str(angular_vel) + " " + str(angular_vel)
				move = True'''


		linear_vel = msg.linear.x * max_vel
		angular_vel = msg.angular.z * max_vel 
		move = False
		p = "MMW !M "

		if abs(msg.angular.z) <= 0.0001: 
			p = p + str(linear_vel) + " " + str(-linear_vel)
			move = True
		else:
			move = True
			if(abs(msg.linear.x) >= 0.0001):
				if angular_vel > 0: #turn left
					if linear_vel > 0: #going forward
						p = p + str(linear_vel) + " " + str(-linear_vel - angular_vel)
					else: #going backwards
						p = p + str(linear_vel) + " " + str(abs(linear_vel) + angular_vel)
				elif angular_vel < 0: #turn right
					if linear_vel > 0: #going forward
						p = p + str(linear_vel + abs(angular_vel)) + " " + str(-linear_vel)
					else: #going backwards
						p = p + str(-(abs(linear_vel) + abs(angular_vel))) + " " + str(-linear_vel)
			else:
				#z-turn
				p = p + str(-angular_vel) + " " + str(-angular_vel)

		if not move:
			p = p + "0 0"

		publisher.publish(p)

if __name__ == '__main__':
	initSubscriberAndPublisher()
