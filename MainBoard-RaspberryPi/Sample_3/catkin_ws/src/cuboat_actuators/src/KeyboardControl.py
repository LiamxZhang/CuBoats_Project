#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
@author: Lianxin

propeller topic publisher
servo action client

ip: 192.168.3.3
port: 80
"""

import rospy
import pygame
import sys
import time
import copy
import actionlib
from cuboat_actuators.msg import *

#
push_forward = 1300
push_back = 1700
stop = 0
halt = 1500
#
ON = 180
OFF = 0
class CuBoat():
    def __init__(self):
        rospy.init_node('keyboard_control', anonymous=True)
        # init propeller
        self.thruster_speed = [stop, stop, stop, stop]
        self.propeller_pulisher = rospy.Publisher('propeller_topic', propeller, queue_size=10)
        self.rate = rospy.Rate(100)
        
        # init servo
        self.dock_servo_state = [OFF, OFF, OFF, OFF]
        self.dock_servo_state_last = copy.deepcopy(self.dock_servo_state)
        self.servo_client = actionlib.SimpleActionClient("servo_action", servoAction)
        self.servo_client.wait_for_server()
        self.servo_turnoff()
        
    # action 
    # 当action完成后会调用次回调函数一次
    def done_cb(self, state, result):
        if state == actionlib.GoalStatus.SUCCEEDED:
            rospy.loginfo("响应结果:%d",result.finish)
            
    # 当action激活后会调用次回调函数一次
    def active_cb(self):
        rospy.loginfo("舵机被启动....")

    # 收到feedback后调用的回调函数
    def fb_cb(self, fb):
        rospy.loginfo("当前进度:%.2f",fb.complete_percentage)
    
    def servo_turnoff(self): #
        self.turn("front", "off")
        self.turn("back", "off")
        self.turn("left", "off")
        self.turn("right", "off")
    
    def turn(self, position, state):
        if position == "front":
            i = 0
        if position == "left":
            i = 1
        if position == "back":
            i = 2
        if position == "right":
            i = 3
        
        if state == "on":
            s = True
        if state == "off":
            s = False
        
        #print("The ",  position, "servo is turning ", state)dddddddelf.fb_cb)
            self.dock_servo_state_last = copy.deepcopy(self.dock_servo_state)
            rospy.loginfo('Servo %d: %d.', i, s)
        
    # movement    
    def propeller(self, pwm_front, pwm_back, pwm_left, pwm_right):
        rospy.loginfo('Propeller: %d, %d, %d, %d.', pwm_front, pwm_back, pwm_left, pwm_right)
        if not rospy.is_shutdown():
            self.propeller_pulisher.publish(propeller(pwm_front, pwm_back, pwm_left, pwm_right))
            self.rate.sleep()    
    
    def move(self, action):
        # action is a string
        if (action == "forward"):
            self.propeller(stop, stop, push_forward+60, push_back)
            print("Forward.")
        if (action == "backward"):
            self.propeller(stop, stop, push_back-10, push_forward+60)
            print("Backward.")
        if (action == "rightward"):
            self.propeller(push_back+15, push_forward+50, stop, stop)
            print("rightward.")
        if (action == "leftward"):
            self.propeller(push_forward+25, push_back+40, stop, stop)
            print("leftward.")
        if (action == "turnleft"):
            self.propeller(push_forward, push_forward, stop, stop)
            print("Turn left.")
        if (action == "turnright"):
            self.propeller(push_back, push_back, stop, stop)
            print("Turn right.")
        if (action == "halt"):
            self.propeller(halt,halt,halt,halt)
            print("Halt.")
        if (action == "stop"):
            self.propeller(stop,stop,stop,stop)
            print("Stop.")
        
    def stop(self):
        #print("System stops.")
        self.move("stop")
        self.servo_turnoff()

# init pygame
pygame.display.set_caption("PyGame")
pygame.display.set_mode((640, 480))
pygame.init()
#print("Init Pygame.")

# init CuBoat
cuboat = CuBoat()

# catch keyboard event
# dictionary for motion
long_press = {'W': False, 'S': False, 'A': False, 'D': False, 
              'J': False, 'L': False} 

# dictionary for dock servo
pressed = {'U': False, 'I': False, 'O': False, 'K': False,}

Flag = True
while Flag:
    for event in pygame.event.get():
        #print("event get")
        
        # press key
        if event.type == pygame.KEYDOWN:
            print("Key down, key: ", event.key)
            # quit
            if event.key == pygame.K_q:
                Flag = False
                cuboat.stop()
                pygame.quit()
                print("Quit manual control.")
                sys.exit()
                break
            
            if event.key == pygame.K_w:
                long_press['W'] = True
            if event.key == pygame.K_a:
                long_press['A'] = True
            if event.key == pygame.K_s:
                long_press['S'] = True
            if event.key == pygame.K_d:
                long_press['D'] = True
            if event.key == pygame.K_j:
                long_press['J'] = True
            if event.key == pygame.K_l:
                long_press['L'] = True
            
            if event.key == pygame.K_u:
                pressed['U'] = not pressed['U']
            if event.key == pygame.K_i:
                pressed['I'] = not pressed['I']
            if event.key == pygame.K_o:
                pressed['O'] = not pressed['O']
            if event.key == pygame.K_k:
                pressed['K'] = not pressed['K']

        # release key
        elif event.type == pygame.KEYUP:
            print("Key up, key: ", event.key)
            if event.key == pygame.K_w:
                long_press['W'] = False
            if event.key == pygame.K_a:
                long_press['A'] = False
            if event.key == pygame.K_s:
                long_press['S'] = False
            if event.key == pygame.K_d:
                long_press['D'] = False
            if event.key == pygame.K_j:
                long_press['J'] = False
            if event.key == pygame.K_l:
                long_press['L'] = False
                
    # handle the keyboard event
    if long_press['W'] == True: 
        cuboat.move("forward")
    if long_press["S"] == True:
        cuboat.move("backward")
    if long_press["A"] == True:
        cuboat.move("leftward")
    if long_press["D"] == True:
        cuboat.move("rightward")
    if long_press["J"] == True:
        cuboat.move("turnleft")
    if long_press["L"] == True:
        cuboat.move("turnright")
    
    if pressed["I"] == True:
        cuboat.turn("front", "on")
    elif pressed["I"] == False:
        cuboat.turn("front", "off")
    if pressed["K"] == True:
        cuboat.turn("back", "on")
    elif pressed["K"] == False:
        cuboat.turn("back", "off")
    if pressed["U"] == True:
        cuboat.turn("left", "on")
    elif pressed["U"] == False:
        cuboat.turn("left", "off")    
    if pressed["O"] == True:
        cuboat.turn("right", "on")
    elif pressed["O"] == False:
        cuboat.turn("right", "off")
    
    #
    if all(value == 0 for value in long_press.values()):
        cuboat.move("halt")
    
    #pygame.time.delay(10) # delay 10ms       

