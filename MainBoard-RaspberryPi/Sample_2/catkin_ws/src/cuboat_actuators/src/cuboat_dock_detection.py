#!/usr/bin/env python
#coding=utf-8

import serial
import rospy
from cuboat_actuators.msg import dock

class CuBoat_Dock_Detector:
    def __init__(self):
        # open serial
        try:
            self.detector_ser = serial.Serial('/dev/ttyUSB1', 115200, timeout=0.5) #
        except:
            port_list_name = [comport.device for comport in ports.comports()]
            print("Cannot open this ports! Please use other ports: ", port_list_name)
        
        # init publisher    
        self.dock_servo_state = [False, False, False, False] 
        self.dock_detector = rospy.Publisher('dock_detector_topic', dock, queue_size=10)
        rospy.init_node('pytalker', anonymous=True)
        self.rate = rospy.Rate(10)
        
        
    def publish(self):
        while not rospy.is_shutdown():
            # receive the dock state and decode the state
            try:
                self.detector_ser.flushInput()
                ser_info = self.detector_ser.readline().decode('UTF-8')
            except:
                #print("error read!")
                continue
            #print("Serial info: ", ser_info)
            # 总长度为5,最后一位为换行符，且前四位为0或者1
            if len(ser_info) == 5 and ser_info[-1]=="\n" :
                for j in range(len(ser_info)-1):
                    #print(bool(int(ser_info[j])))
                    self.dock_servo_state[j] = not bool(int(ser_info[j]))
            # publish
            rospy.loginfo('Magnetic dock: %d, %d, %d, %d.', self.dock_servo_state[0], self.dock_servo_state[2], self.dock_servo_state[3], self.dock_servo_state[1])
            self.dock_detector.publish(dock(self.dock_servo_state[0], self.dock_servo_state[2], self.dock_servo_state[3], self.dock_servo_state[1]))
            self.rate.sleep()
    
if __name__ == '__main__':
    docker = CuBoat_Dock_Detector()
    docker.publish()
    
    
    
