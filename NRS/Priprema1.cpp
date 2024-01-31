#include<arduinoPlatform.h>
#include<tasks.h>
#include<interrupts.h>
#include<stdio.h>
#include<serial.h>
#include<math.h>
#include<string>
#include<iostream>

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
#define PIN_BTN1 4
#define PIN_BTN2 34
#define PIN_BTN3 36
#define analogInPin A0

int x1,x2;
int oldState1,oldState2;
int oldState3,oldTime;
int INT_SW1 = 1;
int INT_SW2 = 2;
int INT_SW3 = 3;
int INT_SW4 = 4;

void interruptOff1();
void interruptOff2();
void interruptOff3();
void interruptOff4();

void interruptOn1(){
    digitalWrite(PIN_LED1,HIGH);
    detachInterrupt(INT_SW1);
    attachInterrupt(INT_SW1,interruptOff1,RISING);
}

void interruptOff1(){
    digitalWrite(PIN_LED1,LOW);
    detachInterrupt(INT_SW1);
    attachInterrupt(INT_SW1,interruptOn1,FALLING);
}

void interruptOn2(){
    digitalWrite(PIN_LED2,HIGH);
    detachInterrupt(INT_SW2);
    attachInterrupt(INT_SW2,interruptOff2,RISING);
}

void interruptOff2(){
    digitalWrite(PIN_LED2,LOW);
    detachInterrupt(INT_SW2);
    attachInterrupt(INT_SW2,interruptOn2,FALLING);
}

void interruptOn3(){
    digitalWrite(PIN_LED3,HIGH);
    detachInterrupt(INT_SW3);
    attachInterrupt(INT_SW3,interruptOff3,RISING);
}

void interruptOff3(){
    digitalWrite(PIN_LED3,LOW);
    detachInterrupt(INT_SW3);
    attachInterrupt(INT_SW3,interruptOn3,FALLING);
}

void interruptOn4(){
    digitalWrite(PIN_LED4,HIGH);
    detachInterrupt(INT_SW4);
    attachInterrupt(INT_SW4,interruptOff4,RISING);
}

void interruptOff4(){
    digitalWrite(PIN_LED4,LOW);
    detachInterrupt(INT_SW4);
    attachInterrupt(INT_SW4,interruptOn4,FALLING);
}


int fun1(){
    int broj = 0;
    if(digitalRead(PIN_SW1)){
        broj++;
    }
    if(digitalRead(PIN_SW2)){
        broj = broj + 2;
    }
    if(digitalRead(PIN_SW3)){
        broj = broj + 4;
    }
    if(digitalRead(PIN_SW4)){
        broj = broj + 8;
    }
    return broj;
}

void task1(int id, void* tptr){
    int newState1 = digitalRead(PIN_BTN1);
    int newState2 = digitalRead(PIN_BTN2);
    if(oldState1 == 0 && newState1 == 1){
        x1 = fun1();
        Serial.print("task1:  x1= ");
        Serial.print(x1);
        Serial.print("  x2= ");
        Serial.println(x2);
    }else if(oldState2 == 0 && newState2 == 1){
        x2 = fun1();
        Serial.print("task1:  x1= ");
        Serial.print(x1);
        Serial.print("  x2= ");
        Serial.println(x2);
    }

    //Serial.print("task1:  x1= ");
    //Serial.print(x1);
    //Serial.print("  x2= ");
    //Serial.println(x2);
}


void task2(int id, void* tptr){
    int proizvod;
    int newState3 = digitalRead(PIN_BTN3);
    if(oldState3 == 0 && newState3 == 1){
        oldTime = millis();
    }else if(oldState3 == 1 && newState3 == 0){
        if(millis() - oldTime >= 2000){
            proizvod = x1*x2;
            Serial.println(proizvod);
        }
    }
    oldState3 = newState3;
}


void setup(){

    for(int i = 26; i<=33;i++){
        pinMode(i,OUTPUT);
        digitalWrite(i,LOW);
    }
    Serial.begin(9600);
    Serial.println("Uros Grahovac PR100/2021 grupa 6");
    if(digitalRead(PIN_SW1))
        attachInterrupt(INT_SW1,interruptOn1,FALLING);
    else
        attachInterrupt(INT_SW1,interruptOff1,RISING);

    if(digitalRead(PIN_SW2))
        attachInterrupt(INT_SW2,interruptOn2,FALLING);
    else
        attachInterrupt(INT_SW2,interruptOff2,RISING);

    if(digitalRead(PIN_SW3))
        attachInterrupt(INT_SW3,interruptOn3,FALLING);
    else
        attachInterrupt(INT_SW3,interruptOff3,RISING);

    if(digitalRead(PIN_SW4))
        attachInterrupt(INT_SW4,interruptOn4,FALLING);
    else
        attachInterrupt(INT_SW4,interruptOff4,RISING);

    x1 = 0;
    x2 = 0;
    oldState1 = 0;
    oldState2 = 0;
    createTask(task1,25,TASK_ENABLE,NULL);
    oldState3 = 0;
    oldTime = millis();
    createTask(task2,25,TASK_ENABLE,NULL);



}


void loop(){

}

