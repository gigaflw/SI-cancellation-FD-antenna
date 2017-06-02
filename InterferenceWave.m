function y = InterferenceWave(wave, delay)
    delayWave = [zeros(1, delay*1000), wave(1: end-delay*1000)];
    noise = wgn(1, fix(2*pi*1000+1), 3);
    y = delayWave + noise;