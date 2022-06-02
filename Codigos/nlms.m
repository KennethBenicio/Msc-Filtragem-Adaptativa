%% NLMS Filter Implementation
clc;
close all;
clear all;

mi = 0.05;
Samples = 1000;
error = zeros(Samples,1);
weights = zeros(Samples, 1);
weights = complex(weights,0);

SNR_dB = 30;
SNR_li = 10^(SNR_dB/10);
var_noise = 1/SNR_li;

signal_d = randn(Samples,1) + 1j*randn(Samples,1);
noise = sqrt(var_noise/2).*(randn(Samples,1) + 1j*randn(Samples,1));
signal_x = randn(1).*signal_d + noise;

for k = 2:Samples
  mi_normalized = mi/(norm(signal_x));
  error(k - 1) = signal_d(k - 1) - weights(k - 1)' * signal_x(k - 1); 
  weights(k) = weights(k - 1) + mi_normalized * error(k - 1)' * signal_x(k - 1);
end

figure
error = sqrt(error.^2);
semilogy(1:Samples, error);
title('NLMS Behavior');
xlabel('Samples');
ylabel('Error');
grid on;

figure 
plot(1:Samples,real(signal_d));
hold on;
plot(1:Samples,real(signal_x));
hold off;
title('Desired Signal vs. Received Signal');
xlabel('Sample');
ylabel('Magnitude');
grid on;

filtered = zeros(Samples,1);
filtered = complex(filtered,0);
for k = 1:Samples
  filtered(k) = weights(k)*signal_x(k); 
end

figure 
plot(1:Samples,real(signal_d));
hold on;
plot(1:Samples,real(filtered));
hold off;
title('Desire Signal vs. Filtered Signal');
xlabel('Sample');
ylabel('Magnitude');
grid on;


