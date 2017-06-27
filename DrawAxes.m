function DrawAxes(UIAxes, T, y, A)
    figure('visible','off');
    plot(UIAxes, T, y);
    if (A == 0)
        set(UIAxes,'XLim', [(T(1)-0.05)*0.001 (T(end)+0.05)*0.001], 'YLim', [-1 1]);
    else
        set(UIAxes,'XLim', [(T(1)-0.05)*0.001 (T(end)+0.05)*0.001], 'YLim', [-(A*1.1) (A*1.1)]);
    end
    