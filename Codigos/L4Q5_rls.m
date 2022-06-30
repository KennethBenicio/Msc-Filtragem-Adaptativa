clc;
close all;
clear all;

%% Training Stage  
% Forgeting rate
lambda = 0.9;
% Filter order
order = 15;
% Number of samples
Samples = 50;
% Defining the mse error and filter coeficients vectors.
error = zeros(Samples,1);
weights = zeros(order, Samples);

% Defining the energy of the noise vector.
SNR = 30;
QAM_train = 4;
signal_d_train = randi([0,QAM_train - 1],[Samples 1]); % The same pilot for every pilot frame and block.
signal_d_train = (1/sqrt(2)) * qammod(signal_d_train,QAM_train); % 4-QAM Pilot Signal.

% Convolving the channel and the signal.
Hz = [0.5 1.2 1.5 -1];
signal_x_train = filter(Hz,1,signal_d_train);

% Training noise
snr = 10^(SNR/10);
energy_symbol = mean(abs(signal_x_train(:)).^2); % Energy symbol pilot. 
var_noise = energy_symbol .*  1/snr; % Variance of the noise.
noise = sqrt(var_noise/2) * (randn(Samples,1) + 1i*randn(Samples,1));

% Generating the noisy received signal.
signal_x_train = signal_x_train + noise;
% Defining delta by the inverse of the signal energy
delta  = 1/(sum(signal_x_train.^2)/length(signal_x_train));

% Deterministic correlation matrix initialization
Rd = delta*eye(order); 
signal_d_train = signal_d_train(order:end,1); 
for ss = 2:(Samples - order - 1)
    % Deterministic correlation matrix inverse
    Rd = (1/lambda)*(Rd - (Rd*signal_x_train(ss:ss+order-1)*signal_x_train(ss:ss+order-1)'*Rd)/(lambda + signal_x_train(ss:ss+order-1)'*Rd*signal_x_train(ss:ss+order-1)));
    % Error between the desired signal and the filtered signal.
    error(ss) = signal_d_train(ss) - weights(:,ss-1)' * signal_x_train(ss:ss+order-1); 
    % Recursive expression.
    weights(:,ss) = weights(:,ss-1) + Rd*conj(error(ss))*signal_x_train(ss:ss+order-1);
end

%% Transmission Stage 
% Number of samples
Samples = 500;
% Defining the mse error and filter coeficients vectors.
error = zeros(Samples,1);
weights = zeros(order, Samples);

% Defining the energy of the noise vector.
SNR = 30;
QAM = 16;
signal_d = randi([0,QAM - 1],[Samples 1]); % The same pilot for every pilot frame and block.
signal_d = (1/sqrt(2)) * qammod(signal_d,QAM); % 4-QAM Pilot Signal.

% Convolving the channel and the signal.
Hz = [0.5 1.2 1.5 -1];
signal_x = filter(Hz,1,signal_d);

% Training noise
snr = 10^(SNR/10);
energy_symbol = mean(abs(signal_x(:)).^2); % Energy symbol pilot. 
var_noise = energy_symbol .*  1/snr; % Variance of the noise.
noise = sqrt(var_noise/2) * (randn(Samples,1) + 1i*randn(Samples,1));

% Generating the noisy received signal.
signal_x = signal_x + noise;
% Defining delta by the inverse of the signal energy
delta  = 1/(sum(signal_x.^2)/length(signal_x));

% Deterministic correlation matrix initialization
Rd = delta*eye(order); 
signal_d_hat = zeros(size(signal_d));
for ss = 2:(Samples - order - 1)
    % Deterministic correlation matrix inverse
    Rd = (1/lambda)*(Rd - (Rd*signal_x(ss:ss+order-1)*signal_x(ss:ss+order-1)'*Rd)/(lambda + signal_x(ss:ss+order-1)'*Rd*signal_x(ss:ss+order-1)));
    signal_d_hat(ss) = weights(:,ss-1)' * signal_x(ss:ss+order-1);
    % Error between the desired signal and the filtered signal.
    error(ss) = signal_d(ss) - weights(:,ss-1)' * signal_x(ss:ss+order-1); 
    % Recursive expression.
    weights(:,ss) = weights(:,ss-1) + Rd*conj(error(ss))*signal_x(ss:ss+order-1);
end

%% MSE Curve
figure
semilogy(1:Samples, abs(error).^2,'-','color', [0.3010 0.7450 0.9330], "linewidth", 1, "markersize", 8);
title('RLS Behavior');
xlabel('Samples');
ylabel('MSE');
grid on;
saveas(gcf,'L4Q5_rls_9.png')

%% Temporal Evolution
% https://www.mathworks.com/help/comm/gs/examine-16-qam-using-matlab.html
figure
subplot(221)
plot(signal_d_train,'.','color', [0.3010 0.7450 0.9330],"markersize", 3)
title('Training Signal');
xlabel('In Phase');
ylabel('Quadrature');
grid on;
subplot(222)
plot(signal_d,'.','color', [0.3010 0.7450 0.9330],"markersize", 3)
title('Original Signal');
xlabel('In Phase');
ylabel('Quadrature');
grid on;
subplot(223)
plot(signal_x,'.','color', [0.3010 0.7450 0.9330],"markersize", 3)
title('Transmitted Signal');
xlabel('In Phase');
ylabel('Quadrature');
grid on;
subplot(224)
plot(signal_d_hat,'.','color', [0.3010 0.7450 0.9330],"markersize", 3)
title('Filtered Signal');
xlabel('In Phase');
ylabel('Quadrature');
grid on;
%saveas(gcf,'L4Q5_rls_t.png')