tau = 2*pi;
fRF = 4000;
t = 0:0.00001:1;   % must ends at 1?
Vs = 0.04;
Vr = 0.8;
deltaT = 0.0001;   % used to delay interference signal

s = Vs * cos(tau * fRF * t);
r = Vr * cos(tau * fRF * t);
i = Vr * cos(tau * fRF * (t - deltaT));
% r = Vr * wgn(1, length(t), -10);
% r = 1;
% i = r;

fc1 = 20000;
fc2 = 30000;
E1 = 1; E2 = 1;
lowerDelay = deltaT; % delay in the lower signal
SIC(t, i+s, r, E1, fc1, E2, fc2, lowerDelay);
