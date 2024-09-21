clear;
close all;

% X = randi([-10, 10], 7, 5);
X = [1 2 3;2 3 6;7 2 6;4 5 3;6 9 2];
[m,n] = size(X);
H = eye(m);
Y = X;

for i = 1:n
    
    for j = m:-1:i+1
        x1 = Y(i,i);
        x2 = Y(j,i);
        theta = atan(x2/x1);
        P = eye(m);
        P(i,i) = cos(theta);
        P(i,j) = sin(theta);
        P(j,i) = -sin(theta);
        P(j,j) = cos(theta);
        H = P*H;
        Y = P*Y;
    end
end
Q = H';
R = Y;
