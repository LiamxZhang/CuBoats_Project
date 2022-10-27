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
int proplPin[4] = {2,3,4,5};
int servoPin[4] = {6,7,8,9};
int detecPin[4] = {10,11,12,13};

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
  }
}

void StartPropeller() {
  //Serial.println("start propellers at:");
  for (int pos = 0; pos <= 180; pos += 10) { // goes from 0 degrees to 180 degrees
    // in steps of 1 degree
    for (int i = 0; i < 4; i++)
      propeller[i].write(pos);              // tell servo to go to position in variable 'pos'
    //Serial.println(pos);
    delay(300);                       // waits 10ms for the servo to reach the position
  }
  if (debug) Serial.println("Propellers are started!");
}

char buffer[6];
bool ser_flag;
bool SerialRead() {
  // read the serial port, Serial is comport, command length is 6 
  Serial.readBytes(buffer,6);
  // 
  // whether command is right. -1: propeller, -2: servo
  if ((buffer[0] == -1 || buffer[0] == -2 ) && buffer[5] == -6) 
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
    for(int i=0; i<6; i++)
      {
        Serial.print(int(buffer[i]));
        Serial.print(", ");
      }
    Serial.print("\n");
  }
  return ser_flag;
}

int prop_pwm[4] = {0,0,0,0};
int prop_pwm_bound[2] = {40, 140};
void PropellerRun() {
  // propeller motor
  if (debug) Serial.print("PropellerRun: ");
  for (int i = 0; i < 4; i++) {
    if (debug) Serial.print(prop_pwm[i]);
    int pwm = int(buffer[i+1]) + prop_pwm_bound[0];
    // check if the same as last time
    if(pwm != prop_pwm[i] && pwm >= prop_pwm_bound[0] && pwm <= prop_pwm_bound[1]) {
      prop_pwm[i] = pwm;
      propeller[i].write(prop_pwm[i]);
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
    dockservo[i].write(int(buffer[i+1]));
    if (debug) Serial.print(int(buffer[i+1]));
    if (debug) Serial.print(", ");
  }
  if (debug) Serial.print("\n");
}

// Main
void setup() {
  // communication port
  Serial.begin(115200);
  Serial1.begin(115200); 
  
  while (!Serial || !Serial1) {}
  if (debug) Serial.println("Communication port is ready!");
  
  InitServo();
  if (debug) Serial.println("servo control is ready!");
  
  StartPropeller();
  if (debug) Serial.println("propeller control is ready!");
}

void loop() {
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
  
  // feedback the docking detection
  for (int i = 0; i < 4; i++) {
    Serial1.print(digitalRead(detecPin[i]));
  }
  Serial1.println("\n");
}
