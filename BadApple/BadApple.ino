#include "Arduino_LED_Matrix.h"
#include "data.h"

ArduinoLEDMatrix matrix;
#define DELAY_FRAME 91

void setup() {
  Serial.begin(115200);
  matrix.begin();
}

void loop() {

  int length;
  length = sizeof(bmp) / sizeof(bmp[0]) / 3;
  for(int i = 0; i < length; i++){
    matrix.loadFrame(&bmp[i*3]);
    delay(DELAY_FRAME);
  }
}
