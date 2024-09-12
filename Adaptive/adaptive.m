clear;
close all;
epoch = 4000;
dt = 0.01;
t = 0:dt:dt*(epoch-1);

%% example 1
% S = sin(2*pi*10*t);
% SNR = 30;
% X = awgn(S,SNR,'measured');
% D = sin(2*pi*10*t);
% [Y,e]=lms_adpt(X,D);

%% example 2
S = 100*sin(t);
N = (t.^2);
D = S+N;
X = 0.4*(t.^2);
[Y,e]=lms_adpt(X,D);

E = D - Y;

%% output is the part of input which is strong correlate with expect signal
figure
plot(Y)
title("output")
figure
plot(e)
title("error")
figure
plot(E)
title("E")
