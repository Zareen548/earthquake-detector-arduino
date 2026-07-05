clc;
clear;
close all;

%% Earthquake Detector Sensor Data Analysis
% Sample data for Arduino tilt sensor based earthquake detector
% Normal condition: small variation
% High vibration: large variation exceeding threshold

time = 0:0.5:30;                 % Time in seconds
baseline = 500;                  % Normal analog sensor level
threshold = 5;                   % Threshold used in Arduino code

%% Simulated normal condition
normalData = baseline + randi([-3 3], size(time));

%% Simulated high vibration condition
highVibrationData = baseline + randi([-3 3], size(time));

% Add artificial vibration peaks
vibrationIndex = [12 13 14 25 26 27 38 39 40 50 51 52];
highVibrationData(vibrationIndex) = baseline + ...
    [18 32 -22 20 35 -25 16 28 -20 22 30 -24];

%% Threshold lines
upperThreshold = baseline + threshold;
lowerThreshold = baseline - threshold;

%% Plot normal condition
figure;

subplot(2,1,1);
plot(time, normalData, 'b-o', 'LineWidth', 1.5);
hold on;
yline(upperThreshold, '--g', 'Upper Threshold');
yline(lowerThreshold, '--r', 'Lower Threshold');
grid on;

title('Tilt Sensor Reading - Normal Condition');
xlabel('Time (s)');
ylabel('Analog Value');
legend('Sensor Value', 'Upper Threshold', 'Lower Threshold', ...
       'Location', 'best');

text(2, 512, 'Normal condition: Buzzer OFF', ...
     'FontSize', 10, 'Color', 'b');

%% Plot high vibration condition
subplot(2,1,2);
plot(time, highVibrationData, 'r-o', 'LineWidth', 1.5);
hold on;
yline(upperThreshold, '--g', 'Upper Threshold');
yline(lowerThreshold, '--r', 'Lower Threshold');
grid on;

title('Tilt Sensor Reading - High Vibration Condition');
xlabel('Time (s)');
ylabel('Analog Value');
legend('Sensor Value', 'Upper Threshold', 'Lower Threshold', ...
       'Location', 'best');

text(2, 535, 'High vibration: Buzzer ON', ...
     'FontSize', 10, 'Color', 'r');

%% Detection logic
differenceValue = abs(highVibrationData - baseline);
detectedVibration = differenceValue >= threshold;

fprintf('Number of vibration points detected: %d\n', sum(detectedVibration));

%% Save figure
saveas(gcf, 'earthquake_sensor_analysis.png');
