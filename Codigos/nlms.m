%% NLMS Filter Implementation
clc;
close all;
clear all;

% Learning rate
mi = 1e-1;
% Filter order
order = 2;
% Number of samples
Samples = 10000;
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
% Generating the noisy received signal.
signal_x = signal_d + noise;

% Convolving the channel and the signal.
Hz = [1 1.6];
signal_x = filter(Hz,1,signal_x);
% Shifting the true signal in a similar filter to simplify the process of detection.
Hz = [1 1];
signal_d = filter(Hz,1,signal_d);
% Defining the autocorrelation matrix and the cross-correlation vector.
Rx = [3.56, 1.60; 1.60, 3.56;];
p = [1; 0;];

for ss = 1:(Samples - order - 1)
    % Normalized learning rate.
    mi_normalized = mi/(norm(signal_x));
    % Error between the desired signal and the filtered signal.
    error(ss) = signal_d(ss) - weights(:,ss)' * signal_x(ss:ss+order-1); 
    % Recursive expression.
    weights(:,ss+1) = weights(:,ss) +  mi_normalized * error(ss) * signal_x(ss:ss+order-1);
end

% MSE Curve
figure
semilogy(1:Samples, error.^2,'-','color', [0.3010 0.7450 0.9330], "linewidth", 1, "markersize", 8);
title('LMS Behavior');
xlabel('Samples');
ylabel('MSE');
grid on;
%saveas(gcf,'nlms_mse.png')

% Contour
figure
p = [1; 0;];
Rx = [3.56, 1.60; 1.60, 3.56;];
[W0, W1] = meshgrid (-1:0.01:1,-1:0.01:1);
w0 = reshape(W0,[],1);
w1 = reshape(W1,[],1);
[aux,~] = size(w0);
for i = 1:aux
   w = [w0(i); w1(i)]; 
   % We are considering that the desired signal has unitary variance.
   Z(i) = 1 - 2*w.'*p + w.'*Rx*w;
end
Z = reshape(Z,size(W0));
contour(W0,W1,Z);
colormap('gray')
hold on;
for ss = 1:(Samples - order)
   plot(weights(1,ss),weights(2,ss),".-",'color', [0.3010 0.7450 0.9330],"markersize", 8);  
end
hold off;
title('NLMS Contour');
xlabel('W_1');
ylabel('W_0');
grid on;
%saveas(gcf,'nlms_contour.png')