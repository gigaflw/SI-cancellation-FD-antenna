function y = DrawFreqAxes(UIAxes, y1, y2, fRF)
    figure('visible','off');
    freq = length(y1);
    T = 0: 1: freq-1;
    A1 = max(abs(y1));
    A2 = max(abs(y2));
    A = max(A1, A2);
    plot(UIAxes, T, y1, T, y2);
    minIndex = max(1, fRF+1-5000);
    maxIndex = min(freq-1, fRF+1+5000);
    if (A == 0)
        set(UIAxes,'XLim', [T(minIndex) T(maxIndex)], 'YLim', [-1 1]);
    else
        set(UIAxes,'XLim', [T(minIndex) T(maxIndex)], 'YLim', [-(A*1.05) (A*1.05)]);
    end