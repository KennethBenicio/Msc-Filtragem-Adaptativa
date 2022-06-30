%% RLS Filter Implementation
clc;
close all;
clear all;

% Forgeting rate
lambda = 0.9;
% Filter order
order = 15;
% Number of samples
Samples = 500;
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
Hz = [0.5 1.2 1.5 -1];
signal_x = filter(Hz,1,signal_d);
% Generating the noisy received signal.
signal_x = signal_x + noise;
% Defining delta by the inverse of the signal energy
delta  = 1/(sum(signal_x.^2)/length(signal_x));

% Deterministic correlation matrix initialization
Rd = delta*eye(order); 
signal_d = signal_d(order:end,1); 
for ss = 2:(Samples - order - 1)
    % Deterministic correlation matrix inverse
    Rd = (1/lambda)*(Rd - (Rd*signal_x(ss:ss+order-1)*signal_x(ss:ss+order-1)'*Rd)/(lambda + signal_x(ss:ss+order-1)'*Rd*signal_x(ss:ss+order-1)));
    % Error between the desired signal and the filtered signal.
    error(ss) = signal_d(ss) - weights(:,ss-1)' * signal_x(ss:ss+order-1); 
    % Recursive expression.
    weights(:,ss) = weights(:,ss-1) + Rd*error(ss)*signal_x(ss:ss+order-1);
end
weights = flip(weights); 

% MSE Curve
figure
semilogy(1:Samples, error.^2,'-','color', [0.3010 0.7450 0.9330], "linewidth", 1, "markersize", 8);
title('RLS Behavior');
xlabel('Samples');
ylabel('MSE');
grid on;
saveas(gcf,'L4Q5_rls_mse_9.png')