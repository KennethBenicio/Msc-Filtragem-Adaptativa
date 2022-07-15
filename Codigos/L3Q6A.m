clc;
close all;
clear all;

%% Training Phase
% Learning rate
mi = 0.4;
gamma = 1e-3;
% I first implemented thinking of python notation, later I found out that
% the reference book defines the order a bit different from what I usually
% work. So to make the code close to Diniz notation the 'order + 1' is
% needed.
order = 15 + 1;
% Number of samples
Samples = 500;
% Defining the mse error and filter coeficients vectors.
error = zeros(Samples,1);
weights = zeros(order, Samples);

% Defining the energy of the noise vector.
SNR = inf;
QAM_train = 4;
signal_d_train = randi([0,QAM_train - 1],[Samples 1]); % The same pilot for every pilot frame and block.
signal_d_train = qammod(signal_d_train,QAM_train); % 4-QAM Pilot Signal.

% Convolving the channel and the signal.It is necesssary to sincronize the signal.
%https://www.mathworks.com/help/signal/ref/filtfilt.html
Hz = [0.5 1.2 1.5 -1];
signal_x_train = filtfilt(Hz,1,signal_d_train);

% Training noise
snr = 10^(SNR/10);
energy_symbol = mean(abs(signal_x_train(:)).^2); % Energy symbol pilot. 
var_noise = energy_symbol .*  1/snr; % Variance of the noise.
noise = sqrt(var_noise/2) * (randn(Samples,1) + 1i*randn(Samples,1));

% Generating the noisy received signal.
signal_x_train = signal_x_train + noise;
% NLMS algorithm
for s = order:Samples
    aux = signal_x_train(s:-1:s-order+1);
    mi_normalized = mi/(gamma + norm(aux)^2);
    error(s) = signal_d_train(s-order+1) - weights(:,s)'*aux;
    % Recursive expression.
    weights(:,s+1) = weights(:,s) + mi_normalized * conj(error(s)) * aux;
end

%% Transmission Phase
% Number of samples
Samples = 5000 + order;
% Defining the mse error and filter coeficients vectors.
aux = weights(:,s+1);
error = zeros(Samples,1);
weights = zeros(order, Samples);
weights(:,order) = aux;

% Defining the energy of the noise vector.
SNR = 30;
QAM = 16;
signal_d = randi([0,QAM - 1],[Samples 1]); % The same pilot for every pilot frame and block.
signal_d = qammod(signal_d,QAM); % 4-QAM Pilot Signal.

% Convolving the channel and the signal. 
signal_x = filtfilt(Hz,1,signal_d);

% Transmission noise
snr = 10^(SNR/10);
energy_symbol = mean(abs(signal_x(:)).^2); % Energy symbol pilot. 
var_noise = energy_symbol .*  1/snr; % Variance of the noise.
noise = sqrt(var_noise/2) * (randn(Samples,1) + 1i*randn(Samples,1));

% Generating the noisy received signal.
signal_x = signal_x + noise;
signal_d_hat = zeros(size(signal_d));
% NLMS algorithm
for s = order:Samples
    aux = signal_x(s:-1:s-order+1);
    mi_normalized = mi/(gamma + norm(aux)^2);
    % Filtering the signal
    signal_d_hat(s-order+1) = weights(:,s)'*aux;
    % The equalizer does know the original signal
    %error(s) = signal_d(s-order+1) - weights(:,s)'*aux;
    % The equalizer does not know the original signal
    error(s) = qammod(qamdemod(signal_x(s-order+1),QAM),QAM) - weights(:,s)'*aux;
    % Recursive expression.
    weights(:,s+1) = weights(:,s) + mi_normalized * conj(error(s)) * aux;
end

%% MSE Curve
figure
semilogy(1:Samples, abs(error).^2,'-','color', [0.3010 0.7450 0.9330], "linewidth", 1, "markersize", 8);
title('NLMS Behavior');
xlabel('Samples');
xlim([0 5000]);
ylabel('MSE');
grid on;
saveas(gcf,'L3Q6_A_mse.png')

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
saveas(gcf,'L3Q6_A_t.png')

%% Constellation
% https://www.mathworks.com/help/comm/gs/examine-16-qam-using-matlab.html
figure
subplot(221)
plot(signal_d_train,'.','color', [0.3010 0.7450 0.9330],"markersize", 8)
title('Training Signal');
xlabel('In Phase');
ylabel('Quadrature');
grid on;
subplot(222)
plot(signal_d,'.','color', [0.3010 0.7450 0.9330],"markersize", 8)
title('Original Signal');
xlabel('In Phase');
ylabel('Quadrature');
grid on;
subplot(223)
plot(signal_x,'.','color', [0.3010 0.7450 0.9330],"markersize", 8)
title('Transmitted Signal');
xlabel('In Phase');
ylabel('Quadrature');
grid on;
subplot(224)
plot(qammod(qamdemod(signal_d_hat,QAM),QAM),'.','color', [0.3010 0.7450 0.9330],"markersize", 8)
title('Filtered Signal + Decisor');
xlabel('In Phase');
ylabel('Quadrature');
grid on;
saveas(gcf,'L3Q6_A_c.png')