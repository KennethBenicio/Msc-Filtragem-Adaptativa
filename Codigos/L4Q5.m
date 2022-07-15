clc;
close all;
clear all;

%% RLS algorithm

%% Training Stage  

% Forgeting rate
lambda = 0.999;
% Filter order
order = 15 + 1;
% Number of samples
Samples = 500;
% Defining the mse error and filter coeficients vectors
error = zeros(Samples,1);
weights = zeros(order, Samples);

% Defining the energy of the noise vector
SNR = inf;
QAM_train = 4;
signal_d_train = randi([0,QAM_train - 1],[Samples 1]); 
signal_d_train = qammod(signal_d_train,QAM_train); 

% Convolving the channel and the signal
Hz = [0.5 1.2 1.5 -1];
signal_x_train = filtfilt(Hz,1,signal_d_train);

% Training noise
snr = 10^(SNR/10);
energy_symbol = mean(abs(signal_x_train(:)).^2); 
var_noise = energy_symbol .*  1/snr; 
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
Samples = 5000 + 50;
% Defining the mse error and filter coeficients vectors
error = zeros(Samples,1);
weights = zeros(order, Samples);

% Defining the energy of the noise vector
SNR = 30;
QAM = 16;
signal_d = randi([0,QAM - 1],[Samples 1]);
signal_d = qammod(signal_d,QAM);

% Convolving the channel and the signal
Hz = [0.5 1.2 1.5 -1];
signal_x = filtfilt(Hz,1,signal_d);

% Transmision noise
snr = 10^(SNR/10);
energy_symbol = mean(abs(signal_x(:)).^2); 
var_noise = energy_symbol .*  1/snr;
noise = sqrt(var_noise/2) * (randn(Samples,1) + 1i*randn(Samples,1));

% Generating the noisy received signal
signal_x = signal_x + noise;

% Defining delta by the inverse of the signal energy
delta  = 1/(sum(signal_x.^2)/length(signal_x));

% Deterministic correlation matrix initialization
Rd = delta*eye(order); 
signal_d_hat = zeros(size(signal_d));
% RLS algorithm
for ss = 2:(Samples - order - 1)
    % Deterministic correlation matrix inverse
    Rd = (1/lambda)*(Rd - (Rd*signal_x(ss:ss+order-1)*signal_x(ss:ss+order-1)'*Rd)/(lambda + signal_x(ss:ss+order-1)'*Rd*signal_x(ss:ss+order-1)));
    signal_d_hat(ss) = weights(:,ss-1)' * signal_x(ss:ss+order-1);
    % Error between the desired signal and the filtered signal.
    error(ss) = qammod(qamdemod(signal_x(ss),QAM),QAM) - weights(:,ss-1)' * signal_x(ss:ss+order-1); 
    % Recursive expression.
    weights(:,ss) = weights(:,ss-1) + Rd*conj(error(ss))*signal_x(ss:ss+order-1);
end
weights_rls = weights(:,Samples-order-1);

%% MSE Curve
figure
semilogy(1:500, abs(error(1:500)).^2,'-','color', [0.3010 0.7450 0.9330], "linewidth", 1, "markersize", 8);
title('RLS Behavior');
xlabel('Samples');
ylabel('MSE');
grid on;
saveas(gcf,'L4Q5_rls_999.png')

%% Temporal Evolution
aux = qamdemod(signal_d_hat,QAM);
aux1 = aux(1:100);
aux2 = aux(4900:5000);

figure
subplot(211)
txt = ['Original Signal'];
stem(1:100, qamdemod(signal_d(1:100),QAM),'-','color', [0.3010 0.7450 0.9330], "linewidth", 1, "markersize", 3, "DisplayName", txt);
hold on;
txt = ['Estimated Signal'];
stem(1:100, aux1,'-','color', [0.4660 0.6740 0.1880], "linewidth", 1, "markersize", 3, "DisplayName", txt);
hold off;
title('Temporal Evolution of First Samples');
xlabel('Sample');
ylabel('Magnitude');
legend_copy = legend("location", "southwest");
set (legend_copy, "fontsize", 6);
grid on;
subplot(212)
txt = ['Original Signal'];
stem(4900:5000, qamdemod(signal_d(4900:5000),QAM),'-','color', [0.3010 0.7450 0.9330], "linewidth", 1, "markersize", 3, "DisplayName", txt);
hold on;
txt = ['Estimated Signal'];
stem(4900:5000, aux2,'-','color', [0.4660 0.6740 0.1880], "linewidth", 1, "markersize", 3, "DisplayName", txt);
hold off;
title('Temporal Evolution of Last Samples');
xlabel('Sample');
ylabel('Magnitude');
legend_copy = legend("location", "southwest");
set (legend_copy, "fontsize", 6);
grid on;
saveas(gcf,'L4Q5_rls_t.png')

