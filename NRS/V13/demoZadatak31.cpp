#include<arduinoPlatform.h>
#include<tasks.h>
#include<interrupts.h>
#include<stdio.h>
#include<serial.h>

extern serial Serial;
int oldState1, oldState2, blink1_id;
int PIN_SW1 = 2;
int PIN_SW2 = 7;
int PIN_LED1 = 26;


void blink_task1(int id, void * tptr)
{
  digitalWrite(PIN_LED1, !digitalRead(PIN_LED1));   // Toggle pin state
}

void prekidac1(int id, void * tptr)
{
    int newState = digitalRead(PIN_SW1);
	if (oldState1 == 1  && newState == 0) {
        setTaskState(blink1_id, TASK_DISABLE);
	} else if (oldState1 == 0 && newState ==1) {
        setTaskState(blink1_id, TASK_ENABLE);
	}
	oldState1 = newState;
}

void prekidac2(int id, void * tptr)
{
    int newState = digitalRead(PIN_SW2);
	if (oldState2 == 1  && newState == 0) {
        setTaskPeriod(blink1_id, 100);
	} else if (oldState2 == 0 && newState ==1) {
        setTaskPeriod(blink1_id, 1000);
	}
	oldState2 = newState;
}

void setup()
{
    oldState1 = digitalRead(PIN_SW1);
    oldState2 = digitalRead(PIN_SW2);
    if (oldState1==1)
        blink1_id = createTask(blink_task1, 100, TASK_ENABLE, NULL);
    else
        blink1_id = createTask(blink_task1, 100, TASK_DISABLE, NULL);
    createTask(prekidac1, 50, TASK_ENABLE, NULL);
    createTask(prekidac2, 50, TASK_ENABLE, NULL);
}

void loop()
{

}

