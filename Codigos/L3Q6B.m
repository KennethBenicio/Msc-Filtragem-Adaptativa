clc;
close all;
clear all;

% Learning rate
mi = 1e-3;
% Filter order
order = 15 + 1;

%% Generating Transmisssion Phase Data
% If we want to evaluate the impact of the training size then we should
% apply the same transmitted sequence to all the cases
% Number of samples
Samples = 5000 + 50;
% Defining the energy of the noise vector.
SNR = 30;
QAM = 16;
signal_d = randi([0,QAM - 1],[Samples 1]); 
signal_d = qammod(signal_d,QAM);
% Convolving the channel and the signal.
Hz = [0.5 1.2 1.5 -1];
signal_x = filter(Hz,1,signal_d);
% Transmision noie
snr = 10^(SNR/10);
energy_symbol = mean(abs(signal_x(:)).^2); % Energy symbol pilot. 
var_noise = energy_symbol .*  1/snr; % Variance of the noise.
noise = sqrt(var_noise/2) * (randn(Samples,1) + 1i*randn(Samples,1));
% Generating the noisy received signal.
signal_x = signal_x + noise;

%% Training with 50 Samples

% Training Phase

% Number of samples
Samples = 50;

% Defining the mse error and filter coeficients vectors.
error = zeros(Samples,1);
weights = zeros(order, Samples);

% Defining the energy of the noise vector.
QAM_train = 4;
signal_d_train = randi([0,QAM_train - 1],[Samples 1]);
signal_d_train = (1/sqrt(2)) * qammod(signal_d_train,QAM_train); 

% Convolving the channel and the signal.
Hz = [0.5 1.2 1.5 -1];
signal_x_train = filter(Hz,1,signal_d_train);

% Training noise
snr = 10^(inf/10);
energy_symbol = mean(abs(signal_x_train(:)).^2); % Energy symbol pilot. 
var_noise = energy_symbol .*  1/snr; % Variance of the noise.
noise = sqrt(var_noise/2) * (randn(Samples,1) + 1i*randn(Samples,1));

% Generating the noisy received signal.
signal_x_train = signal_x_train + noise;
% LMS algorithm
for s = order:Samples
    aux = signal_x_train(s:-1:s-order+1);
    error(s) = signal_d_train(s-order+1) - weights(:,s)'*aux;
    % Recursive expression.
    weights(:,s+1) = weights(:,s) + 2 * mi * conj(error(s)) * aux;
end

% Transmission Phase

% Defining the mse error and filter coeficients vectors.
Samples = 5000 + 50;
error = zeros(Samples,1);
aux = weights(:,s+1);
weights = zeros(order, Samples);
weights(:,order) = aux;

signal_d_hat_50 = zeros(size(signal_d));
% LMS algorithm
for s = order:Samples
    aux = signal_x(s:-1:s-order+1);
    % Filtering the signal
    signal_d_hat_50(s-order+1) = weights(:,s)'*aux;
    % The equalizer does not know the original signal
    error(s) = qammod(qamdemod(signal_x(s-order+1),QAM),QAM) - weights(:,s)'*aux;
    % Recursive expression.
    weights(:,s+1) = weights(:,s) + 2 * mi * conj(error(s)) * aux;
end

%% Training with 150 Samples

% Training Phase

% Number of samples
Samples = 150;

% Defining the mse error and filter coeficients vectors.
error = zeros(Samples,1);
weights = zeros(order, Samples);

% Defining the energy of the noise vector.
QAM_train = 4;
signal_d_train = randi([0,QAM_train - 1],[Samples 1]);
signal_d_train = (1/sqrt(2)) * qammod(signal_d_train,QAM_train); 

% Convolving the channel and the signal.
Hz = [0.5 1.2 1.5 -1];
signal_x_train = filter(Hz,1,signal_d_train);

% Training noise
snr = 10^(inf/10);
energy_symbol = mean(abs(signal_x_train(:)).^2); % Energy symbol pilot. 
var_noise = energy_symbol .*  1/snr; % Variance of the noise.
noise = sqrt(var_noise/2) * (randn(Samples,1) + 1i*randn(Samples,1));

% Generating the noisy received signal.
signal_x_train = signal_x_train + noise;
% LMS algorithm
for s = order:Samples
    aux = signal_x_train(s:-1:s-order+1);
    error(s) = signal_d_train(s-order+1) - weights(:,s)'*aux;
    % Recursive expression.
    weights(:,s+1) = weights(:,s) + 2 * mi * conj(error(s)) * aux;
