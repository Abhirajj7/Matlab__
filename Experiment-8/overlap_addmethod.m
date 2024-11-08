%Overlap Add Method
clc;
clear all;
close all;
x= input('Enter the First Sequence, x: = ');
h= input('Enter the Second Sequence, h: = ');
L = length(x);
M = length(h);
x = [x, zeros(1,M)];
s = [];
if (L>M)
  s=[zeros(1,L+(2*M)-1)];
  for (i=1 : M : L)
    a= x(i:i+M-1);
    s1 = convdft(a,h);
    s(i:i+(2*M)-2) = s(i:i+(2*M)-2) + s1;
  end
end
y = s(1:L+M-1);
disp(y);


%Function
function h = convdft(x,y);
  n1 = length(x);
  n2 = length(y);
  x = [x, zeros(1,n2-1)];
  y = [y,zeros(1,n1-1)];
  dx = fft(x);
  dy = fft(y);
  mul= dx .*dy;
  h= ifft(mul);
end
