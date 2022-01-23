%Classification using perceptron

%Reading apple images
A1=imread('apple_04.jpg');
A2=imread('apple_05.jpg');
A3=imread('apple_06.jpg');
A4=imread('apple_07.jpg');
A5=imread('apple_11.jpg');
A6=imread('apple_12.jpg');
A7=imread('apple_13.jpg');
A8=imread('apple_17.jpg');
A9=imread('apple_19.jpg');

%Reading pears images
P1=imread('pear_01.jpg');
P2=imread('pear_02.jpg');
P3=imread('pear_03.jpg');
P4=imread('pear_09.jpg');

%Calculate for each image, colour and roundness
%For Apples
%1st apple image(A1)
hsv_value_A1=spalva_color(A1); %color
metric_A1=apvalumas_roundness(A1); %roundness
%2nd apple image(A2)
hsv_value_A2=spalva_color(A2); %color
metric_A2=apvalumas_roundness(A2); %roundness
%3rd apple image(A3)
hsv_value_A3=spalva_color(A3); %color
metric_A3=apvalumas_roundness(A3); %roundness
%4th apple image(A4)
hsv_value_A4=spalva_color(A4); %color
metric_A4=apvalumas_roundness(A4); %roundness
%5th apple image(A5)hsv_value_A5=spalva_color(A5); %color
hsv_value_A5=spalva_color(A5); %color

metric_A5=apvalumas_roundness(A5); %roundness
%6th apple image(A6)
hsv_value_A6=spalva_color(A6); %color
metric_A6=apvalumas_roundness(A6); %roundness
%7th apple image(A7)
hsv_value_A7=spalva_color(A7); %color
metric_A7=apvalumas_roundness(A7); %roundness
%8th apple image(A8)
hsv_value_A8=spalva_color(A8); %color
metric_A8=apvalumas_roundness(A8); %roundness
%9th apple image(A9)
hsv_value_A9=spalva_color(A9); %color
metric_A9=apvalumas_roundness(A9); %roundness

%For Pears
%1st pear image(P1)
hsv_value_P1=spalva_color(P1); %color
metric_P1=apvalumas_roundness(P1); %roundness
%2nd pear image(P2)
hsv_value_P2=spalva_color(P2); %color
metric_P2=apvalumas_roundness(P2); %roundness
%3rd pear image(P3)
hsv_value_P3=spalva_color(P3); %color
metric_P3=apvalumas_roundness(P3); %roundness
%2nd pear image(P4)
hsv_value_P4=spalva_color(P4); %color
metric_P4=apvalumas_roundness(P4); %roundness

%selecting features(color, roundness, 3 apples and 2 pears)
%A1,A2,A3,P1,P2
%building matrix 2x5
x1=[hsv_value_A1 hsv_value_A2 hsv_value_A3 hsv_value_P1 hsv_value_P2];
x2=[metric_A1 metric_A2 metric_A3 metric_P1 metric_P2];

% estimated features are stored in matrix P:
P=[x1;x2];

%Desired output vector
T=[1;1;1;-1;-1]; % <- ČIA ANKSČIAU BUVO KLAIDA!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

%% train single perceptron with two inputs and one output

% generate random initial values of w1, w2 and b
w1 = randn(1);
w2 = randn(1);
b = randn(1);
%pirma iteracija
v1 = x1(1)*w1+x2(1)*w2+b;
% calculate weighted sum with randomly generated parameters
%v1 = <...>; % write your code here
% calculate current output of the perceptron
if v1 > 0
y = 1;
else
y = -1;
end
% calculate the error
e1 = T(1) - y;

% repeat the same for the rest 4 inputs x1 and x2
% calculate wieghted sum with randomly generated parameters
% v2 = <...> ; % write your code here
% calculate current output of the perceptron
% antra iteracija
v2 = x1(2)*w1+x2(2)*w2+b;
if v2 > 0
y = 1;
else
y = -1;
end
% calculate the error
e2 = T(2) - y;

v3 = x1(3)*w1+x2(3)*w2+b;
if v3 > 0
y = 1;
else
y = -1;
end
% calculate the error
e3 = T(3) - y;

v4 = x1(4)*w1+x2(4)*w2+b;
if v4 > 0
y = 1;
else
y = -1;
end
% calculate the error
e4 = T(4) - y;

v5 = x1(5)*w1+x2(5)*w2+b;
if v5 > 0
y = 1;
else
y = -1;
end
% calculate the error
e5 = T(5) - y;
% <...> write the code for another 3 inputs

% calculate the total error for these 5 inputs
e = abs(e1) + abs(e2) + abs(e3) + abs(e4) + abs(e5);

