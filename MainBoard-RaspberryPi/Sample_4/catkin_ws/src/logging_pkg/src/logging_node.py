#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import math
import rospy
import numpy as np
from geometry_msgs.msg import PoseStamped
from cuboat_actuators.msg import propeller
from pid_control_pkg.msg import pid_target

class Log():
    def __init__(self):
        #
        rospy.init_node('logging_node', anonymous=True)
        
        # save time, state, pwm
        self.pwm_list = [0,0,0,0]
        self.state = [0,0,0]
        self.target = [0,0,0] # x,y,w
        
        # log file
        self.log_file = "/home/corvin/catkin_ws/src/logging_pkg/src/data_" + str(rospy.get_time()) + ".txt"
        
        # calibration
        self.cali_file = "/home/corvin/catkin_ws/src/pid_control_pkg/src/Configuration/MotionCaptureCalibration.csv"
        if os.path.exists(self.cali_file):
            self.cali = np.loadtxt(self.cali_file, delimiter=",")
        else:
            self.cali = [0,0,0]
        
        #
        self.current_subscriber = rospy.Subscriber('vrpn_client_node/cuboat/pose', PoseStamped, self.save_state)
        
        #
        self.propeller_subscriber = rospy.Subscriber('propeller_topic', propeller, self.save_propeller)
        
        #
        self.target_subscriber = rospy.Subscriber('pid_target_topic', pid_target, self.target_fb)
        
        self.start()
        #
        rospy.spin()
        
    def target_fb(self, goal):
        #
        self.target[0] = goal.x
        self.target[1] = goal.y
        self.target[2] = goal.yaw
        
    def save_propeller(self, propeller):
        #rospy.loginfo('Propeller listener: %d, %d, %d, %d.', propeller.front, propeller.back, propeller.left, propeller.right)   
        self.pwm_list[0] = propeller.front
        self.pwm_list[1] = propeller.back
        self.pwm_list[2] = propeller.left
        self.pwm_list[3] = propeller.right
        
    def save_state(self, pose):
        # pose.pose.position.x; pose.pose.orientation.x
        self.state[0] = pose.pose.position.x - self.cali[0]
        self.state[1] = pose.pose.position.z - self.cali[1]
        self.state[2] = self.quat2euler(pose.pose.orientation)
        
    def quat2euler(self, quat):
        # structure
        w = quat.x
        y = quat.y
        z = quat.z
        x = quat.w
        
        r = math.atan2(2*(w*x+y*z), 1-2*(x*x+y*y))
        p = math.asin(2*(w*y-z*x))
        y = math.atan2(2*(w*z+x*y), 1-2*(z*z+y*y))
        
        yaw = math.pi/2 - y - self.cali[2]
        while yaw <= -math.pi:
            yaw += 2*math.pi
        while yaw > math.pi:
            yaw -= 2*math.pi
        
        return yaw
    
    def start(self):
        #
        print("start")
        
        r = rospy.Rate(30)
        
        fp=open(self.log_file, "w", encoding="utf-8")
        start_time = rospy.get_time()
        while not rospy.is_shutdown():
            fp.write("Time: " + str(rospy.get_time() - start_time) +
                     "\nState: " + str(self.state) + "\nControl: "
                 + str(self.pwm_list ) + "\nTarget: "
                 + str(self.target ) + '\n\n')
            r.sleep()
         
if __name__=='__main__':
    #
    log = Log()
    
