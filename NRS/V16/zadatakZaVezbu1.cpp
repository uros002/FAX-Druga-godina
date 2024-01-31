#include<arduinoPlatform.h>
#include<tasks.h>
#include<interrupts.h>
#include<stdio.h>
#include<serial.h>



extern serial Serial;


#define PWM_BIT_TIME 6
#define PWM_PERIOD (PWM_BIT_TIME * 1024)

#define dump(v) Serial.println(v)

#define PIN_LED1 26
#define PIN_LED2 27
#define PIN_LED3 28
#define PIN_LED4 29
#define PIN_LED5 30
#define PIN_LED6 31
#define PIN_LED7 32
#define PIN_LED8 33
#define PIN_SW1 2
#define PIN_SW2 7
#define PIN_SW3 8
#define PIN_SW4 35


void kopiranje(int id, void*tptr) {
   if (Serial.available())
     Serial.println(Serial.readString());
}

void setup(){
  Serial.begin(9600);
  createTask(kopiranje, 50, TASK_ENABLE, NULL);
}


void loop(){

}

