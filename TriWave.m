function y = TriWave(A, f)
    N = 1 / f * 2 * pi;
    T = 0 : 0.001 : 2*pi;
    y = A * sawtooth(N * T, 0.5);