clc;
clf;
close all;
clear all;

x = input("Enter x values: ");  
h = input("Enter h values: ");  
l = length(x);  
m = length(h);  
l_y = l + m - 1;              % The length of the output sequence y (l + m - 1 for linear convolution)

H = [h zeros(1, (l_y - m))];  % Zero-pad h to make its length equal to l_y
X = [x zeros(1, (l_y - l))];  % Zero-pad x to make its length equal to l_y
y = zeros(1, l_y);            % Initialize the output sequence y with zeros

% Perform the circular convolution manually
for (i = 1:l_y)               % Loop over each element in the output sequence y
    for (j = 1:l_y)           % Loop over each element in the input sequences
        % Circularly shift the sequence h and multiply with corresponding x values
        y(i) = y(i) + X(j) * H(mod(i-j, l_y) + 1);  % Add product to y(i)
    end
end

disp(y);  % Display the result of the manual circular convolution

% Perform convolution using MATLAB's built-in conv() function for verification
y_conv = conv(x, h);          % Use MATLAB's built-in function to compute linear convolution
len_y_conv = length(y_conv);  % Get the length of the convolution result from the built-in function

subplot(221);
stem(0:l-1,x);
title("x[n]");
xlabel("Samples");
ylabel("Amplitude");
grid on;

subplot(222);
stem(0:m-1,h);
title("h[n]");
xlabel("Samples");
ylabel("Amplitude");
grid on;

subplot(223);
stem(0:l_y-1,y);
title("Circular Convolution");
xlabel("Samples");
ylabel("Amplitude");
grid on;

subplot(224);
stem(0:len_y_conv-1,y_conv);
title("In-built Function");
xlabel("Samples");
ylabel("Amplitude");
grid on;
