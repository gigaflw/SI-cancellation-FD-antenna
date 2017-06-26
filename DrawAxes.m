function DrawAxes(UIAxes, T, y, A)
    figure('visible','off');
    plot(UIAxes, T, y);
    set(UIAxes,'XLim', [T(1)-0.1 T(end)+0.1], 'YLim', [-(A*1.1) (A*1.1)]);