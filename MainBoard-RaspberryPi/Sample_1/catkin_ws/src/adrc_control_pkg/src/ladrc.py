#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import numpy as np
from matplotlib import pyplot as plt
import math
import time
import rospy
from geometry_msgs.msg import PoseStamped
from cuboat_actuators.msg import propeller

# adjust PID to ceiling value
def int_norm(pid_output):
    if pid_output >= 0:
        return math.ceil(pid_output)
    if pid_output < 0:
        return math.floor(pid_output)

def pid_norm(pid_output):
    if pid_output > 2000:
        return 2000
    elif pid_output < 1000:
        return 1000
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

class ESO:
    def __init__(self, init_state = [0,0,0], e0 = 0.125):
        # init_state is a 3*1 vector, [x, x_dot, f(x)]
        self.x = np.transpose(np.array([init_state]))
        #self.x_hist = [self.x]
        #self.y_hist = []
        self.T = 0.01
        self.e0 = e0
        self.__setACE()
        
    def __setACE(self):
        # observer coefficient A 3*3
        self.A = np.zeros((3, 3))
        self.A[0:2, 1:]  = np.eye(2)
#        print("A", self.A)
        #
        # observer coefficient C 1*3
        self.C = np.array([[1, 0, 0]])
#        print("C", self.C)
        #
        # thruster force arm 3*4, corresponding to front back left right
        self.E = np.array([[0, 0, 1, -1],
                           [-1, 1, 0, 0],
                           [-self.e0, -self.e0, self.e0, self.e0]])
#        print("E", self.E)  
    
    def __updateCoeff(self):
        self.Coeff = []
        self.Coeff.append(np.eye(self.x.shape[0]) + self.T * (self.A - np.matmul(self.L, self.C))) # 3*3
        self.Coeff.append(self.T * self.B) # 3*4
        self.Coeff.append(self.T * self.L) # 3*1
#        print("x:", self.x.shape[0])
#        print(self.Coeff[0])
        
    def setB(self, Bx):
        # Bx is a 1*4 vector
        Zero = np.zeros((1, 4))
        self.B = np.vstack((Zero, Bx, Zero))
        self.__updateCoeff()
    
    def setCoefficient(self, omega0):
        # observer coefficient L 3*1
        l1 = 3*omega0
        l2 = 3*omega0**2
        l3 = omega0**3
        #
        self.L = np.transpose(np.array([[l1, l2, l3]]))
#        print(self.L)
    
    def update(self, control, feedback, Bx = None):
        #
        if Bx is not None:
            self.setB(Bx)
        #
#        print(self.Coeff[1].shape)
        self.x = self.Coeff[0] @ self.x + self.Coeff[1] @ control + self.Coeff[2] * feedback
        
        #self.x_hist.append(self.x)
        #self.y_hist.append(feedback)

    # show figures
    def showFigures(self):
        #print(self.state_history)
        plt.figure()
#        for i in self.x_hist:
#            print(i[0][0])
#            print("!\n")
        plt.plot([i[0][0] for i in self.x_hist], label='observer')
        plt.plot(self.y_hist, label='reference')
        plt.legend()
        plt.show() 
    
# PD controller, SISO
class PID:
    def __init__(self, omegaC = None, target = None):
        if omegaC is not None:
            self.pid_coeff = [omegaC, 2*omegaC, 0]
        self.target = target
        self.error_i = 0 # integral term
        self.error_last = 0 
        self.output = np.transpose(np.array([[0,0,0,0]]))
        
    def setCoefficient(self, omegaC):
        # omegaC eignvalue
        self.pid_coeff = [omegaC, 2*omegaC, 0]
#        print("PID coeff: ", self.pid_coeff)
        
    def setTarget(self, target):
        self.target = target
    
    def update(self, state, f_obs, Bx = None):
        #
        self.error =  self.target - state
        self.error_i += self.error
        self.error_d = self.error - self.error_last
        self.error_last = self.error
        
        u0 = self.pid_coeff[0] * self.error #+ self.pid_coeff[1] * self.error_i + self.pid_coeff[2] * self.error_d
        
        # 4*1
#        self.output = np.linalg.inv(np.transpose(Bx) @ Bx) @ np.transpose(Bx) * (u0 - f_obs)
        self.output = np.linalg.pinv(np.array([Bx])) * (u0 - f_obs)
        
        #print("PID output: ", self.output)
        #print(", ", self.output.shape)
        
        return self.output


