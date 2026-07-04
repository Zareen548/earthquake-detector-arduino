#earthquake-detector-arduino

A microcontroller-based earthquake detector using a tilt/vibration sensing element, buzzer alarm, and threshold logic.
# Earthquake Detector using Microcontroller

This project is a simple earthquake detection system developed during my bachelor's studies. It uses a vibration/tilt sensing element to detect abnormal ground movement. When the sensed value exceeds a predefined threshold for a certain time, the system activates a buzzer alarm.

## Features
- Detects vibration or tilt changes
- Uses analog input from sensor
- Activates buzzer alarm
- Simple threshold-based detection
- Low-cost hardware implementation

## Components
- Microcontroller / Arduino
- Tilt switch or vibration sensor
- Buzzer
- Resistors
- Breadboard / PCB
- Connecting wires

## Working Principle
1. The sensor detects vibration or tilt.
2. The microcontroller reads the sensor value from analog pin A0.
3. If the value exceeds the threshold for a fixed time, the buzzer turns ON.
4. After the alarm condition, the values are reset.

## Applications
- Earthquake warning prototype
- Vibration monitoring
- Safety alarm system
- Educational embedded systems project
