function y = InterferenceWave(wave, delay, noiseDB, timeFreq)
    delayWave = [zeros(1, delay*timeFreq), wave(1: end-delay*timeFreq)];
    
    noise = wgn(1, fix(timeFreq+1), noiseDB);  % 3dBm = 316 mV
    
    y = delayWave + noise;