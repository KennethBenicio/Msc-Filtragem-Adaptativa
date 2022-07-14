%% Lista 3, Questao 5
clc;
close all;
clear all;

% Learning rate
mi = 1/(97*2);
% Filter order
% I first implemented thinking of python notation, later I found out that
% the reference book defines the order a bit different from what I usually
% work. So to make the code close to Diniz notation the 'order + 1' is
% needed.
order = 15 + 1;
% Number of samples
Samples = 5000 + order;
% Defining the mse error and filter coeficients vectors.
error = zeros(Samples,1);
weights = zeros(order, Samples);

% Defining the energy of the noise vector as 1e-3.
SNR_dB = 30;
SNR_li = 10^(SNR_dB/10);
variance_noise = 1/SNR_li;
noise = sqrt(variance_noise).*randn(Samples,1);

% Generating the original signal.
signal_d = randn(Samples,1);
signal_d = (signal_d-mean(signal_d))/std(signal_d);

% Convolving the channel and the signal.
Hz = [1 1 1 1 1 1 1 1 1 1 1 1];
signal_x = filter(Hz,1,signal_d);
%signal_x = conv(signal_d,Hz,'same');
% Generating the noisy received signal.
signal_x = signal_x + noise;
signal_x = (signal_x-mean(signal_x))/std(signal_x);

% To prevent the missmatch between the filtered signal and the desired
% signal. After some hours of debug I found out that the filtered signal
% was a shifted version of the desired signal.
signal_x = circshift(signal_x,order);
signal_d_hat = zeros(size(signal_d));
for ss = 1:(Samples - order)
    signal_d_hat(ss) = weights(:,ss)'*signal_x(ss:ss+order-1);
    % Error between the desired signal and the filtered signal.
    error(ss) = signal_d(ss) - weights(:,ss)' * signal_x(ss:ss+order-1); 
    % Recursive expression.
    weights(:,ss+1) = weights(:,ss) + 2 * mi * error(ss) * signal_x(ss:ss+order-1);
end
signal_d_hat = (signal_d_hat-mean(signal_d_hat))/std(signal_d_hat);

% MSE Curve
figure
semilogy(1:Samples, error.^2,'-','color', [0.3010 0.7450 0.9330], "linewidth", 1, "markersize", 8);
title('LMS Behavior');
xlabel('Samples');
ylabel('MSE');
grid on;
saveas(gcf,'L3Q5_mu_50.png')

% Filter Response (Another method)
% https://www.mathworks.com/matlabcentral/answers/514720-how-to-use-freqz-to-plot-filter-frequency-response
%figure
%Samples = 5e3;
%fhz = 1e8;
%[h_filter, w_filter] = freqz(weights(:,ss+1).',1,Samples,fhz);
%[h_channel, w_channel] = freqz([1 1 1 1 1 1 1 1 1 1 1 1],1,Samples,fhz);
%[h_channel, w_channel] = freqz([1 1.6],[1],Samples,fhz);
%txt = ['Filter Response'];
%plot(w_filter,abs(h_filter),'-','color', [0.3010 0.7450 0.9330], "linewidth", 2, "markersize", 8, "DisplayName", txt);
%hold on;
%txt = ['System Response'];
%plot(w_channel,abs(h_channel),'-','color', [0.4660 0.6740 0.1880], "linewidth", 2, "markersize", 8, "DisplayName", txt);
%hold off;
%legend_copy = legend("location", "southwest");
%set (legend_copy, "fontsize", 12);
%grid on;
%set(gca,'XScale','log')
%set(gca,'YScale','log')
%title('Filter Response')
%xlabel('Frequency (Hz)')
%ylabel('Filter Response')
%saveas(gcf,'L3Q5_filter_response.png')

%% Filter Response
%https://www.mathworks.com/help/signal/ug/frequency-response.html#:~:text=To%20convert%20normalized%20frequency%20back,by%20half%20the%20sample%20frequency.&text=freqz%20can%20also%20accept%20a,(b%2Ca%2Cw)%3B
[Hf,wf] = freqz(weights(:,ss + 1).',1,'whole',512);
[Hc,wc] = freqz([1 1 1 1 1 1 1 1 1 1 1 1],1,'whole',512);
txt = ['Unknown System'];
plot(wc/pi,20*log10(abs(Hc)),'-','color', [0.3010 0.7450 0.9330], "linewidth", 1, "markersize", 8, "DisplayName", txt);
hold on;
txt = ['Filter Response'];
plot(wf/pi,20*log10(abs(Hf)),'-','color', [0.4660 0.6740 0.1880], "linewidth", 1, "markersize", 8, "DisplayName", txt);
title('System Identification with LMS')
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')
grid on;
legend_copy = legend("location", "southwest");
set (legend_copy, "fontsize", 6);
saveas(gcf,'L3Q5_filter_response.png')

%% Temporal Evolution
figure
txt = ['Original Signal'];
plot(1:Samples,signal_d,'-','color', [0.3010 0.7450 0.9330], "linewidth", 2, "markersize", 8, "DisplayName", txt);
hold on;
txt = ['Estimated Signal'];
plot(1:Samples,signal_d_hat,'-','color', [0.4660 0.6740 0.1880], "linewidth", 2, "markersize", 8, "DisplayName", txt);
title('Temporal Evolution');
xlabel('Samples');
xlim([0 250]);
ylabel('Magnitude');
grid on;
legend_copy = legend("location", "southwest");
set (legend_copy, "fontsize", 6);
saveas(gcf,'L3Q5_t.png')