//PPG project code
//Nathan Hung 12/23/2018

int photocell = 0; //analog pin for photo resistor
int dc_photocell = 9; //digital pin for photo resister
int smoothedVal;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {


  // put your main code here, to run repeatedly:
  int reading_ana = analogRead(photocell); 
  Serial.println(reading_ana);
  
  delay(50);
}
