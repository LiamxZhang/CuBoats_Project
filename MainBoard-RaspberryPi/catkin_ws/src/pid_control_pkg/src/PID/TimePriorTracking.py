# -*- coding: utf-8 -*-
"""

@author: CUHKSZ

ip: 192.168.3.10
port: 80
"""

# Receive robot state

import re
import threading
import socket 
import time
# PID
import sys
import math
from OASES import OASES
from PID import PID

# 
server_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
server_socket.setsockopt(socket.SOL_SOCKET,socket.SO_REUSEADDR,1) 
server_socket.bind(("192.168.3.245", 8000)) 
server_socket.settimeout(10) 

State = [0,0,0]
def data_threading():
    global State
    while True:
      try:  
          now = time.time() 
          receive_data, client = server_socket.recvfrom(1024)
          receive_data = receive_data.decode()
          #print(time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(now))) #以指定格式显示时间
          #print("来自客户端%s,发送的%s\n" % (client, receive_data))  #打印接收的内容
          State = [float(s) for s in re.findall(r'[-+]?\d+\.?\d*', receive_data)]   
      except socket.timeout:  #如果10秒钟没有接收数据进行提示（打印 "time out"）
          print('time out')



# limit the angle to -180~180
def angle_norm(old_angle): 
    if old_angle > math.pi:
        return old_angle - 2 * math.pi
    elif old_angle <= -math.pi:
        return old_angle + 2 * math.pi
    else:
        return old_angle

# adjust PID to ceiling value
def int_norm(pid_output):
    if pid_output >= 0:
        norm_output = math.ceil(pid_output)
    if pid_output < 0:
        norm_output = math.floor(pid_output)
    return norm_output



# define the trajectory function
def circle(t):
    radius = 1.2 # circle
    A = 0.1# trajectory velocity coefficient
    x_t = radius * math.cos(A * t)
    y_t = radius * math.sin(A * t)
    yaw_t = 0 #

    return x_t,y_t,yaw_t


def PID_norm(pid_value):
    #r = [80, 87, 93, 100]
#     r = [45, 89, 91, 135]
#    r = [50, 89, 91, 130]
    r = [60, 89, 91, 120]
    norm_output = pid_value
    if pid_value < r[0]:
        norm_output = r[0]
    if pid_value > r[1] and pid_value < 90:
        norm_output = r[1]
    if pid_value > 90 and pid_value < r[2]:
        norm_output = r[2]
    if pid_value > r[3]:
        norm_output = r[3]
    return norm_output

# control thread
def reach_point(target_pos, pid_fb, pid_sd):
    # create the boat
    USV = OASES()
    print("Init OASES USV.")
    pid_orient = [12,0,2]
    PID_orient_smlangle = PID(pid_orient[0],pid_orient[1],pid_orient[2]) # adjust the orientation 20, 0, 0.5
    PID_orient_midangle = PID(pid_orient[0],pid_orient[1],pid_orient[2])  # 7,0,0.5
    PID_orient_bigangle = PID(pid_orient[0],pid_orient[1],pid_orient[2])
    
    PID_forback = PID(pid_fb[0],pid_fb[1],pid_fb[2]) # adjust the forward / backward position
    PID_side = PID(pid_sd[0],pid_sd[1],pid_sd[2]) # adjust the sideward position
    print("Init PID.")
    
    sml_angle = 10 * math.pi/180
    big_angle = 90 * math.pi/180
    
    # target point # x, y, attitude : -180~180
    x_t = target_pos[0]
    y_t = target_pos[1]
    yaw_t = target_pos[2] * math.pi/180 # 
    
    # PID setpoint
    PID_orient_smlangle.setGoal(0)
    PID_orient_midangle.setGoal(0)
    PID_orient_bigangle.setGoal(0) 
    PID_forback.setGoal(0)
    PID_side.setGoal(0)
    
    global State
    
    reach = False
    while not reach:
    #while True:
        # measurement
        print('State: ', State[0], State[1], State[2]*180/math.pi)
        x = State[0]
        y = State[1]
        yaw = State[2] 
        
        # heading feed back
        angle_error = angle_norm(yaw - yaw_t) # >0 on the left
        PID_orient_smlangle.update(angle_error) 
        PID_orient_midangle.update(angle_error)
        PID_orient_bigangle.update(angle_error)
        
        # forward, backward feedback
        distance = math.sqrt(math.pow(x - x_t, 2) + math.pow(y - y_t, 2)) # from current to target
        print('distance: ', distance)
        if distance < 0.3 and abs(angle_error) < 90: # < 5cm and < 5 degree
            reach = True
            break
        
        azimuth = math.atan2(y - y_t, x - x_t) # position angle -180~180
        inter_angle = angle_norm(math.pi + yaw - azimuth)
                
        PID_forback.update(distance * math.cos(inter_angle)) # >0 forward
        
        # sideward feedback
        PID_side.update(distance * math.sin(inter_angle)) # >0 rightward
                
        # execute
        if angle_error > -sml_angle and angle_error < sml_angle:
            control_orient = int_norm(PID_orient_smlangle.output)
        elif angle_error < -big_angle or angle_error > big_angle:
            control_orient = int_norm(PID_orient_bigangle.output)
        else:
            control_orient = int_norm(PID_orient_midangle.output)
        #print('rotate: ', control_orient)
        
        
        control_fb = int_norm(PID_forback.output)
        #print('forward/backward: ', control_fb)
        control_side = int_norm(PID_side.output)
        #print('sideward: ', control_side)
        
        pwm_front = PID_norm(90 - control_side - control_orient)
        pwm_back = PID_norm(90 - control_side + control_orient)
        pwm_left = PID_norm(90 + control_fb) #+ control_orient
        pwm_right = PID_norm(90 + control_fb) #- control_orient
        
        print("command:  ", pwm_back, pwm_right, pwm_front , pwm_left)
        USV.propeller(pwm_back, pwm_right, pwm_front , pwm_left)


