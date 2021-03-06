clc;
close all;
clear all;

% Simulation parameters
mi = 0.4;
gamma = 1e-3;
runs = 1000;
QAM_train = 4;
snrs = [0 10 20 30];
% Filter order
order = 15 + 1;

%% 4QAM
QAM = 4
SER = zeros(length(snrs),1);
for ii = 1:length(snrs)
    snrs(ii)
    for rr = 1:runs
        %% Training Stage  
        % Number of samples
        Samples = 500;
        % Defining the mse error and filter coeficients vectors.
        error = zeros(Samples,1);
        weights = zeros(order, Samples);

        % Defining the energy of the noise vector.
        signal_d_train = randi([0,QAM_train - 1],[Samples 1]);
        signal_d_train = qammod(signal_d_train,QAM_train);

        % Convolving the channel and the signal.
        Hz = [0.5 1.2 1.5 -1];
        signal_x_train = filtfilt(Hz,1,signal_d_train);

        % Training noise
        snr = 10^(inf/10);
        energy_symbol = mean(abs(signal_x_train(:)).^2); % Energy symbol pilot. 
        var_noise = energy_symbol .*  1/snr; % Variance of the noise.
        noise = sqrt(var_noise/2) * (randn(Samples,1) + 1i*randn(Samples,1));

        % Generating the noisy received signal.
        signal_x_train = signal_x_train + noise;

        for s = order:Samples
            aux = signal_x_train(s:-1:s-order+1);
            mi_normalized = mi/(gamma + norm(aux)^2);
            error(s) = signal_d_train(s-order+1) - weights(:,s)'*aux;
            % Recursive expression.
            weights(:,s+1) = weights(:,s) + mi_normalized * conj(error(s)) * aux;
        end

        %% Transmission Stage 
        % Number of samples
        Samples = 5000;
        % Defining the mse error and filter coeficients vectors.
        error = zeros(Samples,1);
        weights = zeros(order, Samples);

        % Defining the energy of the noise vector.
        signal_d = randi([0,QAM - 1],[Samples 1]);
        signal_d = qammod(signal_d,QAM);

        % Convolving the channel and the signal.
        Hz = [0.5 1.2 1.5 -1];
        signal_x = filtfilt(Hz,1,signal_d);

        % Transmission noise
        snr = 10^(snrs(ii)/10);
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
            % The equalizer does not know the original signal
            error(s) = qammod(qamdemod(signal_x(s-order+1),QAM),QAM) - weights(:,s)'*aux;
            % Recursive expression.
            weights(:,s+1) = weights(:,s) + mi_normalized * conj(error(s)) * aux;
        end
        aux1 = qamdemod(signal_d,QAM);
        aux2 = qamdemod(signal_d_hat,QAM);
        SER(ii,1) = SER(ii,1) + sum(aux1~=aux2)/length(aux1);
    end
end
SER = SER/runs;
figure
txt = ['4QAM Signal'];
semilogy(snrs, SER,'-','color', [0.3010 0.7450 0.9330], "linewidth", 3, "markersize", 8, "DisplayName", txt);
hold on;

