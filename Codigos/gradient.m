%% Deterministic Gradient Algorithm
clc;
close all;
clear all;

mi = 0.1;
order = 2;
Samples = 1000;
iterations = 100;
error = zeros(iterations,1);
weights = zeros(order,iterations);
weights = complex(weights,0);

% SNR_dB = inf;
% SNR_li = 10^(SNR_dB/10);
% var_noise = 1/SNR_li;
% signal_d = randn(Samples,1) + 1j*randn(Samples,1);
% noise = sqrt(var_noise/2).*(randn(Samples,1) + 1j*randn(Samples,1));
% signal_x = signal_d + noise;

p = [1; 0;];
Rx = [3.56, 1.60; 1.60, 3.56;];
wopt = inv(Rx)*p;
error(1) = (sum((wopt - weights(:,1)).^2))/length(wopt);
for ii = 2:iterations
    weights(:,ii) = weights(:,ii - 1) - 2*mi*(Rx*weights(:,ii - 1) - p);
    error(ii,1) = (sum((wopt - weights(:,ii)).^2))/length(wopt);
end

% MSE Curve
figure
semilogy(1:iterations, error,'-','color', [0.3010 0.7450 0.9330], "linewidth", 3, "markersize", 8);
title('Deterministic Gradient Algorithm Behavior');
xlabel('Iterations');
ylabel('MSE');
grid on;
saveas(gcf,'gradient_mse.png')