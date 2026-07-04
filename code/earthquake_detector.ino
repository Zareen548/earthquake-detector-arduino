const int sensorPin = A0;
const int buzzerPin = 10;

int threshold = 500;
unsigned long vibrationStartTime = 0;
unsigned long requiredDuration = 1000;

bool vibrationDetected = false;

void setup() {
  pinMode(sensorPin, INPUT);
  pinMode(buzzerPin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  int sensorValue = analogRead(sensorPin);
  Serial.println(sensorValue);

  if (sensorValue > threshold) {
    if (!vibrationDetected) {
      vibrationDetected = true;
      vibrationStartTime = millis();
    }

    if (millis() - vibrationStartTime >= requiredDuration) {
      digitalWrite(buzzerPin, HIGH);
      delay(2000);
      digitalWrite(buzzerPin, LOW);

      vibrationDetected = false;
    }
  } 
  else {
    digitalWrite(buzzerPin, LOW);
    vibrationDetected = false;
  }
}
