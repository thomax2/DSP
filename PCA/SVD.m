function [U,S,V]=SVD(A)

f_t = 0;
[m,n]=size(A);

if(m<n)
    A = A';
    [m,n]=size(A);
    f_t = 1;
end

[T,Va]=eig(A*A');
for i=1:m
    if(Va(i,i)<0)
        Va(i,i)=0;
    else
        Va(i,i)=sqrt(Va(i,i));
    end
end
[T1,~]=eig(A'*A);

for i=1:n
    Av=A*T1(:,n+1-i);
    US=T(:,m+1-i);
    if(Av(1,1)*US(1,1)<0)
        T(:,m+1-i)=-T(:,m+1-i);
    end
end

Va=Va(:,(m-n)+1:m);

if(f_t == 1)
    U=T1;
    S=Va';
    V=T;
else
    U=T;
    S=Va;
    V=T1;
end
% clc;
% clear;
% 
% f_t = 0;
% A = randn(10,5);
% [m,n]=size(A);
% 
% if(m<n)
%     A = A';
%     [m,n]=size(A);
%     f_t = 1;
% end
% 
% [T,V]=eig(A*A');
% for i=1:m
%     V(i,i)=sqrt(V(i,i));
% end
% [T1,V1]=eig(A'*A);
% 
% for i=1:n
%     Av=A*T1(:,n+1-i);
%     US=T(:,m+1-i);
%     if(Av(1,1)*US(1,1)<0)
%         T(:,m+1-i)=-T(:,m+1-i);
%     end
% end
% 
% V=V(:,(m-n)+1:m);
% 
% B=T*V*T1';
% 
% if(f_t == 1)
%     U11=T1;
%     S11=V';
%     V11=T;
%     A=A';
% else
%     U11=T;
%     S11=V;
%     V11=T1;
% end
