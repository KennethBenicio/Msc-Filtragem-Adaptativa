%% RLS Filter Implementation
clc;
close all;
clear all;


% Forgeting rate
lambda = 0.9;
% Filter order
order = 3;
% SNR (dB) 
SNR_dB = inf;


% Number of samples
Samples = 1010;
% Defining the mse error and filter coeficients vectors.
error = zeros(Samples,1);
weights = zeros(order, Samples);
% Defining the energy of the noise vector.
SNR_li = 10^(SNR_dB/10);
variance_noise = 1/SNR_li;
noise = sqrt(variance_noise/2).*randn(Samples,1);
% Generating the sinoide signal.
t = linspace(-pi,pi,Samples).';
signal_d = sin(2*pi*t);
% Generating the noisy received signal.
signal_x = signal_d + noise;
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

% Coefficients Curve
figure
subplot(2,1,1)
txt = ['w0'];
plot(1:Samples, weights(1,:),'-','color', [0.3010 0.7450 0.9330], "linewidth", 2, "markersize", 8, "DisplayName",txt);
hold on;
txt = ['w1'];
plot(1:Samples, weights(2,:),'-','color', [0.4660 0.6740 0.1880], "linewidth", 2, "markersize", 8, "DisplayName",txt);
hold off;
title('RLS Coefficients Behavior');
xlabel('Samples');
xlim([0 1000]);
ylabel('Magnitude');
legend_copy = legend("location", "northeast");
set (legend_copy, "fontsize", 8);
grid on;

% MSE Curve
subplot(2,1,2)
semilogy(1:Samples, error.^2,'-','color', [0.3010 0.7450 0.9330], "linewidth", 1, "markersize", 8);
title('RLS Behavior');
xlabel('Samples');
xlim([0 1000]);
ylabel('MSE');
grid on;
%order_snr_forgeting
saveas(gcf,'L4Q3_rls_mse_3_inf_9.png')