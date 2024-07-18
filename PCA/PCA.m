clc;
clear;
% A=randn(770,766);
C = randn(770, 40);
B = randn(40, 766);
A = C*B;

[U,S,V]=SVD(A);