%% LMS algorithm 

%% Training Stage  
% Learning rate
mi = 1e-3;
% Filter order
order = 15 + 1;
% Number of samples
Samples = 500;
% Defining the mse error and filter coeficients vectors.
error = zeros(Samples,1);
weights = zeros(order, Samples);

% Defining the energy of the noise vector.
SNR = inf;
QAM_train = 4;
signal_d_train = randi([0,QAM_train - 1],[Samples 1]);
signal_d_train = qammod(signal_d_train,QAM_train);

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

for s = order:Samples
    aux = signal_x_train(s:-1:s-order+1);
    error(s) = signal_d_train(s-order+1) - weights(:,s)'*aux;
    % Recursive expression.
    weights(:,s+1) = weights(:,s) + 2 * mi * conj(error(s)) * aux;
end

%% Transmission Stage 
% Number of samples
Samples = 5000;
% Defining the mse error and filter coeficients vectors.
error = zeros(Samples,1);
weights = zeros(order, Samples);

% Defining the energy of the noise vector.
SNR = 30;
QAM = 16;
signal_d = randi([0,QAM - 1],[Samples 1]); 
signal_d = qammod(signal_d,QAM);

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

signal_d_hat = zeros(size(signal_d));
for s = order:Samples
    aux = signal_x(s:-1:s-order+1);
    signal_d_hat(s-order+1) = weights(:,s)'*aux;
    error(s) = qammod(qamdemod(signal_x(s-order+1),QAM),QAM) - weights(:,s)'*aux;
    % Recursive expression.
    weights(:,s+1) = weights(:,s) + 2 * mi * conj(error(s)) * aux;
end
weights_lms = weights(:,s + 1);

%% MSE Curve
figure
semilogy(1:500, abs(error(1:500)).^2,'-','color', [0.3010 0.7450 0.9330], "linewidth", 1, "markersize", 8);
title('LMS Behavior');
xlabel('Samples');
ylabel('MSE');
grid on;
saveas(gcf,'L4Q5_lms.png')

%% Filter Response
%https://www.mathworks.com/help/signal/ug/frequency-response.html#:~:text=To%20convert%20normalized%20frequency%20back,by%20half%20the%20sample%20frequency.&text=freqz%20can%20also%20accept%20a,(b%2Ca%2Cw)%3B
figure
[Hlms,wlms] = freqz(weights_lms.',1,'whole',512);
[Hrls,wrls] = freqz(weights_rls.',1,'whole',512);
[Hc,wc] = freqz([0.5 1.2 1.5 -1],1,'whole',512);
txt = ['Unknown System'];
plot(wc/pi,20*log10(abs(Hc)),'-','color', [0.3010 0.7450 0.9330], "linewidth", 1, "markersize", 8, "DisplayName", txt);
hold on;
txt = ['LMS Filter Response'];
plot(wlms/pi,20*log10(abs(Hlms)),'-','color', [0.4660 0.6740 0.1880], "linewidth", 1, "markersize", 8, "DisplayName", txt);
hold on;
txt = ['RLS Filter Response'];
plot(wrls/pi,20*log10(abs(Hrls)),'-','color', [0 0.4470 0.7410], "linewidth", 1, "markersize", 8, "DisplayName", txt);
hold off;
title('System Identification with RLS and LMS')
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')
grid on;
legend_copy = legend("location", "southwest");
set (legend_copy, "fontsize", 6);
saveas(gcf,'L4Q5_filter_response.png')