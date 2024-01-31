#include<arduinoPlatform.h>
#include<tasks.h>
#include<interrupts.h>
#include<stdio.h>
#include<serial.h>

extern serial Serial;
int oldState, oldTime, brojac;
int PIN_BTN1 = 4;


void dugme1(int id, void * tptr)
{
    int newState = digitalRead(PIN_BTN1);
	if (oldState == 1  && newState == 0) {
        if (millis()-oldTime>=2000) {
            brojac++;
            Serial.println(brojac);
		}
	} else if (oldState == 0 && newState ==1) {
        oldTime = millis();
	}
	oldState = newState;
}

void setup()
{
    Serial.begin(9600);
    oldState = digitalRead(PIN_BTN1);
    oldTime = millis();
    brojac = 0;
    createTask(dugme1, 50, TASK_ENABLE, NULL);
}

void loop()
{

}

