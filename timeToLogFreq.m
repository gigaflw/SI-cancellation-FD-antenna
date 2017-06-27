function freq = timeToLogFreq(x)
    L = length(x);
    freq = abs(fft(x) / L);
    freq = freq(1: floor(L/2) +1 );
    freq(2:end-1) = 2*freq(2:end-1);
    freq = 10 * log10(freq);
end