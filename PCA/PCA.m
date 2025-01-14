function [Y]=PCA(X,k)
    [m,n] = size(X);
    u = 0;
    for i = 1:m
        for j = 1:n
            u = u + X(i,j);
        end
        u = u/n;
        for j = 1:n
            X(i,j) = X(i,j) - u;
        end
        u = 0;
    end
    [eVe,eVa] = eig(X*X');
    eVa = diag(eVa);
    [~,index] = sort(eVa,'descend');
    P = eVe(:,index);
    P = P(:,1:k);
    Y = P'*X;
end

% clc;
% clear;
% 
% A = [1,2,3,4,5;6,7,8,9,10;11,12,13,14,14];
% [m,n] = size(A);
% u = 0;
% k=2;
% 
% for i = 1:m
%     for j = 1:n
%         u = u + A(i,j);
%     end
%     u = u/n;
%     for j = 1:n
%         A(i,j) = A(i,j) - u;
%     end
%     u = 0;
% end
% 
% [eVe,eVa] = eig(A*A');
% eVa = diag(eVa);
% [eVa,index] = sort(eVa,'descend');
% P = eVe(:,index);
% P = P(:,1:k);
% Y = P'*A;
