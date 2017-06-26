function y = SinWave(A, f, T)
    N = f * 2 * pi;
    y = A * sin(N * T);