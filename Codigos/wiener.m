## Wiener Filter Implementation
clc;
close all;
clear all;

pkg load signal;

Samples = 100;
noise = randn(Samples, 1) + 1j*randn(Samples, 1);
signal_d = randn(Samples, 1) + 1j*randn(Samples, 1);

## Supossing we have x(n) = x(n-1) + noise as our output;
signal_x = zeros(Samples,1);
signal_x(1) = signal_d(1);
for n = 2:Samples
  signal_x(n) = signal_x(n-1) + noise(n);
end

## Autocorrelation;
Rx = xcorr(signal_x);
## Cross-correlation;
p = xcorr(signal_d, signal_x);
## Estimating the coefficients;
weight = inv(Rx)*p;
## Filtering the signal;
signal_x_filtered = weight.'*signal_x;

nmse = ((signal_d .- signal_x_filtered).^2)./(signal_d.^2);
