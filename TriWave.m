function y = TriWave(A, f, T)
    N = f * 2 * pi;
    y = A * sawtooth(N * T, 0.5);