% write training algorithm
while e ~= 0 % executes while the total error is not 0
% here should be your code of parameter update
%   calculate output for current example
%
%   calculate error for current example
   zing = 0.2;
%   update parameters using current inputs ant current error
w1= w1+zing*e1*x1(1);
w2 = w2+zing*e1*x2(1);
b = b+zing*e1;

w1= w1+zing*e2*x1(2);
w2 = w2+zing*e2*x2(2);
b = b+zing*e2;

w1= w1+zing*e3*x1(3);
w2 = w2+zing*e3*x2(3);
b = b+zing*e3;

w1= w1+zing*e4*x1(4);
w2 = w2+zing*e4*x2(4);
b = b+zing*e4;

w1= w1+zing*e5*x1(5);
w2 = w2+zing*e5*x2(5);
b = b+zing*e5;
%
%   Test how good are updated parameters (weights) on all examples used for training
%   calculate outputs and errors for all 5 examples using current values of the parameter set {w1, w2, b}
%   calculate 'v1', 'v2', 'v3',... 'v5'
%pirma iteracija
v1 = x1(1)*w1+x2(1)*w2+b;
% calculate weighted sum with randomly generated parameters
%v1 = <...>; % write your code here
% calculate current output of the perceptron
if v1 > 0
y = 1;
else
y = -1;
end
% calculate the error
e1 = T(1) - y;

% repeat the same for the rest 4 inputs x1 and x2
% calculate wieghted sum with randomly generated parameters
% v2 = <...> ; % write your code here
% calculate current output of the perceptron
% antra iteracija
v2 = x1(2)*w1+x2(2)*w2+b;
if v2 > 0
y = 1;
else
y = -1;
end
% calculate the error
e2 = T(2) - y;

v3 = x1(3)*w1+x2(3)*w2+b;
if v3 > 0
y = 1;
else
y = -1;
end
% calculate the error
e3 = T(3) - y;

v4 = x1(4)*w1+x2(4)*w2+b;
if v4 > 0
y = 1;
else
y = -1;
end
% calculate the error
e4 = T(4) - y;

v5 = x1(5)*w1+x2(5)*w2+b;
if v5 > 0
y = 1;
else
y = -1;
end
% calculate the error
e5 = T(5) - y;
% <...> write the code for another 3 inputs

% calculate the total error for these 5 inputs
e = abs(e1) + abs(e2) + abs(e3) + abs(e4) + abs(e5);
end
%building matrix 2x5
x1=[hsv_value_A1 hsv_value_A2 hsv_value_A3 hsv_value_P1 hsv_value_P2 hsv_value_A4 hsv_value_A5];
x2=[metric_A1 metric_A2 metric_A3 metric_P1 metric_P2 metric_A4 metric_A5];
T=[1;1;1;-1;-1;1;1];
%% train single perceptron with two inputs and one output

% generate random initial values of w1, w2 and b

%pirma iteracija
v1 = x1(1)*w1+x2(1)*w2+b;
% calculate weighted sum with randomly generated parameters
%v1 = <...>; % write your code here
% calculate current output of the perceptron
if v1 > 0
y = 1;
else
y = -1;
end
% calculate the error
e1 = T(1) - y;

% repeat the same for the rest 4 inputs x1 and x2
% calculate wieghted sum with randomly generated parameters
% v2 = <...> ; % write your code here
% calculate current output of the perceptron
% antra iteracija
v2 = x1(2)*w1+x2(2)*w2+b;
if v2 > 0
y = 1;
else
y = -1;
end
% calculate the error
e2 = T(2) - y;

v3 = x1(3)*w1+x2(3)*w2+b;
if v3 > 0
y = 1;
else
y = -1;
end
% calculate the error
e3 = T(3) - y;

v4 = x1(4)*w1+x2(4)*w2+b;
if v4 > 0
y = 1;
else
y = -1;
end
% calculate the error
e4 = T(4) - y;

v5 = x1(5)*w1+x2(5)*w2+b;
if v5 > 0
y = 1;
else
y = -1;
end
% calculate the error
e5 = T(5) - y;
% <...> write the code for another 3 inputs
v6 = x1(6)*w1+x2(6)*w2+b;
if v6 > 0
y = 1;
else
y = -1;
end
% calculate the error
e6 = T(6) - y;

v7 = x1(7)*w1+x2(7)*w2+b;
if v7 > 0
y = 1;
else
y = -1;
end
% calculate the error
e7 = T(7) - y;
% calculate the total error for these 5 inputs
e = abs(e1) + abs(e2) + abs(e3) + abs(e4) + abs(e5)+abs(e6)+abs(e7);