#!/usr/bin/env python
# -*- coding: utf-8 -*-

import math
import rospy
import socket
import struct
import actionlib
from pid_control_pkg.msg import pid_target
from cuboat_actuators.msg import *

# define the trajectory function
def circle(t):
    radius = 1.2 # circle
    A = 0.1# trajectory velocity coefficient
    x_t = radius * math.cos(A * t)
    y_t = radius * math.sin(A * t)
    yaw_t = 0 #

    return x_t,y_t,yaw_t 
    
#
def eight(t):
    x_amp = 2
    y_amp = 4
    A = 0.05# trajectory velocity coefficient
    t = A*t
    x_t = x_amp * math.cos(t)/(1+math.sin(t)*math.sin(t))
    y_t = y_amp * math.sin(t)*math.cos(t)/(1+math.sin(t)*math.sin(t))
    yaw_t = 0
    
    return x_t,y_t,yaw_t 

def talker():
    rospy.init_node('path_generator_node', anonymous=True)
    pub = rospy.Publisher('pid_target_topic', pid_target, queue_size=10)
    rate = rospy.Rate(30) # hz
    start_time = rospy.get_time()
    print(start_time)
    while not rospy.is_shutdown():
        x_t, y_t, yaw_t = circle(rospy.get_time() - start_time)
        #x_t, y_t, yaw_t = eight(rospy.get_time() - start_time)
        hello_str = "Current path target %f, %f, %f" % (x_t, y_t, yaw_t)
        rospy.loginfo(hello_str)
        
        pub.publish(pid_target(x_t, y_t, yaw_t))
        rate.sleep()

class Task():
    def __init__(self, file):
        # init node
        rospy.init_node('path_generator_node', anonymous=True)
        
        # pub to pid_target_topic
        self.target_pub = rospy.Publisher('pid_target_topic', pid_target, queue_size=10)
        
        # listen to the dock state
        self.dock_servo_state = [0, 0, 0, 0] 
        self.dock_subscriber = rospy.Subscriber('dock_detector_topic', dock, self.dock_fb)
        
        # pub to dock servo
        self.servo_client = actionlib.SimpleActionClient("servo_action", servoAction)
        self.servo_client.wait_for_server()
        self.servo_turnoff()
        
        # read the task
        self.target = []  #{"x":[], "y":[], "yaw":[]}      
        self.dock_target = [] #{"front":[], "back":[], "left":[], "right":[]}
        self.readfile(file)
        
        # task flag
        self.in_progress = False
        
        # communicate with PC on WIFI
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))  # get ip address   
        print(s.getsockname()[0])           
        self.server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.server.bind((s.getsockname()[0], 6688))
        self.server.listen(5)
        print(u'waiting for connect...')
        self.connect, (host, port) = self.server.accept()
        print(u'the client %s:%s has connected.' % (host, port))
        
           
    def readfile(self, file):
        with open(file, 'r') as f:
            for line in f:
                if "target" in line:
                    t = eval(line[8:])
                    self.target.append(t)
                if "dock" in line:
                    d = eval(line[6:])
                    self.dock_target.append(d) 
        print("target: ", self.target)
        print("dock: ", self.dock_target)
    
    def recvmsg(self):
        try:
            rec_data_len = self.connect.recv(4)
            rec_data_len1 = struct.unpack('i',rec_data_len)[0]
            data = self.connect.recv(rec_data_len1)
            if data == b'b' or data == b'B':
                self.in_progress = True
                print(b'The mission operation has begun.')
                #return True
            elif data == b'q' or data == b'Q':
                self.in_progress = False
                print(b'The mission operation has stopped.')
                #return False
        except:
            data = b''
            
    def turn(self, position, state):
        # positon 0~3, state:0/1
        if state == 1:
            s = True
        if state == 0:
            s = False
            
        # front, back, left, right -> front, left, back, right    
        if position == 1:
            i = 2
        elif position == 2: 
            i = 1
        else:
            i = position 
        print("The ",  position, "servo is turning ", state)
        
        if self.dock_servo_state[position] != s:
            servo_goal_obj = servoGoal()
            servo_goal_obj.index = i
            servo_goal_obj.state = s
            self.servo_client.send_goal(servo_goal_obj, self.done_cb, self.active_cb, self.fb_cb)
            self.dock_servo_state[position] = s
            rospy.loginfo('Servo %d: %d.', position, s)
    
    # action 
    def done_cb(self, state, result):
        if state == actionlib.GoalStatus.SUCCEEDED:
            rospy.loginfo("result : %d",result.finish)
            
    def active_cb(self):
        rospy.loginfo("servo is acting ...")

    def fb_cb(self, fb):
        rospy.loginfo("current process : %.2f",fb.complete_percentage)
    
    def dock_fb(self, dock):
        self.dock_servo_state[0] = int(dock.front)
        self.dock_servo_state[1] = int(dock.back)
        self.dock_servo_state[2] = int(dock.left)
        self.dock_servo_state[3] = int(dock.right)
        
        
        
    def servo_turnoff(self):
        self.turn(0, 0)
        self.turn(1, 0)
        self.turn(2, 0)
        self.turn(3, 0)
        
    def taskoperation(self):
        # len(self.target)
        # loop count
        i = 0
        # check socket
        self.recvmsg()
        start_time = rospy.get_time()
        r = rospy.Rate(10)
        while not rospy.is_shutdown():
            
            
            if self.in_progress:
                # get current target
                self.turn(0, self.dock_target[i][0])
                self.turn(1, self.dock_target[i][1])
                self.turn(2, self.dock_target[i][2])
                self.turn(3, self.dock_target[i][3])
                
                self.target_pub.publish(pid_target(self.target[i][0], self.target[i][1], self.target[i][2]))
                
                rospy.loginfo("point %d, time: %f", i, rospy.get_time() - start_time) 
                print("dock state: ", self.dock_servo_state) 
                print("dock target: ", self.dock_target[i]) 
                # if current postion close to target and dock state is right
                if rospy.get_time() - start_time > 5 and self.dock_servo_state == self.dock_target[i]:
                    i += 1
                    start_time = rospy.get_time()
                    print("next...")
                    
                if i >= len(self.target):
                    i -= 1
                    break
            r.sleep()
            
        rospy.loginfo("task is completed !")   
                
                # next loop
            #
            #r.sleep()


if __name__ == '__main__':
    file = "/home/corvin/catkin_ws/src/pid_control_pkg/src/task.txt"
    task = Task(file)
    task.taskoperation()
    #try:
    #    talker()
    #except rospy.ROSInterruptException:
    #    pass
