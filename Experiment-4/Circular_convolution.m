clc;
clf;
clear all;
close all;

x1=input('Enter 1st matrix: ');
x2=input('Enter 2nd matrix: ');
n=length(x1);
m=length(x2);
l=max(n,m);                         % Find the maximum length between x1 and x2 to determine the output length for circular convolution

subplot(221);
sample_points=1:1:n;
stem(sample_points,x1);
title('Sample 1');
xlabel('Sample points');
ylabel('Amplitude');
grid on;

subplot(222);
sample_points=1:1:m;
stem(sample_points,x2);
title('Sample 2');
xlabel('Sample points');
ylabel('Amplitude');
grid on;

% Zero-padding for sequences if they are of different lengths
if (n~=m)                       % Check if the lengths of x1 and x2 are not equal
    if (n>m)                    % If x1 is longer than x2
        x2=[x2 zeros(1,m-n)];   % Zero-pad x2 to match the length of x1
    else                        % If x2 is longer than x1
        x1=[x1 zeros(1,m-n)];   % Zero-pad x1 to match the length of x2
    end
end

% Construct the circulant matrix for circular convolution
X1=zeros(l,l);                  
for (i=1:l)
    X1(:,i)=circshift(x1(:),i-1);
end
y=X1*x2(:);
yt=y';
disp(['Sequence: ',num2str(yt)]);

%Using in-built function
yb=cconv(x1,x2,l);
disp(['Sequence with in-built function: ',num2str(yb)]);

subplot(223);
sample_points=1:1:n;
stem(sample_points,yt);
title('User Function');
xlabel('Sample points');
ylabel('Amplitude');
grid on;

subplot(224);
sample_points=1:1:n;
stem(sample_points,yb);
title('Built in Function');
xlabel('Sample points');
ylabel('Amplitude');
grid on;
