#include <Keypad.h>

const byte ROWS = 4;
const byte COLS = 4;

char keys [ROWS][COLS] = {
  {'A', 'B', 'C', 'D'},
  {'E', 'F', 'G', 'H'},
  {'I', 'J', 'K', 'L'},
  {'M', 'N', 'O', 'P'}
};

byte pinROWS[ROWS] = {6, 7, 8, 9};
byte pinCOLS[COLS] = {5, 4, 3, 2};

Keypad keypad = Keypad(makeKeymap(keys), pinROWS, pinCOLS, ROWS, COLS);

int H_Do;
int H_Re;
int H_MiFlat;
int H_Mi;
int H_Pa;
int H_Sol;
int H_Ra;

int Re;
int Mi;
int Pa;
int SolFlat;
int Sol;
int Ra;
int Si;

int force;
int ledPin = 10;

void setup() {
  Serial.begin(9600);
  pinMode(ledPin = 10, OUTPUT);
}

void loop() {
  char key = keypad.getKey();
  
  if(key) {
    Serial.println(key);

    force = analogRead(A0);
    Serial.println(force);

  }

  if(force > 120) {
      digitalWrite(ledPin, HIGH);
    }
    else{
      digitalWrite(ledPin, LOW);
    }
}
