function y = NoiseWave(A, timeFreq)
    noise = wgn(1, fix(timeFreq+1), 3);  % 3dBm = 316 mV
    scalar = A / max(abs(noise));
    y = scalar * noise;