%% Lista 3, Questao 5
clc;
close all;
clear all;

% Learning rate
mi = (0.01)/50;
% Filter order
% I first implemented thinking of python notation, later I found out that
% the reference book defines the order a bit different from what I usually
% work. So to make the code close to Diniz notation the 'order + 1' is
% needed.
order = 15 + 1;
% Number of samples
Samples = 1000;
% Defining the mse error and filter coeficients vectors.
error = zeros(Samples,1);
weights = zeros(order, Samples);

% Defining the energy of the noise vector.
SNR_dB = inf;
SNR_li = 10^(SNR_dB/10);
variance_noise = 1/SNR_li;
noise = sqrt(variance_noise/2).*randn(Samples,1);

% Generating the original signal.
signal_d = randn(Samples,1);

% Convolving the channel and the signal.
Hz = [1 1 1 1 1 1 1 1 1 1 1 1];
signal_x = filter(Hz,1,signal_d);

% Generating the noisy received signal.
signal_x = signal_x + noise;

% Since we have unitary variance then the covariance matrix is the same as
% the correlation matrix then the autocorrelation can be obtained as
% One-tap delay 
signal_x_1 = filter([0 1],1,signal_x);
Rx = cov(signal_x,signal_x_1);
misadjustment = (mi*trace(Rx))/(1 - mi*trace(Rx));

% To prevent the missmatch between the filtered signal and the desired
% signal. After some hours of debug I found out that the filtered signal
% was a shifted version of the desired signal.
signal_d = signal_d(order:end,1); 
for ss = 1:(Samples - order -1)
    % Error between the desired signal and the filtered signal.
    error(ss) = signal_d(ss) - weights(:,ss)' * signal_x(ss:ss+order-1); 
    % Recursive expression.
    weights(:,ss+1) = weights(:,ss) + 2 * mi * error(ss) * signal_x(ss:ss+order-1);
end
%weights = flip(weights); 

% MSE Curve
figure
semilogy(1:Samples, error.^2,'-','color', [0.3010 0.7450 0.9330], "linewidth", 2, "markersize", 8);
title('LMS Behavior');
xlabel('Samples');
ylabel('MSE');
grid on;
saveas(gcf,'L3Q5_mu_50.png')

% Filter Response
% https://www.mathworks.com/matlabcentral/answers/514720-how-to-use-freqz-to-plot-filter-frequency-response
figure
Samples = 5e3;
fhz = 1e8;
[h_filter, w_filter] = freqz(weights(:,ss+1).',1,Samples,fhz);
[h_channel, w_channel] = freqz([1 0 0 0 0 0 0 0 0 0 0 -1],1,Samples,fhz);
%[h_channel, w_channel] = freqz([1 1.6],[1],Samples,fhz);
txt = ['Filter Response'];
plot(w_filter,abs(h_filter),'-','color', [0.3010 0.7450 0.9330], "linewidth", 2, "markersize", 8, "DisplayName", txt);
hold on;
txt = ['System Response'];
plot(w_channel,abs(h_channel),'-','color', [0.4660 0.6740 0.1880], "linewidth", 2, "markersize", 8, "DisplayName", txt);
hold off;
legend_copy = legend("location", "southwest");
set (legend_copy, "fontsize", 12);
grid on;
set(gca,'XScale','log')
set(gca,'YScale','log')
title('Filter Response')
xlabel('Frequency (Hz)')
ylabel('Filter Response')
saveas(gcf,'L3Q5_filter_response.png')