#!/usr/bin/env python
# -*- coding: utf-8 -*-

import math
import rospy
from pid_control_pkg.msg import pid_target


# define the trajectory function
def circle(t):
    radius = 1.2 # circle
    A = 0.1# trajectory velocity coefficient
    x_t = radius * math.cos(A * t)
    y_t = radius * math.sin(A * t)
    yaw_t = 0 #

    return x_t,y_t,yaw_t 
    

def talker():
    rospy.init_node('path_generator_node', anonymous=True)
    pub = rospy.Publisher('pid_target_topic', pid_target, queue_size=10)
    rate = rospy.Rate(50) # 10hz
    start_time = rospy.get_time()
    print(start_time)
    while not rospy.is_shutdown():
        x_t, y_t, yaw_t = circle(rospy.get_time() - start_time)
        hello_str = "Current path target %f, %f, %f" % (x_t, y_t, yaw_t)
        rospy.loginfo(hello_str)
        
        pub.publish(pid_target(x_t, y_t, yaw_t))
        rate.sleep()


if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