end

% Transmission Phase

% Defining the mse error and filter coeficients vectors.
Samples = 5000 + 50;
error = zeros(Samples,1);
aux = weights(:,s+1);
weights = zeros(order, Samples);
weights(:,order) = aux;

signal_d_hat_150 = zeros(size(signal_d));
% LMS algorithm
for s = order:Samples
    aux = signal_x(s:-1:s-order+1);
    % Filtering the signal
    signal_d_hat_150(s-order+1) = weights(:,s)'*aux;
    % The equalizer does not know the original signal
    error(s) = qammod(qamdemod(signal_x(s-order+1),QAM),QAM) - weights(:,s)'*aux;
    % Recursive expression.
    weights(:,s+1) = weights(:,s) + 2 * mi * conj(error(s)) * aux;
end

%% Training with 300 Samples

% Training Phase

% Number of samples
Samples = 300;

% Defining the mse error and filter coeficients vectors.
error = zeros(Samples,1);
weights = zeros(order, Samples);

% Defining the energy of the noise vector.
QAM_train = 4;
signal_d_train = randi([0,QAM_train - 1],[Samples 1]);
signal_d_train = (1/sqrt(2)) * qammod(signal_d_train,QAM_train); 

% Convolving the channel and the signal.
Hz = [0.5 1.2 1.5 -1];
signal_x_train = filter(Hz,1,signal_d_train);

% Training noise
snr = 10^(inf/10);
energy_symbol = mean(abs(signal_x_train(:)).^2); % Energy symbol pilot. 
var_noise = energy_symbol .*  1/snr; % Variance of the noise.
noise = sqrt(var_noise/2) * (randn(Samples,1) + 1i*randn(Samples,1));

% Generating the noisy received signal.
signal_x_train = signal_x_train + noise;
% LMS algorithm
for s = order:Samples
    aux = signal_x_train(s:-1:s-order+1);
    error(s) = signal_d_train(s-order+1) - weights(:,s)'*aux;
    % Recursive expression.
    weights(:,s+1) = weights(:,s) + 2 * mi * conj(error(s)) * aux;
end

% Transmission Phase

% Defining the mse error and filter coeficients vectors.
Samples = 5000 + 50;
error = zeros(Samples,1);
aux = weights(:,s+1);
weights = zeros(order, Samples);
weights(:,order) = aux;

signal_d_hat_300 = zeros(size(signal_d));
% LMS algorithm
for s = order:Samples
    aux = signal_x(s:-1:s-order+1);
    % Filtering the signal
    signal_d_hat_300(s-order+1) = weights(:,s)'*aux;
    % The equalizer does not know the original signal
    error(s) = qammod(qamdemod(signal_x(s-order+1),QAM),QAM) - weights(:,s)'*aux;
    % Recursive expression.
    weights(:,s+1) = weights(:,s) + 2 * mi * conj(error(s)) * aux;
end

%% Training with 500 Samples

% Training Phase

% Number of samples
Samples = 500;

% Defining the mse error and filter coeficients vectors.
error = zeros(Samples,1);
weights = zeros(order, Samples);

% Defining the energy of the noise vector.
QAM_train = 4;
signal_d_train = randi([0,QAM_train - 1],[Samples 1]);
signal_d_train = qammod(signal_d_train,QAM_train); 

% Convolving the channel and the signal.
Hz = [0.5 1.2 1.5 -1];
signal_x_train = filter(Hz,1,signal_d_train);

% Training noise
snr = 10^(inf/10);
energy_symbol = mean(abs(signal_x_train(:)).^2); % Energy symbol pilot. 
var_noise = energy_symbol .*  1/snr; % Variance of the noise.
noise = sqrt(var_noise/2) * (randn(Samples,1) + 1i*randn(Samples,1));

% Generating the noisy received signal.
signal_x_train = signal_x_train + noise;
% LMS algorithm
for s = order:Samples
    aux = signal_x_train(s:-1:s-order+1);
    error(s) = signal_d_train(s-order+1) - weights(:,s)'*aux;
    % Recursive expression.
    weights(:,s+1) = weights(:,s) + 2 * mi * conj(error(s)) * aux;
end

% Transmission Phase

% Defining the mse error and filter coeficients vectors.
Samples = 5000 + 50;
error = zeros(Samples,1);
aux = weights(:,s+1);
weights = zeros(order, Samples);
weights(:,order) = aux;

