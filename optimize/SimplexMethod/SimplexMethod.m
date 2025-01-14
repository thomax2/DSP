clear;
close all;

c = [-4 -1 0 0 0];
A = [-1 2 1 0 0;2 3 0 1 0;1 -1 0 0 1];
b = [4 12 3]';
[X,f]=LinProg(c,A,b);


function [X,f] = LinProg(c,A,b)
    [m,n] = size(A);
    cB = c(:,1:m);
    cN = c(:,m+1:n);
    X = zeros(n,1);
    combs = nchoosek(1:n,m);
    for comb = combs'
        B = A(:,comb);
        if(abs(det(B)) >= 0.01)
            B_idx = comb;
            N_idx = setdiff(1:n,B_idx);
            break;
        end
    end
    while(1)
        X(B_idx,:) = inv(B)*b;
        X(N_idx,:) = 0;
        Z_C = cB*inv(B)*A(:,N_idx)-c(:,N_idx);
        [zk_ck,k] = max(Z_C);
        if(zk_ck<0)
            f = c*X;
            return;
        else
            yk = inv(B)*A(:,k);
            if all(yk<=0)
                disp("no solution");
                return;
            else
                yk0_idx = find(yk>0);
                b_ = (inv(B)*b);
                [X(k),r] = max(b_(yk0_idx,:)./yk(:,yk0_idx));
                r = B_idx(yk0_idx(r));
                B_idx(B_idx == r) = [];
                B_idx = [B_idx k];
                N_idx(N_idx == k) = [];
                N_idx = [N_idx r];
            end
        end
    end
end