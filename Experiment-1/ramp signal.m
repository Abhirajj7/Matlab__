%{
% GENERATION OF RAMP SIGNAL 
clc;
clf;
clear all;

n1 = input("Enter the starting point of the signal: n_start = ");
n2 = input("Enter the ending point of the signal: n_end = ");

% discrete ramp signal
sample_points = -n1:0.1:n2;
amplitude = sample_points .* (sample_points >= 0);   

% Plotting both using subplot

% Subplot for discrete ramp signal
subplot(2, 1, 1);  
stem(sample_points, amplitude, 'filled');
xlabel("Sample Points");
ylabel("Amplitude");
title("Discrete Ramp Signal");
grid on;

% Subplot for continuous ramp signal
subplot(2, 1, 2);  
plot(sample_points, amplitude, 'LineWidth', 2);
xlabel("Time (s)");
ylabel("Amplitude");
title("Continuous Ramp Signal");
grid on;
%}




% GENERATION OF RAMP SIGNAL 

clc;
clf;

n1 = input("Enter the starting point of the signal: n_start = ");
n2 = input("Enter the ending point of the signal: n_end = ");

% Define sample points for the ramp signal
sample_points = -n1:0.1:n2;
amplitude = sample_points .* (sample_points >= 0);   

% Subplot for discrete ramp signal
subplot(2, 1, 1);  
stem(sample_points, amplitude, 'filled', 'LineWidth', 2);
xlabel("Sample Points");
ylabel("Amplitude");
title("Discrete Ramp Signal");
grid on;
% Adjust y-axis to show negative values down to -1
ylim([-1 1.1 * max(amplitude)]);

% Subplot for continuous ramp signal
subplot(2, 1, 2);  
plot(sample_points, amplitude, 'LineWidth', 2);
xlabel("Time (s)");
ylabel("Amplitude");
title("Continuous Ramp Signal");
grid on;
% Adjust y-axis to show negative values down to -1
ylim([-1 1.1 * max(amplitude)]);