%% 16QAM 
QAM = 16
SER = zeros(length(snrs),1);
for ii = 1:length(snrs)
    snrs(ii)
    for rr = 1:runs
        %% Training Stage  
        % Number of samples
        Samples = 500;
        % Defining the mse error and filter coeficients vectors.
        error = zeros(Samples,1);
        weights = zeros(order, Samples);

        % Defining the energy of the noise vector.
        signal_d_train = randi([0,QAM_train - 1],[Samples 1]);
        signal_d_train = qammod(signal_d_train,QAM_train);

        % Convolving the channel and the signal.
        Hz = [0.5 1.2 1.5 -1];
        signal_x_train = filtfilt(Hz,1,signal_d_train);

        % Training noise
        snr = 10^(inf/10);
        energy_symbol = mean(abs(signal_x_train(:)).^2); % Energy symbol pilot. 
        var_noise = energy_symbol .*  1/snr; % Variance of the noise.
        noise = sqrt(var_noise/2) * (randn(Samples,1) + 1i*randn(Samples,1));

        % Generating the noisy received signal.
        signal_x_train = signal_x_train + noise;

        for s = order:Samples
            aux = signal_x_train(s:-1:s-order+1);
            mi_normalized = mi/(gamma + norm(aux)^2);
            error(s) = signal_d_train(s-order+1) - weights(:,s)'*aux;
            % Recursive expression.
            weights(:,s+1) = weights(:,s) + mi_normalized * conj(error(s)) * aux;
        end

        %% Transmission Stage 
        % Number of samples
        Samples = 5000;
        % Defining the mse error and filter coeficients vectors.
        error = zeros(Samples,1);
        weights = zeros(order, Samples);

        % Defining the energy of the noise vector.
        signal_d = randi([0,QAM - 1],[Samples 1]);
        signal_d = qammod(signal_d,QAM);

        % Convolving the channel and the signal.
        Hz = [0.5 1.2 1.5 -1];
        signal_x = filtfilt(Hz,1,signal_d);

        % Transmission noise
        snr = 10^(snrs(ii)/10);
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
            % The equalizer does not know the original signal
            error(s) = qammod(qamdemod(signal_x(s-order+1),QAM),QAM) - weights(:,s)'*aux;
            % Recursive expression.
            weights(:,s+1) = weights(:,s) + mi_normalized * conj(error(s)) * aux;
        end
        aux1 = qamdemod(signal_d,QAM);
        aux2 = qamdemod(signal_d_hat,QAM);
        SER(ii,1) = SER(ii,1) + sum(aux1~=aux2)/length(aux1);
    end
end
SER = SER/runs;
txt = ['16QAM Signal'];
semilogy(snrs, SER,'-','color', [0 0.4470 0.7410], "linewidth", 3, "markersize", 8, "DisplayName", txt);
hold on;

%% 64QAM 
QAM = 64
SER = zeros(length(snrs),1);
for ii = 1:length(snrs)
    snrs(ii)
    for rr = 1:runs
        %% Training Stage  
        % Number of samples
        Samples = 500;
        % Defining the mse error and filter coeficients vectors.
        error = zeros(Samples,1);
        weights = zeros(order, Samples);

        % Defining the energy of the noise vector.
        signal_d_train = randi([0,QAM_train - 1],[Samples 1]);
        signal_d_train = qammod(signal_d_train,QAM_train);

        % Convolving the channel and the signal.
        Hz = [0.5 1.2 1.5 -1];
        signal_x_train = filtfilt(Hz,1,signal_d_train);

        % Training noise
        snr = 10^(inf/10);
        energy_symbol = mean(abs(signal_x_train(:)).^2); % Energy symbol pilot. 
        var_noise = energy_symbol .*  1/snr; % Variance of the noise.
        noise = sqrt(var_noise/2) * (randn(Samples,1) + 1i*randn(Samples,1));

        % Generating the noisy received signal.
        signal_x_train = signal_x_train + noise;

        for s = order:Samples
            aux = signal_x_train(s:-1:s-order+1);
            mi_normalized = mi/(gamma + norm(aux)^2);
            error(s) = signal_d_train(s-order+1) - weights(:,s)'*aux;
            % Recursive expression.
            weights(:,s+1) = weights(:,s) + mi_normalized * conj(error(s)) * aux;
        end

        %% Transmission Stage 
        % Number of samples
        Samples = 5000;
        % Defining the mse error and filter coeficients vectors.
        error = zeros(Samples,1);
        weights = zeros(order, Samples);

        % Defining the energy of the noise vector.
        signal_d = randi([0,QAM - 1],[Samples 1]);
        signal_d = qammod(signal_d,QAM);

        % Convolving the channel and the signal.
        Hz = [0.5 1.2 1.5 -1];
        signal_x = filtfilt(Hz,1,signal_d);

        % Transmission noise
        snr = 10^(snrs(ii)/10);
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
            % The equalizer does not know the original signal
            error(s) = qammod(qamdemod(signal_x(s-order+1),QAM),QAM) - weights(:,s)'*aux;
            % Recursive expression.
            weights(:,s+1) = weights(:,s) + mi_normalized * conj(error(s)) * aux;
        end
        aux1 = qamdemod(signal_d,QAM);
        aux2 = qamdemod(signal_d_hat,QAM);
        SER(ii,1) = SER(ii,1) + sum(aux1~=aux2)/length(aux1);
    end
