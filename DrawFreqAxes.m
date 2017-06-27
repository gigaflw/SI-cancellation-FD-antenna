function y = DrawFreqAxes(UIAxes, y, A, fRF)
    figure('visible','off');
    freq = length(y);
    T = 0: 1: freq-1;
    plot(UIAxes, T, y);
    minIndex = max(1, fRF+1-10000);
    maxIndex = min(freq-1, fRF+1+10000);
    if (A == 0)
        set(UIAxes,'XLim', [T(minIndex) T(maxIndex)], 'YLim', [-1 1]);
    else
        set(UIAxes,'XLim', [T(minIndex) T(maxIndex)], 'YLim', [-(A*1.1) (A*1.1)]);
    end