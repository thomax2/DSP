function  [Y,e]=lms_adpt(X,D)
    [m,n] = size(X);
    if(m<n)
        X = X';
        m = n;
    end
    N = 10;
    max_eignvalue = max(eig(X*X'));
    u = 1/max_eignvalue;
    e = zeros(1,m-N+1);
    Y = zeros(1,m);
    w = zeros(N,1);
    for i = N:m
        Y(i) = (X(i-N+1:i)')*w;
        e(i-N+1) = D(i)-Y(i);
        w = w+2*u*e(i-N+1)*(X(i-N+1:i));
    end
end