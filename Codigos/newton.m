%% Newton Algorithm Filter Implementation
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

%% A FORMA DE GERAR ESTA COMPLETAMENTE ERRADA
signal_d = randn(Samples,1) + 1j*randn(Samples,1);
noise = sqrt(var_noise/2).*(randn(Samples,1) + 1j*randn(Samples,1));
signal_x(1) = randn(1).*signal_d + noise;

for i = 2:Samples
    signal_x(2) = 
end

Rx = xcorr(signal_x);
p = xcorr(signal_d, signal_x);
for k = 2:Samples
    weights(k) = weights(k - 1) - mi *(weights(k - 1) - inv(Rx)*p);
end