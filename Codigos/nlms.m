%% NLMS Filter Implementation
clc;
close all;
clear all;

mi = 1e-1;
order = 30;
Samples = 1000;
error = zeros(Samples,1);
weights = zeros(order, Samples);

% Effectively is as there is no noise in the system.
SNR_dB = inf;
SNR_li = 10^(SNR_dB/10);
var_noise = 1/SNR_li;

signal_d = randn(Samples,1);
noise = sqrt(var_noise/2).*randn(Samples,1);
signal_x = signal_d + noise;

% Channel
Hz = [1 1.6];
signal_x = filter(Hz,1,signal_x);
Hz = [1 1];
signal_d = filter(Hz,1,signal_d);

for ss = 1:(Samples - order - 1)
    mi_normalized = mi/(norm(signal_x));
    error(ss) = signal_d(ss) - weights(:,ss)' * signal_x(ss:ss+order-1); 
    weights(:,ss+1) = weights(:,ss) +  mi_normalized * error(ss) * signal_x(ss:ss+order-1);
end

figure
semilogy(1:Samples, error.^2,'-','color', [0.3010 0.7450 0.9330], "linewidth", 1, "markersize", 8);
title('LMS Behavior');
xlabel('Samples');
ylabel('MSE');
grid on;
saveas(gcf,'nlms_mse.png')