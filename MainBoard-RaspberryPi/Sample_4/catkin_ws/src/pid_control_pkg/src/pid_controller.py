#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import math
import rospy
import numpy as np
from PID import PID
from pid_control_pkg.msg import pid_target
from geometry_msgs.msg import PoseStamped
from cuboat_actuators.msg import propeller


# adjust PID to ceiling value
def int_norm(pid_output):
    if pid_output >= 0:
        norm_output = math.ceil(pid_output)
    if pid_output < 0:
        norm_output = math.floor(pid_output)
    return norm_output


def pid_norm(pid_output):
    if pid_output > 1900:
        return 1900
    elif pid_output < 1100:
        return 1100
    else:
        return pid_output

# limit the angle to -180~180
def angle_norm(old_angle): 
    if old_angle > math.pi:
        return old_angle - 2 * math.pi
    elif old_angle <= -math.pi:
        return old_angle + 2 * math.pi
    else:
        return old_angle

class PIDcontroller():
    def __init__(self, pid_fb=None, pid_sd=None, pid_orient=None):
        # init the PID
        self.PID_orient = PID(pid_orient[0],pid_orient[1],pid_orient[2]) # adjust the orientation
        self.PID_forback = PID(pid_fb[0],pid_fb[1],pid_fb[2]) # adjust the forward / backward position
        self.PID_side = PID(pid_sd[0],pid_sd[1],pid_sd[2]) # adjust the sideward position
        #rospy.loginfo("Init PID.")
        
        # PID setpoint
        self.PID_orient.setGoal(0) 
        self.PID_forback.setGoal(0)
        self.PID_side.setGoal(0)
        
        # init state
        self.state = [0,0,0] # x,y,w
        
        # init target
        self.target = [0,0,0] # x,y,w
        self.current_target = [0,0,0] # x,y,w
        
        # calibration
        self.cali_file = "/home/corvin/catkin_ws/src/pid_control_pkg/src/Configuration/MotionCaptureCalibration.csv"
        if os.path.exists(self.cali_file):
            self.cali = np.loadtxt(self.cali_file, delimiter=",")
        else:
            self.cali = [0,0,0]
        
        # init node
        rospy.init_node('pid_control_node', anonymous=True)
        
        # publish to propeller msg
        self.propeller_pulisher = rospy.Publisher('propeller_topic', propeller, queue_size=10)
        
        # listen to pid_target msg
        self.current_subscriber = rospy.Subscriber('vrpn_client_node/cuboat3/pose', PoseStamped, self.feedback)
        self.target_subscriber = rospy.Subscriber('pid_target_topic', pid_target, self.target_fb)
        #self.calibration()
        self.control()
        
        
        rospy.spin()

    def feedback(self, pose):    
        # pose.pose.position.x; pose.pose.orientation.x
        self.state[0] = pose.pose.position.x - self.cali[0]
        self.state[1] = pose.pose.position.z - self.cali[1]
        self.state[2] = self.quat2euler(pose.pose.orientation)
        rospy.loginfo("Pose: position: %f, %f. orientation: %f.", self.state[0], self.state[1], self.state[2])
        #self.control_cycle(0,0,0)
        
    def target_fb(self, goal):
        #
        self.target[0] = goal.x
        self.target[1] = goal.y
        self.target[2] = goal.yaw
        
    def control(self):
        r = rospy.Rate(30)
        while not rospy.is_shutdown():                 
            self.linepath()
            self.control_cycle(self.current_target[0],self.current_target[1],self.current_target[2])
            r.sleep()
    
    def linepath(self):
        step = 0.05 # moving velocity
        L = math.sqrt((self.target[1] - self.state[1])**2+(self.target[0] - self.state[0])**2)
        theta = math.atan2(self.target[1] - self.state[1], self.target[0] - self.state[0])
        if step > L:
            step = L
        self.current_target[0] = self.state[0] + step*math.cos(theta)
        self.current_target[1] = self.state[1] + step*math.sin(theta)
        self.current_target[2] = self.target[2]
        
    def control_cycle(self, x_t, y_t,yaw_t):
        # current state
        x = self.state[0] 
        y = self.state[1] 
        yaw = self.state[2] 
        
        # set target point
        #x_t = goal.x
        #y_t = goal.y
        #yaw_t = goal.yaw
        #x_t = 0
        #y_t = 0
        #yaw_t = 0
        #print('Circle: (', x_t, ', ', y_t, ')')
        
        # heading feed back
        self.PID_orient.update(angle_norm(yaw - yaw_t)) # >0 on the left
        
        # forward, backward feedback
        distance = math.sqrt(math.pow(x - x_t, 2) + math.pow(y - y_t, 2)) # from current to target
        radius = math.sqrt(math.pow(x - 0, 2) + math.pow(y - 0, 2))
        #rospy.loginfo('distance:  %f ; radius: %f ', distance, radius)
        azimuth = math.atan2(y - y_t, x - x_t) # position angle -180~180
        inter_angle = angle_norm(math.pi + yaw - azimuth)
        #print('inter angle:  ', inter_angle)
        
        self.PID_forback.update(distance * math.cos(inter_angle)) # >0 forward
        
        # sideward feedback
        self.PID_side.update(distance * math.sin(inter_angle)) # >0 rightward
        #print('Boat yaw: ', yaw, '   target angle: ', yaw_t)    
        
        # execute
        control_orient = int_norm(self.PID_orient.output)
        #print('rotate: ', control_orient)
        control_fb = int_norm(self.PID_forback.output)
        #print('forward/backward: ', control_fb)
        control_side = int_norm(self.PID_side.output)
        #print('sideward: ', control_side)
        cof_f = 0
        cof_b = 0
        if control_side > 0:
            cof_f = 0.2
        if control_side < 0:
            cof_b = 0.3
        
        cof_l = 0
        cof_r = 0
        if control_fb > 0:
            cof_r = 0.5
        if control_fb < 0:
            cof_l = 0.9
        
        median = 1500
        
        pwm_front = pid_norm(median + int_norm((1 + cof_f) * control_side) + control_orient)
        pwm_back = pid_norm(median - int_norm((1 + cof_b) * control_side) + control_orient)
        pwm_left = pid_norm(median - int_norm((1 + cof_l) *control_fb))
        pwm_right = pid_norm(median - int_norm((1 + cof_r) *control_fb))
        
        #rospy.loginfo("Time: %f; State: %f, %f, %f; Control: %d, %d, %d, %d. " , rospy.get_time() ,
        #         self.state[0], self.state[1], self.state[2], pwm_front, pwm_back, pwm_left, pwm_right)
        
        self.propeller_pulisher.publish(propeller(pwm_front, pwm_back, pwm_left, pwm_right))
            
            
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

    def calibration(self):
        input("Start calibration? : ")
        # delete old cali file
        if os.path.exists(self.cali_file):
            os.remove(self.cali_file)
        # create a new one
        self.cali = np.sum([self.state, self.cali], axis=0).tolist()
        np.savetxt(self.cali_file, self.cali, delimiter = ",")
                            

if __name__=='__main__':
    #
    Pf = 1500
    If = 10.5
    Df = 7
    
    Ps = 1500
    Is = 10.5
    Ds = 7
    
    Po = 153
    Io = 2.4
    Do = 1.6
    
    
    pid_fb = [Pf,If,Df]
    pid_sd = [Ps,Is,Ds]
    pid_orient = [Po,Io,Do]
    
    pid = PIDcontroller(pid_fb, pid_sd, pid_orient)