signal_d_hat_500 = zeros(size(signal_d));
% LMS algorithm
for s = order:Samples
    aux = signal_x(s:-1:s-order+1);
    % Filtering the signal
    signal_d_hat_500(s-order+1) = weights(:,s)'*aux;
    % The equalizer does not know the original signal
    error(s) = qammod(qamdemod(signal_x(s-order+1),QAM),QAM) - weights(:,s)'*aux;
    % Recursive expression.
    weights(:,s+1) = weights(:,s) + 2 * mi * conj(error(s)) * aux;
end

%% Temporal Evolution 
range_of_sampling = 4900:5000;
[~,~,delay] = alignsignals(qamdemod(signal_d,QAM),qamdemod(signal_d_hat_500,QAM));

aux = qamdemod(signal_d_hat_50,QAM);
aux = circshift(aux,delay);
aux_50 = aux(range_of_sampling);

aux = qamdemod(signal_d_hat_150,QAM);
aux = circshift(aux,delay);
aux_150 = aux(range_of_sampling);

aux = qamdemod(signal_d_hat_300,QAM);
aux = circshift(aux,delay);
aux_300 = aux(range_of_sampling);

aux = qamdemod(signal_d_hat_500,QAM);
aux = circshift(aux,delay);
aux_500 = aux(range_of_sampling);

figure
subplot(221)
txt = ['Original Signal'];
stem(range_of_sampling, qamdemod(signal_d(range_of_sampling),QAM),'-','color', [0.3010 0.7450 0.9330], "linewidth", 1, "markersize", 3, "DisplayName", txt);
hold on;
txt = ['Estimated Signal'];
stem(range_of_sampling, aux_50,'-','color', [0.4660 0.6740 0.1880], "linewidth", 1, "markersize", 3, "DisplayName", txt);
hold off;
title('50 Training Samples');
xlabel('Sample');
xlim([min(range_of_sampling) max(range_of_sampling)]);
ylabel('Magnitude');
legend_copy = legend("location", "southwest");
set (legend_copy, "fontsize", 6);
grid on;
subplot(222)
txt = ['Original Signal'];
stem(range_of_sampling, qamdemod(signal_d(range_of_sampling),QAM),'-','color', [0.3010 0.7450 0.9330], "linewidth", 1, "markersize", 3, "DisplayName", txt);
hold on;
txt = ['Estimated Signal'];
stem(range_of_sampling, aux_150,'-','color', [0.4660 0.6740 0.1880], "linewidth", 1, "markersize", 3, "DisplayName", txt);
hold off;
title('150 Training Samples');
xlabel('Sample');
xlim([min(range_of_sampling) max(range_of_sampling)]);
ylabel('Magnitude');
legend_copy = legend("location", "southwest");
set (legend_copy, "fontsize", 6);
grid on;
subplot(223)
txt = ['Original Signal'];
stem(range_of_sampling, qamdemod(signal_d(range_of_sampling),QAM),'-','color', [0.3010 0.7450 0.9330], "linewidth", 1, "markersize", 3, "DisplayName", txt);
hold on;
txt = ['Estimated Signal'];
stem(range_of_sampling, aux_300,'-','color', [0.4660 0.6740 0.1880], "linewidth", 1, "markersize", 3, "DisplayName", txt);
hold off;
title('300 Training Samples');
xlabel('Sample');
xlim([min(range_of_sampling) max(range_of_sampling)]);
ylabel('Magnitude');
legend_copy = legend("location", "southwest");
set (legend_copy, "fontsize", 6);
grid on;
subplot(224)
txt = ['Original Signal'];
stem(range_of_sampling, qamdemod(signal_d(range_of_sampling),QAM),'-','color', [0.3010 0.7450 0.9330], "linewidth", 1, "markersize", 3, "DisplayName", txt);
hold on;
txt = ['Estimated Signal'];
stem(range_of_sampling, aux_500,'-','color', [0.4660 0.6740 0.1880], "linewidth", 1, "markersize", 3, "DisplayName", txt);
hold off;
title('500 Training Samples');
xlabel('Sample');
xlim([min(range_of_sampling) max(range_of_sampling)]);
ylabel('Magnitude');
legend_copy = legend("location", "southwest");
set (legend_copy, "fontsize", 6);
grid on;
saveas(gcf,'L3Q6_B_t.png')