clc;
clear all;
close all;
disp('5. Frequency Shifting property');
clear all;
x1=input('Enter the sequence : ');
m=input('Enter the shift m : ');
N=length(x1);
y1=dft(x1);
for (n=1:N)
  x2(n)=exp(1i*2*pi*m*(n-1)/N)*x1(n);
end
y2=dft(x2);
y=circshift(y1',m);
disp('DFT of x(n) : ');
disp(y1');
disp('DFT of e^(j2pi*kn/N)*x(n-m) by direct method : ');
disp(y2');
disp('DFT of e^(j2pi*kn/N)*x(n-m) by property : ');
disp(y);
if (abs(y'-y2)<10^(-10))
  disp('Frequency shifting property of DFT is verified');
else
  disp('Frequency shifting property of DFT is not verified');
end

% Function definition
function y=dft(x)
N=length(x);
y=zeros(1,N);
for (k=1:N)
  for (n=1:N)
    y(k)=y(k)+exp(-1i*2*pi*(k-1)*(n-1)/N)*x(n);
  end
end
