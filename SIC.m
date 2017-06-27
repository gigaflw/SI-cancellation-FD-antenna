function recovered = SIC(t, received, reference, E1, fc1, E2, fc2, lowerDelay)
    T = t(2) - t(1);  % sampling period
    tau = 2 * pi;
    
    % phase modulation
    upper = E1 * exp(1i * (tau * fc1 * t + received));
    lower = E2 * exp(1i * (tau * fc2 * t + reference));
    
    % band pass filter
    fft_upper = bandPassFilter(fft(upper), (fc1+1)-1 , (fc2+1)+1);
    fft_lower = bandPassFilter(fft(lower), (fc1+1)-1 , (fc2+1)+1);

    fft_upper = removeNonPeaks(fft_upper, 2);
    fft_lower = removeNonPeaks(fft_lower, 2);
    
%     fft_upper(abs(fft_upper) > 0)
%     fft_lower(abs(fft_lower) > 0)
    % recover
    upper_recover = recoverBySSBC(fft_upper);
    lower_recover = recoverBySSBC(fft_lower);
    
    shiftN = floor(lowerDelay / T);
    lower_recover = [lower_recover(end-shiftN+1:end), lower_recover(1:end-shiftN)];

    recovered = upper_recover + lower_recover;

    % plotting
    cla;
    subplot(2,2,1);
	hold on;
  	plot(abs(fft_upper / length(fft_upper)));
  	plot(abs(fft_lower / length(fft_lower)));
%     plot(fft_upper);
%     plot(fft_lower);
	title('E_{upper} & E_{lower} (frequency domain)');

	subplot(2,2,2);
	hold on;
	rcef = timeToLogFreq(received);
	rcof = timeToLogFreq(recovered);
	plot(rcef);
	plot(rcof);
	title('Signal interested (time domain)');

	subplot(2,2,3);
	plot(upper_recover);
	title('Recovered E_{upper}');

	subplot(2,2,4);
	plot(lower_recover + upper_recover);
	title('Recovered E_{lower}');
end

function y = recoverBySSBC(x)
    y = ifft(x);
    y = y .* conj(y);
    y = y - mean(y);  % remove DC component
end

function y = bandPassFilter(x, lower ,upper)
    y = x;
    y(1:lower) = 0;
    y(upper:end) = 0;
end

function y = removeNonPeaks(x, npeaks)
    [peaks, locs] = findpeaks(abs(x));
    [~, index] = sort(peaks, 'descend');
    y = zeros(1, length(x));
    y(locs(index(1:npeaks))) = x(locs(index(1:npeaks)));
    % remove peaks which are too small
    % y(abs(y) < max(peaks) * threshold) = 0;
end
