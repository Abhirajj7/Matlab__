clc;
clear all;
close all;
disp('2. Linearity Property')
clear all;
x1=input('Enter the 1st sequence : ');
x2=input('Enter the 2nd sequence : ');
a=input('Enter 1st scalar value a : ');
b=input('Enter 2nd scalar value b : ');
y1=dft(x1);
y2=dft(x2);
Y1=(dft(a*x1+b*x2))'
Y2=(a*y1+b*y2)'
if (abs(Y1-Y2)<10^(-10))
  disp('Linearity property of DFT is verified');
else
  disp('Linearity property of DFT is not verified');
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
