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
int oldState1,oldState2,oldState3,oldTime;
int INT_SW4 = 4;

int fun1(){
    int brojac = 0;
    if(digitalRead(PIN_SW1)){
        digitalWrite(PIN_LED1,HIGH);
        brojac++;
    }else{
        digitalWrite(PIN_LED1,LOW);
    }

    if(digitalRead(PIN_SW2)){
        digitalWrite(PIN_LED2,HIGH);
        brojac++;
    }else{
        digitalWrite(PIN_LED2,LOW);
    }

    if(digitalRead(PIN_SW3)){
        digitalWrite(PIN_LED3,HIGH);
        brojac++;
    }else{
        digitalWrite(PIN_LED3,LOW);
    }

    return brojac;
}

void task1(int id, void* tptr){
    int newState1 = digitalRead(PIN_BTN1);
    int newState2 = digitalRead(PIN_BTN2);
    if(oldState1 == 0 && newState1 == 1){
        x1 = fun1();
        Serial.print("task1: x1 = ");
        Serial.println(x1);
    }
    if(oldState2 == 0 && newState2 == 1){
        x2 = x1 * 2;
        Serial.print("task1: x2 = ");
        Serial.println(x2);
    }
    oldState1 = newState1;
    oldState2 = newState2;
}

void prekidac(){
    int zbir,i,ostatak;
    i = 0;
    zbir = x1 + x2;
    Serial.println(zbir);
    if(digitalRead(PIN_SW4)){
        //zbir = x1 + x2;
        while(zbir!=0){
            ostatak = zbir%2;
            if(ostatak == 1){
                digitalWrite(30 + i, HIGH);
            }else{
                digitalWrite(30 + i, LOW);
            }
            zbir = zbir/2;
            i++;
        }

        Serial.println("interrupt SW4");
    }
}

void task2(int id, void* tptr){
    int newState3 = digitalRead(PIN_BTN3);
    if(oldState3 == 1 && newState3 == 0){
        if(millis() - oldTime >= 2000){
            for(int i = 0; i<4;i++){
                digitalWrite(30 + i, LOW);
            }
            Serial.println("task2: brisanje interrupt-a sa prekidaca SW4");
        }
    }else if(oldState3 == 0 && newState3 == 1){
        oldTime = millis();
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
    attachInterrupt(INT_SW4,prekidac,RISING);
    x1 = 0;
    x2 = 0;
    oldState1 = 0;
    oldState2 = 0;
    createTask(task1,30,TASK_ENABLE,NULL);
    oldTime = millis();
    oldState3 = 0;
    createTask(task2,25,TASK_ENABLE,NULL);

}


void loop(){

}

