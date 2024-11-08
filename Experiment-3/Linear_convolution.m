clc;                    
clf;                    
close all;              
clear all;              
%y(n) = conv(x1, x2) for verification purposes

x1 = input('Enter first sequence: '); 
x2 = input('Enter second sequence: '); 
n = length(x1);                       
m = length(x2);                      
l = n + m - 1;                        
y = zeros(1, l);                             % Initialize result of convolution with zeros

for i = 1:n
    for k = 1:m
        y(i+k-1) = y(i+k-1) + x1(i) * x2(k); % Multiply and accumulate the values in y
    end
end
disp(['Sequence: ', num2str(y)]);            % Display the manually calculated convolution result

sam_point1 = 1:1:n;                          % Sample points for the first sequence x1
sam_point2 = 1:1:m;                          % Sample points for the second sequence x2
sam_point3 = 1:1:l;                          % Sample points for the manual convolution result y

subplot(221);                          
stem(sam_point1, x1);                  
title('x1[n]');                       
xlabel('Samples');                     
ylabel('Amplitude');                   
grid on;                               

subplot(222);                          
stem(sam_point2, x2);                  
title('x2[n]');                        
xlabel('Samples');                     
ylabel('Amplitude');                  
grid on;                               


subplot(223);                         
stem(sam_point3, y);                  
title('User-Built Function');          
xlabel('Samples');                    
ylabel('Amplitude');                  
grid on;                               

% MATLAB's in-built convolution function
y_conv = conv(x1, x2);                 
disp(['Sequence with in-built function: ', num2str(y_conv)]); 
len_y_conv = length(y_conv);           
sam_point4 = 1:1:len_y_conv;                   % Sample points for the in-built convolution result


subplot(224);                     
stem(sam_point4, y_conv);              
title('In-Built Function');            
xlabel('Samples');                    
ylabel('Amplitude');                   
grid on;                       
