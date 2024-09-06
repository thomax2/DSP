clear;
close all;
epoch = 200;
dt = 0.01;
accelrate = 0;
velocity = 1;
position = 0;
F = [1 dt (dt^2)/2; 0 1 dt; 0 0 1];
H = [1 0 0];

P = [0.5 0 0;0 0.1 0;0 0 0];
Q = 1;

state = zeros(3,epoch);
obser = zeros(1,epoch);
X = zeros(3,epoch);

Xa = zeros(3,epoch);
Xa(:,1) = [0 0 0];

R = eye(3);

Ra = eye(3);

state(1,1) = position;
state(2,1) = velocity;
state(3,1) = accelrate;
obser(1) = position + sqrt(Q)*randn;



for i=2:epoch
    state(:,i) = F*state(:,i-1);
    state(1,i) = state(1,i) + sqrt(P(1,1))*randn;
    state(2,i) = state(2,i) + sqrt(P(2,2))*randn;
    state(3,i) = state(3,i) + sqrt(P(3,3))*randn;
    obser(i) = H*state(:,i) + sqrt(Q)*randn;
end

for i=2:epoch
    Xa(:,i) = F*X(:,i-1);
    Ra = F*R*F'+P;
    G = Ra*H'/(H*Ra*H'+Q);
    X(:,i) = X(:,i-1) + G*(obser(i)-H*Xa(:,i));
    R = (eye(3)-G*H)*Ra;
end


% subplot(311)
figure
plot(state(1,:))
hold on
% subplot(312)
plot(obser)
% subplot(313)
plot(X(1,:))
plot(Xa(1,:))
legend('real','observation','perdict','aperdict')
hold off

figure
plot(abs(state(1,:)-obser))
hold on
plot(abs(state(1,:)-X(1,:)))
legend('observation error','perdict error')