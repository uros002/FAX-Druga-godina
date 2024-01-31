#include<arduinoPlatform.h>
#include<tasks.h>
#include<interrupts.h>
#include<stdio.h>
#include<serial.h>
#include <pwm.h>
#include<data.h>

extern serial Serial;

#define maxBrVrednosti 10
int brojVrednosti = 0;
int redniBrojGreske = 0;
int Uredjaj[maxBrVrednosti];
short Napon[maxBrVrednosti], Struja[maxBrVrednosti];

void brojevi(int id, void *tptr)
{
    if(available())
    {
        char *buffer = readAll();
        int velicina = *((int *) buffer);
        for(int i=0; i<velicina; i++)
        {
            Uredjaj[brojVrednosti%maxBrVrednosti] = *(int*)(buffer + sizeof(int) + i * slogSize() + 32);
            Napon[brojVrednosti%maxBrVrednosti]= *(short*)(buffer + sizeof(int) + i * slogSize() + 36);
            Struja[brojVrednosti%maxBrVrednosti] = *(short*)(buffer + sizeof(int) + i * slogSize() + 38);
            if(Napon[brojVrednosti%maxBrVrednosti] < 200){
                Serial.print("Pao napon ispod 200, redni broj greske: ");
                   redniBrojGreske++;
                Serial.println(redniBrojGreske);
                Serial.print("Na uredjaju: ");
                Serial.println(Uredjaj[brojVrednosti%maxBrVrednosti]);
                Serial.print("Na jacinu napona: ");
                Serial.println(Napon[brojVrednosti%maxBrVrednosti]);
            }
            brojVrednosti++;

            if (brojVrednosti>maxBrVrednosti) {

                int sumaStruje = 0;
                for(int j = 0; j<maxBrVrednosti; j++) {
                    sumaStruje += Struja[j];
                }
                Serial.print("Prosecna struja je: ");
                Serial.println(sumaStruje/maxBrVrednosti);
            }
        }
        delete[] buffer;
    }
}

void setup()
{
    Serial.begin(9600);

    startStopDataGeneration(START_GENERATION, RANDOM, 0, 20, 0.0, 200);

    createTask(brojevi, 1000, TASK_ENABLE,  NULL);
}

void loop()
{

}
