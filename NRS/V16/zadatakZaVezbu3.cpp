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



void zbir(int id, void*tptr) {
    int broj = 0;
    int stepen = 0;
    int stepen2 = 0;
    int signal = 0;
    if(Serial.available()){
       char s[10] = Serial.readString();
        for(int i = 0; i<5;i++){
            while(s[i]!=' '){
                stepen++;
            }
        }

        for(int i = 0; i<5;i++){
            broj += s[i] - '0' * 10^stepen;
            stepen--;
        }

        for(int i = 0; i<5; i++){
            if(s[i] == ' '){
                signal++;
            }
            if(s[i] >= '0' && s[i]<='9' && signal == 1){
                stepen2++;
            }
        }
        signal = 0;

        for(int i = 0; i<5;i++){
            if(s[i] == ' '){
                signal++;
            }
            if(s[i] >= '0' && s[i]<='9' && signal == 1){
                broj += s[i] - '0' * 10^stepen2;
                stepen--;
            }
        }


    }

    Serial.println(broj);
}

void setup(){
  Serial.begin(9600);

  createTask(zbir, 1000, TASK_ENABLE, NULL);
}


void loop(){

}

