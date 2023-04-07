/*
 * This controller is for the 4 servo and the 4 propeller.
 * 
 * Author： By Lianxin
 * 
 * communication port： Serial0
 * 
 * docking detection feedback: Serial1
 * 
 * Propeller: D10,D4,D6,D8
 * PWM: 0-180
 */

#include <Servo.h>

// debug
bool debug = false;

// ports
Servo propeller[4];
Servo dockservo[4];

// pin
int proplPin[4] = {6,7,8,9};
int servoPin[4] = {10,11,12,13};
int detecPin[4] = {2,3,4,5};

// functions
void InitServo(){
  for (int i = 0; i < 4; i++) {
    // detection
    pinMode(detecPin[i], INPUT);
    
    // Docking servo
    dockservo[i].attach(servoPin[i]);
    dockservo[i].write(0); // turn off all docking servos
    
    // Propeller
    propeller[i].attach(proplPin[i]);
    propeller[i].write(90);
  }
}

char buffer[10];
bool ser_flag;
bool SerialRead() {
  // read the serial port, Serial is comport, command length is 10
  Serial.readBytes(buffer,10);
  // whether command is right. -1: propeller, -2: servo
  if ((buffer[0] == -1 || buffer[0] == -2 ) && buffer[9] == -6) 
  {
    if (debug) Serial.print("Serial read command:  ");
    ser_flag = true;
  }
  else
  {
    if (debug) Serial.print("Error:  ");
    ser_flag = false;
  }
  //
  if (debug) {
    for(int i=0; i<10; i++)
      {
        Serial.print(int(buffer[i]));
        Serial.print(", ");
      }
    Serial.print("\n");
  }
  return ser_flag;
}

int prop_pwm[4] = {0,0,0,0};
int prop_pwm_bound[2] = {1000, 2000};
void PropellerRun() {
  // propeller motor
  if (debug) Serial.print("PropellerRun: ");
  for (int i = 0; i < 4; i++) {
    if (debug) Serial.print(prop_pwm[i]);
    int pwm = int(buffer[2*i+1])*100 + int(buffer[2*i+2]);
    // check if the same as last time
    if((pwm >= prop_pwm_bound[0] && pwm <= prop_pwm_bound[1]) || pwm == 0) {
      prop_pwm[i] = pwm;
      propeller[i].writeMicroseconds(prop_pwm[i]);
      if (debug) Serial.print(" -> ");
      if (debug) Serial.print(prop_pwm[i]);
    }
    if (debug) Serial.print(", ");
  }
  if (debug) Serial.print("\n");
}

void ServoRun() {  
  //
  if (debug) Serial.print("ServoRun: ");
  for (int i = 0; i < 4; i++) {
    if (int(buffer[2*i+1]==0))
      dockservo[i].write(0);

    if (int(buffer[2*i+1]==1))
      dockservo[i].write(180);
      
    if (debug) Serial.print(buffer[2*i+1]);
    if (debug) Serial.print(", ");
  }
  if (debug) Serial.print("\n");
}

int dock[4] = {0,0,0,0};
void DockDetection(){
  // feedback the docking detection
  for(int i =0; i < 4; i++){
    //Serial1.print(digitalRead(detecPin[i]));
    dock[i] = digitalRead(detecPin[i]);
    if (debug) {
      Serial.println("pin "+ String(i) + ": " + String(dock[i]));
      if (dock[i] == 0){
        Serial.print(i);
        Serial.print("connected");
        }
      if (dock[i] == 1){
        Serial.print(i);
        Serial.print("unconnected");
        }
      Serial.print("\n");
    }
  }
  delay(10);
  Serial1.print(String(dock[0])+String(dock[1])+String(dock[2])+String(dock[3])+"\n");
}

// Main
void setup() {
  // communication port
  Serial.begin(115200);
  Serial1.begin(115200);
  
  while (!Serial || !Serial1) {}
  if (debug) Serial.println("Communication port is ready!");
  
  InitServo();
  if (debug) Serial.println("Motors are ready!");
}

void loop() {
  DockDetection();
  if(Serial.available()) {
    //
    if(SerialRead())
    { 
      if(buffer[0] == -1) { // propeller motor
        PropellerRun();
      }
      else if(buffer[0] == -2) { // servo motor
        ServoRun();
      }
    }
    else {
      if (debug) Serial.print("Handle serial error!");
      // clear the read buffer
      while(buffer[0] != -6)
      {
        Serial.readBytes(buffer,1);
        if (debug) Serial.print(buffer[0]);
      }
      if (debug) Serial.print("\n");
    }
  }  
}
