clc;
clear all;
close all;
disp('3. Time Reversal Property')
clear all;
x1=input('Enter the sequence : ');
N=length(x1);
y1=dft(x1);
n=1:N-1;
x2(1)=x1(1);
x2(n+1)=x1(N-(n-1));
y2=dft(x2);
y(1)=y1(1);
y(n+1)=y1(N-(n-1));
disp('DFT of x(n) : ');
disp(y1');
disp('DFT of x(N-n) : ');
disp(y2');
disp('DFT of x(N-n) by property : ');
disp(y');
if (abs(y-y2)<10^(-10))
  disp('Time reversal property of DFT is verified');
else
  disp('Time reversal property of DFT is not verified');
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
