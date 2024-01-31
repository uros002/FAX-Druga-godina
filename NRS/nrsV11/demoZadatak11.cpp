#include<arduinoPlatform.h>
#include<tasks.h>
#include<interrupts.h>
#include<stdio.h>
#include<serial.h>

extern serial Serial;

#define dump(v) Serial.println(v)

// the setup function runs once when you press reset or power the board
void setup()
{
  // initialize digital pin 33 as an output.
  pinMode(33, OUTPUT);
  pinMode(27, OUTPUT);

  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
}

// the loop function runs over and over again forever
void loop()
{
  // odradi blink na pinu 33
  digitalWrite(33, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(1000);              // wait for a second
  digitalWrite(33, LOW);    // turn the LED off by making the voltage LOW
  delay(1000);              // wait for a second

  // LED na 27 prati SWITCH na 7
  int pin7 = digitalRead(7);
  dump(pin7);
  if( pin7 )
    digitalWrite(27, HIGH);
  else
    digitalWrite(27, LOW);
}
