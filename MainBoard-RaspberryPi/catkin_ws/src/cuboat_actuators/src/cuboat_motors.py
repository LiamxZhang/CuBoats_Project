#!/usr/bin/env python
#coding=utf-8

import time
import re
import serial
import rospy
import actionlib
from cuboat_actuators.msg import *

stop = 0

#
ON = 180
OFF = 0

class CuBoat():
    def __init__(self):
        # intial state
        self.thruster_speed = [stop, stop, stop, stop]
        self.dock_servo_state = [OFF, OFF, OFF, OFF] 
        
        # open serial
        try:
            self.ser = serial.Serial('/dev/ttyUSB0', 115200, timeout=0.5) # 4 propellers
        except:
            port_list_name = [comport.device for comport in ports.comports()]
            print("Cannot open this ports! Please use other ports: ")
            print(port_list_name)
        
        # init node
        rospy.init_node('cuboat_actuator', anonymous=True)
        
        # topic listener
        self.sub = rospy.Subscriber('propeller_topic', propeller, self.propeller_cb)
        
        # action client 
        self.server = actionlib.SimpleActionServer("servo_action", servoAction, self.servo_cb, False)
        self.server.start()
        rospy.loginfo("服务端启动")
        
        #
        rospy.spin()
    
    # propeller callback
    def propeller_cb(self, propeller):
        rospy.loginfo('Propeller listener: %d, %d, %d, %d.', propeller.front, propeller.back, propeller.left, propeller.right)     
        self.thruster_speed = [propeller.front, propeller.left, propeller.back, propeller.right]
        
        self.ser.write(bytes.fromhex(bytes([255, propeller.front//100, propeller.front%100, \
        propeller.left//100, propeller.left%100, \
        propeller.back//100, propeller.back%100, \
        propeller.right//100, propeller.right%100, 250]).hex())) # head: 255 0xff, tail: 250 0xfa        
        
    # servo action 
    def servo_cb(self,goal):
        #1.
        num = goal.index
        state = goal.state
        #2.
        rate = rospy.Rate(10)
        self.dock_servo_state[num] = state
        self.ser.write(bytes.fromhex(bytes([254, self.dock_servo_state[0], 0, self.dock_servo_state[1], 0, 
        self.dock_servo_state[2], 0, self.dock_servo_state[3], 0, 250]).hex())) # head: 254 0xff, tail: 250 0xfa
        
        rospy.loginfo("服务端处理请求: %d, %d", num, state)
        # 计算进度并连续反馈
        feedBack = 100
        #rospy.loginfo("当前进度:%.2f",feedBack)

        feedBack_obj = servoFeedback()
        feedBack_obj.complete_percentage = feedBack
        self.server.publish_feedback(feedBack_obj)
        rate.sleep()
        #3.响应最终结果
        result = servoResult()
        result.finish = True       
        self.server.set_succeeded(result)
        rospy.loginfo("响应结果:%d",True)
        
# Test script
if __name__ == "__main__":
    #
    USV = CuBoat()
    
    #USV.inquiry_servo(1)
    #USV.inquiry_all_servo()
    
    #USV.forward()

    #USV.forward()
    #for i in range(20):
    #    print(USV.ser1.readline())
    #USV.forward()
    #time.sleep(5)

    
    
