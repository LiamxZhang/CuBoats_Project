#!/usr/bin/env python
# -*- coding: utf-8 -*-

from matplotlib import pyplot as plt

def drawState(file):
    state = {"x":[], "y":[], "yaw":[],}
    t_lst = []
    
    with open(file, 'r') as f:
        for line in f:
            if "Time" in line:
                t = eval(line[6:])
                t_lst.append(t)
            if "State" in line:
                s = eval(line[7:])
                state["x"].append(s[0])
                state["y"].append(s[1])
                state["yaw"].append(s[2])
    plt.figure()
    plt.plot(t_lst, state["x"])
    plt.title("x")
    plt.figure()
    plt.plot(t_lst, state["y"])
    plt.title("y")
    plt.figure()
    plt.plot(t_lst, state["yaw"])
    plt.title("yaw")
    
if __name__ == "__main__":
    file = "/home/corvin/catkin_ws/src/logging_pkg/src/yaw461/data_1656329029.2845633.txt"
    #data_1656328736.9612017
    #file = "/home/corvin/catkin_ws/src/logging_pkg/src/yaw462/data_1656328736.9612017.txt"
    drawState(file)
    plt.show()