# 1D ADRC controller0,0,100
class ADRC():
    def __init__(self, init_state = [0,0,0], omega0 = [10,10,1], omegaC = [100,100,100], m = [2.8, 2.8, 0.4], e0 = 0.125):
        self.state = init_state # x, y, psi
        self.eso = [ESO() for i in range(3)] # observer
        self.pid = [PID() for i in range(3)] # controller
        if m is not None:
            self.setMass(m)
        if e0 is not None:
            self.setSize(e0)
        
        self.setParameter(omega0, omegaC)
        
        for i in range(3):
            self.pid[i].setTarget(0)
        
        # calibration
        self.cali_file = "./src/adrc_control_pkg/src/Configuration/MotionCaptureCalibration.csv"
        if os.path.exists(self.cali_file):
            self.cali = np.loadtxt(self.cali_file, delimiter=",")
        else:
            self.cali = [0,0,0]
        
        # init node
        rospy.init_node('adrc_control_node', anonymous=True)
        
        # publish to propeller msg
        self.propeller_pulisher = rospy.Publisher('propeller_topic', propeller, queue_size=10)
        
        # listen to pid_target msg
        self.current_subscriber = rospy.Subscriber('vrpn_client_node/cuboat/pose', PoseStamped, self.feedback)
        #self.target_subscriber = rospy.Subscriber('adrc_target_topic', pid_target, self.control)
        #self.calibration()
        #
        
        #self.control([0,0,0])
        
        rospy.spin()
    
    def control(self, target):
        # set target
        for i in range(3):
            self.pid[i].setTarget(target[i])
        # 
        rate = rospy.Rate(40)
        while not rospy.is_shutdown():
            prop = self.update(self.state)
            rospy.loginfo("pwm: %f, %f, %f, %f.", prop[0], prop[1], prop[2], prop[3])
            self.propeller_pulisher.publish(propeller(prop[0], prop[1], prop[2], prop[3]))
            rate.sleep()
            
    def feedback(self, pose):    
        # pose.pose.position.x; pose.pose.orientation.x
        self.state[0] = pose.pose.position.x - self.cali[0]
        self.state[1] = pose.pose.position.z - self.cali[1]
        self.state[2] = self.quat2euler(pose.pose.orientation)
        rospy.loginfo("Pose: position: %f, %f. orientation: %f.", self.state[0], self.state[1], self.state[2])
        #self.control()    
        prop = self.update(self.state)
        rospy.loginfo("pwm: %f, %f, %f, %f.", prop[0], prop[1], prop[2], prop[3])
        self.propeller_pulisher.publish(propeller(prop[0], prop[1], prop[2], prop[3]))
    
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
    
        
    def setMass(self, m): 
        # mass matrix
        if len(m) == 3:
            self.Mass = np.diag(np.array(m))
            
    def setSize(self, e0):
        self.E = np.array([[0, 0, 1, -1],
                           [-1, 1, 0, 0],
                           [-e0, -e0, e0, e0]])
    
    def __updateB(self, position):
        # transformation matrix
        w = position[2]
        self.R = np.array([[math.cos(w), -math.sin(w), 0],
                            [math.sin(w), math.cos(w), 0],
                            [0, 0, 1]])
        
        # coefficient B of ESO
        self.B = self.R @ np.linalg.inv(self.Mass) @ self.E
        return self.B
    
    def setParameter(self, omega0, omegaC):
        # omega0 is a 1*3 vector of observer, omegaC is a 1*3 vector of controller
        for i in range(3):
            self.eso[i].setCoefficient(omega0[i])
            self.pid[i].setCoefficient(omegaC[i])
        
    
    def update(self, state):
        #  feedback state is x,y,psi
        self.__updateB(state)
#        self.output = np.transpose(np.array([[0,0,0,0]]))
        self.output = [0,0,0,0]

        for i in range(3):
            # observer
            self.eso[i].update(self.pid[i].output, state[i], self.B[i])
            self.pid[i].update(state[i], self.eso[i].x[i][0], self.B[i])
            for j in range(len(self.output)):
                self.output[j] += self.pid[i].output[j][0]
        for  j in range(len(self.output)):
            #print("1.pwm: ", self.output[j])
            self.output[j] += 1500
            self.output[j] = pid_norm(int_norm(self.output[j]))

        return self.output


if __name__ == "__main__":

    adrcController = ADRC()
    

    # robot
#    position = [0.0, 0.0, 0.0]
#    velocity = [0.0, 0.0, 0.0]
#    usv_plant = USVmodel(position, velocity)
#    usv_plant.setMass([39., 39., 5.635])
#    usv_plant.setDrag([25.43, 25.43, 3.86])
    
#    target = [20, 20, 0.0]
    
    #pidController = PID(0.5,0,0,state[0], target[0])
#    state = [0.0, 0.0, 0.0]
#    eso = ESO(state)
#    eso.setL(5)
#    eso.setB([1,1,1,1])
#    omega0 = [5,5,1]
#    omegaC = [10,10,20]
    
    
#    adrcController = ADRC(position, target, m = [39., 39., 5.635], e0 = 0.4435)
#    adrcController.setParameter(omega0, omegaC)
#    prop = [0,0,0,0]
    
#    usv_plant.setPropulsion(prop)
    
#    for i in range(1000):
#        usv_plant.setPropulsion(prop)
#        usv_plant.update()
#        print("pos:", usv_plant.position[0])
#        prop = adrcController.update(usv_plant.position)
        
#        eso.update(prop, usv_plant.position[0], B[0,:])
#        pidController.update(usv_plant.position[0])
#        prop = [0,pidController.output,0,pidController.output]
#        usv_plant.setPropulsion(prop)
#        usv_plant.update()
    
#    eso.showFigures()
#    usv_plant.showFigures()
    
