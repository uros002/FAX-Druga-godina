#include<arduinoPlatform.h>
#include<tasks.h>
#include<interrupts.h>
#include<stdio.h>
#include<serial.h>
#include<data.h>
#include<pwm.h>

extern serial Serial;
#define maxBrVrednosti 30
#define maxUredjaja 21
int brVrednosti = 0;
short naponi[maxUredjaja];
int brUpozorenja[maxUredjaja];

void brojevi(int id, void* tptr){
    if(available()){
        char* buffer = readAll();
        int velicina = *((int*)buffer);
        for(int i = 0; i< velicina;i++){
            int brojUredjaja = *(int*)(buffer + sizeof(int)+ i*slogSize() + 32);
            short izmereniNapon = *(short*)(buffer + sizeof(int) + i*slogSize() + 36);
            Serial.print(brojUredjaja);
            Serial.print(" ");
            Serial.println(izmereniNapon);
            brVrednosti++;
            if(abs(izmereniNapon - naponi[brojUredjaja]) > 30 && naponi[brojUredjaja]!=0){
                Serial.print("Upozorenje, odstupanje napona na uredjaju: ");
                Serial.println(brojUredjaja);
                brUpozorenja[brojUredjaja]++;
            }
            naponi[brojUredjaja] = izmereniNapon;
            if(brVrednosti%maxBrVrednosti==0){
                int  maxJ = 0;
                for(int j = 1;j<=maxUredjaja;j++){
                    if(brUpozorenja[j] > brUpozorenja[maxJ]){
                        maxJ = j;
                    }
                }
                Serial.print("Najvise upozorenja se desilo na uredjaju: ");
                Serial.println(maxJ);
            }


        }



        delete[] buffer;
    }

}

void setup()
{

    Serial.begin(9600);

    for(int i = 0; i<maxBrVrednosti;i++){
        naponi[i] = 0;
    }

    for(int i = 0; i<maxBrVrednosti;i++){
        brUpozorenja[i] = 0;
    }

    startStopDataGeneration(START_GENERATION,RANDOM,0,20,0.0,1000);

    createTask(brojevi,1000,TASK_ENABLE,NULL);




}

void loop()
{



}
