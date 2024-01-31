#include<arduinoPlatform.h>
#include<tasks.h>
#include<interrupts.h>
#include<stdio.h>
#include<serial.h>
#include<pwm.h>

extern serial Serial;

int myPIN = 26;
int oldState, periodTime, startTime, elapsedTime;

#define numOfLastValues 10
int numOfValues;
int values[numOfLastValues];
int periodOscilovanjaStartTime;

void brojevi(int id, void* tptr){
    static int first = true;
    int newState = digitalRead(myPIN);
    if(oldState == 1 && newState == 0){
        elapsedTime = millis() - startTime;
    }else if(oldState == 0 && newState == 1){
        int time = millis();
        periodTime = time - startTime;
        startTime = time;
        if(!first){
            Serial.print(elapsedTime);
            Serial.print(' ');
            Serial.println(periodTime);
            values[numOfValues%numOfLastValues] = elapsedTime;
            if(numOfValues>=3){
            int prev1 = (numOfValues-1)%numOfLastValues;
            int prev2 = (numOfValues-2)%numOfLastValues;
            if((values[prev1] > values[prev2]) &&
               values[prev1] >= elapsedTime){
                Serial.print("Period oscilovanja je: ");
                Serial.println((int)(time - periodOscilovanjaStartTime));
                periodOscilovanjaStartTime = time;
               }
            }
            numOfValues++;
        }
        first = false;
    }
    oldState = newState;
}

void setup()
{
    Serial.begin(9600);
    pwmSin(myPIN,2000,0.0);
    oldState = digitalRead(myPIN);
    startTime = millis();
    elapsedTime = 0;
    periodTime = 0;
    numOfValues = 0;
    periodOscilovanjaStartTime = millis();
    createTask(brojevi,1,TASK_ENABLE,NULL);

}


void loop()
{

}