def control_threading(pid_fb, pid_sd, pid_orient):
    # create the boat
    USV = OASES()
    print("Init OASES USV.")
    
    PID_orient = PID(pid_orient[0],pid_orient[1],pid_orient[2]) # adjust the orientation
    PID_forback = PID(pid_fb[0],pid_fb[1],pid_fb[2]) # adjust the forward / backward position
    PID_side = PID(pid_sd[0],pid_sd[1],pid_sd[2]) # adjust the sideward position
    print("Init PID.")
    
    start_time = time.time()
    
    # PID setpoint
    PID_orient.setGoal(0) 
    PID_forback.setGoal(0)
    PID_side.setGoal(0)
    
#     filename = "data_circle" + str(pid_fb) + str(pid_sd) + str(pid_orient) + ".txt"
    filename = "data_circle" + str(time.time()) + ".txt"
    
    fp=open(filename,"w",encoding="utf-8")
    while True:
        # measurement
        #print('\nState: ', State[0], State[1], State[2]*180/math.pi)
        x = State[0]
        y = State[1]
        yaw = State[2] 
        
        # set target point
        x_t, y_t, yaw_t = circle(time.time() - start_time)
        #print('Circle: (', x_t, ', ', y_t, ')')
        
        # heading feed back
        PID_orient.update(angle_norm(yaw - yaw_t)) # >0 on the left
        
        # forward, backward feedback
        distance = math.sqrt(math.pow(x - x_t, 2) + math.pow(y - y_t, 2)) # from current to target
        radius = math.sqrt(math.pow(x - 0, 2) + math.pow(y - 0, 2))
        print('distance:  ', distance, 'radius: ', radius)
        azimuth = math.atan2(y - y_t, x - x_t) # position angle -180~180
        inter_angle = angle_norm(math.pi + yaw - azimuth)
        #print('inter angle:  ', inter_angle)
        
        PID_forback.update(distance * math.cos(inter_angle)) # >0 forward
        
        # sideward feedback
        PID_side.update(distance * math.sin(inter_angle)) # >0 rightward
        #print('Boat yaw: ', yaw, '   target angle: ', yaw_t)    
        
        # execute
        control_orient = int_norm(PID_orient.output)
        #print('rotate: ', control_orient)
        control_fb = int_norm(PID_forback.output)
        #print('forward/backward: ', control_fb)
        control_side = int_norm(PID_side.output)
        #print('sideward: ', control_side)
        
        pwm_front = PID_norm(90 - control_side - control_orient)
        pwm_back = PID_norm(90 - control_side + control_orient)
        pwm_left = PID_norm(90 + control_fb) #+ control_orient
        pwm_right = PID_norm(90 + control_fb) #- control_orient
                
        fp.write("Time: " + str(time.time() - start_time) +
                 "\nState: " + str(State) + "\nControl: "
             + str([pwm_back, pwm_right, pwm_front , pwm_left]) + '\n\n')
        
        #print("command:  ", pwm_back, pwm_right, pwm_front , pwm_left)
        
        USV.propeller(pwm_back, pwm_right, pwm_front , pwm_left)

def navigation_threading():
    # preparetion position
    Pf = 18
    If = 0
    Df = 4
    
    Ps = 12
    Is = 0
    Ds = 4
    
    pid_fb = [Pf,If,Df]
    pid_sd = [Ps,Is,Ds]
    
    #
    target_pos = [1.8, 1.8, 0]
    reach_point(target_pos, pid_fb, pid_sd)
    print('Reach preparetion point.')
    
    #
#     Pf = 349
#     If = 1.4
#     Df = 0.9
#     
#     Ps = 349
#     Is = 1.5
#     Ds = 1
#     
#     Po = 67
#     Io = 1.6
#     Do = 1.1
    
    Pf = 433
    If = 1.4
    Df = 0.9
    
    Ps = 349
    Is = 1.6
    Ds = 1.1
    
    Po = 107
    Io = 1.5
    Do = 1
    
    
    pid_fb = [Pf,If,Df]
    pid_sd = [Ps,Is,Ds]
    pid_orient = [Po,Io,Do]
    control_threading(pid_fb, pid_sd, pid_orient)

if __name__=='__main__':
    #
    dataThread = threading.Thread(target = data_threading)
    dataThread.setDaemon(True)
    dataThread.start()
    #
    navThread = threading.Thread(target = navigation_threading)
    navThread.setDaemon(True)
    navThread.start()
