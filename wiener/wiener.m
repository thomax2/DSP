L = 1000;
fs = 10^5;
dt = 1/fs;
t = 0:dt:dt*(L-1);
S = sin(1000*pi*t) + 1.5*sin(2000*pi*t);
% single_power = (1/length(S))*sum(S.^2); % use to replace 'measured' in awgn
SNR = 6;
X = awgn(S,SNR,0.6250);
e = X - S;

N = floor(L*0.1);
Rxx = xcorr(X,N-1,'biased');
Rxxt = zeros(N,N);
for i=1:N
    for j=1:N
        Rxxt(i,j) = Rxx(N-i+j);
    end
end

rSS=xcorr(S,S,N-1,'biased');
rSSn = zeros(1,N);
for i=1:N
    rSSn(i)=rSS(i);
end

% h = inv(Rxxt)*rSSn';
h = (Rxxt \ eye(size(Rxxt))) *rSSn';
Y = conv(X,h);

subplot(211)
plot(Y)
subplot(212)
plot(S)

