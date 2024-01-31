#include<arduinoPlatform.h>
#include<tasks.h>
#include<interrupts.h>
#include<stdio.h>
#include<serial.h>

extern serial Serial;

void kopiranje(int id, void*tptr) {
   if (Serial.available())
     Serial.write(Serial.read());
}

void setup()
{
  Serial.begin(9600);
  createTask(kopiranje, 50, TASK_ENABLE, NULL);
}

void loop()
{

}
