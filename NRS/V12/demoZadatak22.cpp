#include<arduinoPlatform.h>
#include<tasks.h>
#include<interrupts.h>
#include<stdio.h>
#include<serial.h>

extern serial Serial;

 /*
  Blink Task 1 and 2
  Blink LED1 with a 500ms cycle (2Hz)
  Read SW1 and turn on/off LED2 in a 25ms cycle (40Hz)
  Utlizing the chipKIT task manager rather than delay functions.
  This example code is in the public domain.
  ZADATAK: Task3 pusta/stopira Task2 u skladu sa polozajem SW2 (pin 7)
 */

#define PIN_LED1 33
#define PIN_BTN4 37

int blink1_id, blink2_id;
unsigned long blink1_var;

unsigned short stat2 = TASK_DISABLE;
unsigned long period1, period2;

void blink_task1(int id, void * tptr)
{
  static int startTime = millis();
  static int period = 0;
  int BTN4 = digitalRead(PIN_BTN4);
  if (BTN4==HIGH) {
     digitalWrite(PIN_LED1, HIGH);
     period = millis()-startTime;
  } else {
     digitalWrite(PIN_LED1, LOW);
     if (period>2000){
        startTime = millis();
        period = 0;
        executeSoftReset(0);
     } else {
        startTime = millis();
        period = 0;
     }
  }
}

void setup()
{
   // initialize the digital pin as an output.
   pinMode(PIN_LED1, OUTPUT);

   //create blink tasks
   blink1_id = createTask(blink_task1, 50, TASK_ENABLE, &blink1_var);
}

void loop()
{

}

