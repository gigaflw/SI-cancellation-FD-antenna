function y = SquareWave(A, f, T)
    N = f * 2 * pi;
    y = A * square(N * T);