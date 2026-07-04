const int TILT_PIN = A0;
const int BUZZER_PIN = 10;

const int VALUE_THRESHOLD = 5;
const int TIME_THRESHOLD = 2;
const int BUZZER_PWM = 100;

int previousValue = 0;
int vibrationCounter = 0;

void setup() {
  pinMode(BUZZER_PIN, OUTPUT);
  analogWrite(BUZZER_PIN, 0);
}

void loop() {

  int currentValue = analogRead(TILT_PIN);

  if (abs(currentValue - previousValue) >= VALUE_THRESHOLD) {

    vibrationCounter++;

    if (vibrationCounter >= TIME_THRESHOLD) {

      analogWrite(BUZZER_PIN, BUZZER_PWM);

    }

  } else {

    vibrationCounter = 0;
    analogWrite(BUZZER_PIN, 0);

  }

  previousValue = currentValue;

  delay(500);
}
