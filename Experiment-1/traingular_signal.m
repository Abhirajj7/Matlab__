clc;
clf;

Am = input("Enter the maximum amplitude of the wave: ");
Fm = input("Enter the frequency of the wave (Hz): ");
Cy = input("Enter the number of cycles of the wave: ");
Duty_Cycle = input("Enter the duty cycle percentage (0-1): ");

% Ensure DutyCycle is between 0 and 100
if Duty_Cycle < 0 || Duty_Cycle > 1
    error('Duty cycle must be between 0 and 1.');
end

% Time vector for continuous signal
t = 0 : (1/(50 * Fm)) : Cy/Fm;

% Triangular wave signal
Triangular_wave = Am * sawtooth(2 * pi * Fm * t, Duty_Cycle);

% Determine max and min amplitude values
max_amplitude = max(Triangular_wave);
min_amplitude = min(Triangular_wave);

% Set y-axis limits
y_min = min_amplitude - 1;
y_max = max_amplitude + 1;

% Plotting both using subplot

% Subplot for continuous triangular wave
subplot(2, 1, 1);  
plot(t, Triangular_wave, 'LineWidth', 2);
title(sprintf('Continuous Triangular Wave (Frequency = %.2f Hz, Duty Cycle = %.1f%%)', Fm, Duty_Cycle * 100));
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
% Adjust y-axis limits
ylim([y_min y_max]);

% Highlight x-axis with a blue bold line
hold on;
line(xlim, [0 0], 'Color', 'blue', 'LineWidth', 2);
hold off;

% Subplot for discrete triangular wave
subplot(2, 1, 2);  
stem(t, Triangular_wave, 'filled');
title(sprintf('Discrete Triangular Wave (Frequency = %.2f Hz, Duty Cycle = %.1f%%)', Fm, Duty_Cycle * 100));
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
% Adjust y-axis limits
ylim([y_min y_max]);

% Highlight x-axis with a blue bold line
hold on;
line(xlim, [0 0], 'Color', 'blue', 'LineWidth', 2);
hold off;
