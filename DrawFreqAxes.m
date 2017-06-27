function y = DrawFreqAxes(UIAxes, y1, y2, fRF)
    figure('visible','off');
    freq = length(y1);
    T = 0: 1: freq-1;
    Amax = max(max(y1), max(y2));
    Amin = min(min(y1), min(y2));
    plot(UIAxes, T, y1, T, y2);
    minIndex = max(1, fRF+1-500);
    maxIndex = min(freq-1, fRF+1+500);
    set(UIAxes,'XLim', [T(minIndex) T(maxIndex)], 'YLim', [Amin-5 Amax+5]);