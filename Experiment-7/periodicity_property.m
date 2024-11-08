clc;
clear all;
close all;
disp('1. Periodicity Property')
x=input('Enter the sequence : ');
N=length(x);
x=[x x];
for( k=1:2*N)
  y(k)=0;
  for (n=1:N)
    y(k)=y(k)+exp(-1i*2*pi*(k-1)*(n-1)/N)*x(n);
  end
end
disp('DFT of input in 1st period (1 to N): ');
disp((y(1:N))');
disp('DFT of input in 2nd period (N+1 to 2N): ');
disp((y(N+1:2*N))');
if (abs(y(1:N)-y(N+1:2*N))<10^(-10))
  disp('Periodicity Property of DFT is verified');
else
  disp('Periodicity Property of DFT is not verified');
end
