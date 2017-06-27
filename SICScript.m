tau = 2*pi;
fRF = 4000;
t = 0:0.00001:1;   % must ends at 1?
Vs = 0.2;
Vr = 0.4;
% deltaT = 0.001;   % used to delay interference signal
deltaT = 0;

s = Vs * cos(tau * fRF * t);
% r = Vr * cos(tau * fRF * t);
% i = Vr * cos(tau * fRF * (t - deltaT));
r = wgn(1, length(t), -10);
i = wgn(1, length((t - deltaT)), -10);

fc1 = 20000;
fc2 = 30000;
E1 = 1; E2 = 1;
lowerDelay = deltaT; % delay in the lower signal
SIC(t, i+s, r, E1, fc1, E2, fc2, lowerDelay);
