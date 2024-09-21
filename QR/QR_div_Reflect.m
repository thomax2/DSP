clear;
close all;

X = randi([-10, 10], 7, 5);

% [m,n] = size(X);
% u = X(:,1);
% u(1,1) = u(1,1)-sqrt(X(:,1)'*X(:,1));
% u = u/sqrt(u'*u);
% H = eye(m)-2*(u*u');
% Y = H*X;
% 
% for i = 2:n
%     u = Y(i:m,i);
%     u(1,1) = u(1,1) - sqrt(Y(i:m,i)'*Y(i:m,i));
%     u = u/sqrt(u'*u);
%     P = eye(m-i+1)-2*(u*u');
%     for j = 1:i-1
%         P = [zeros(1,m-i+j);P];
%         P = [zeros(1,m-i+j+1)' P];
%         P(1,1) = 1;
%     end
%     H = P*H;
%     Y = H*X;
% end


[m,n] = size(X);
H = eye(m);
Y = X;

for i = 1:n
    u = Y(i:m,i);
    u(1,1) = u(1,1) - sqrt(Y(i:m,i)'*Y(i:m,i));
    u = u/sqrt(u'*u);
    P = eye(m-i+1)-2*(u*u');
    for j = 1:i-1
        P = [zeros(1,m-i+j);P];
        P = [zeros(1,m-i+j+1)' P];
        P(1,1) = 1;
    end
    H = P*H;
    Y = H*X;
end
Q = H';
R = Y;

% if()

% [Q, R] = qr(X);
% Y = Q*R;