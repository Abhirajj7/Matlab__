%Overlap Save Method
clc;
clear all;
close all;
x= input('Enter the first sequence: ');
h= input('Enter the second sequence: ');
l1= length(x);
l2= length(h);
h=[h, zeros(1,l2-1)];
x= [zeros(1,l2-1) x zeros(1,l2)];
y=[];
for (i=1:l2:l1+l2-1);
  x1= x(i:i+2*l2-2);
  s1=convfft(x1,h);
  y=[y s1(l2:2*l2-1)];
end
y = y(1:l1+l2-1);
disp(y);

%Function
function h= convfft(x,y);
  n1= length(x);
  n2= length(y);
  dx= fft(x);
  dy= fft(y);
  mul= dx.*dy;
  h= ifft(mul);
end
