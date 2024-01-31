#include<arduinoPlatform.h>
#include<tasks.h>
#include<interrupts.h>
#include<stdio.h>
#include<serial.h>

struct Nesto{
    int pin_prekidaca;
    int oldState;
    //void fun1;
    //void fun2;
};

extern serial Serial;

int brojac;

#define dump(v) Serial.println(v)

#define PIN_LED1 26
#define PIN_LED2 27
#define PIN_LED3 28
#define PIN_LED4 29
#define PIN_SW1 2
#define PIN_SW2 7
#define PIN_SW3 8
#define PIN_SW4 35

void fun1(){
    brojac++;
}

void fun2(){
    Serial.println(brojac);
}

void prekidac(int id,void* tptr,struct Nesto nesto){
    int newState = digitalRead(nesto.pin_prekidaca);
    if(nesto.oldState == 0 && newState == 1){
        if(nesto.pin_prekidaca == PIN_SW1){
            fun1();
        }
    }else if(nesto.oldState == 1 && newState == 0){
        if(nesto.pin_prekidaca == PIN_SW2){
            fun2();
        }
    }
}


void setup(){

    brojac = 0;
    Nesto nesto,nesto2;
    nesto.oldState = 0;
    nesto.pin_prekidaca = PIN_SW1;
    nesto2 = createTask(prekidac,50,TASK_ENABLE,nesto);

    nesto.oldState = 1;
    nesto.pin_prekidaca = PIN_SW2;
    createTask(prekidac,50,TASK_ENABLE,NULL,nesto);
}


void loop(){



}

