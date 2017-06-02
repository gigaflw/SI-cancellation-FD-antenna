function y = SquareWave(A, f)
    N = 1 / f * 2 * pi;
    T = 0 : 0.001 : 2*pi;
    y = A * square(N * T);