end
SER = SER/runs;
txt = ['64QAM Signal'];
semilogy(snrs, SER,'-','color', [0.8500 0.3250 0.0980], "linewidth", 3, "markersize", 8, "DisplayName", txt);
hold on;

%% 256QAM 
QAM = 256
SER = zeros(length(snrs),1);
for ii = 1:length(snrs)
    snrs(ii)
    for rr = 1:runs
        %% Training Stage  
        % Number of samples
        Samples = 500;
        % Defining the mse error and filter coeficients vectors.
        error = zeros(Samples,1);
        weights = zeros(order, Samples);

        % Defining the energy of the noise vector.
        signal_d_train = randi([0,QAM_train - 1],[Samples 1]);
        signal_d_train = qammod(signal_d_train,QAM_train);

        % Convolving the channel and the signal.
        Hz = [0.5 1.2 1.5 -1];
        signal_x_train = filtfilt(Hz,1,signal_d_train);

        % Training noise
        snr = 10^(inf/10);
        energy_symbol = mean(abs(signal_x_train(:)).^2); % Energy symbol pilot. 
        var_noise = energy_symbol .*  1/snr; % Variance of the noise.
        noise = sqrt(var_noise/2) * (randn(Samples,1) + 1i*randn(Samples,1));

        % Generating the noisy received signal.
        signal_x_train = signal_x_train + noise;

        for s = order:Samples
            aux = signal_x_train(s:-1:s-order+1);
            mi_normalized = mi/(gamma + norm(aux)^2);
            error(s) = signal_d_train(s-order+1) - weights(:,s)'*aux;
            % Recursive expression.
            weights(:,s+1) = weights(:,s) + mi_normalized * conj(error(s)) * aux;
        end

        %% Transmission Stage 
        % Number of samples
        Samples = 5000;
        % Defining the mse error and filter coeficients vectors.
        error = zeros(Samples,1);
        weights = zeros(order, Samples);

        % Defining the energy of the noise vector.
        signal_d = randi([0,QAM - 1],[Samples 1]);
        signal_d = qammod(signal_d,QAM);

        % Convolving the channel and the signal.
        Hz = [0.5 1.2 1.5 -1];
        signal_x = filtfilt(Hz,1,signal_d);

        % Transmission noise
        snr = 10^(snrs(ii)/10);
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
            % The equalizer does not know the original signal
            error(s) = qammod(qamdemod(signal_x(s-order+1),QAM),QAM) - weights(:,s)'*aux;
            % Recursive expression.
            weights(:,s+1) = weights(:,s) + mi_normalized * conj(error(s)) * aux;
        end
        aux1 = qamdemod(signal_d,QAM);
        aux2 = qamdemod(signal_d_hat,QAM);
        SER(ii,1) = SER(ii,1) + sum(aux1~=aux2)/length(aux1);
    end
end
SER = SER/runs;
txt = ['256QAM Signal'];
semilogy(snrs, SER,'-','color', [0.4660 0.6740 0.1880], "linewidth", 3, "markersize", 8, "DisplayName", txt);
hold off;
legend_copy = legend("location", "southwest");
set (legend_copy, "fontsize", 12);
grid on;
title('SER vs. SNR for different constelattions');
xlabel('SNR (dB)');
ylabel('SER');
saveas(gcf,'L3Q6_D_ser.png')