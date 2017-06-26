tau = 2*pi;
fRF = 300;
t = 0:0.0001:1;   % must ends at 1?
Vs = 0.1;
Vr = 0.5;
deltaT = 0.001;   % used to delay interference signal

s = Vs * cos(tau * fRF * t);
r = Vr * cos(tau * fRF * t);
i = Vr * cos(tau * fRF * (t - deltaT));

% i = Vr * cos(tau * fRF * t);

fc1 = 2000;
fc2 = 3000;
E1 = 1; E2 = 1;
lowerDelay = deltaT; % delay in the lower signal

SIC(t, i+s, r, E1, fc1, E2, fc2, lowerDelay);
