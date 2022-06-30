%% RLS Filter Implementation
clc;
close all;
clear all;

% Forgeting rate
lambda = 0.999;
% Filter order
order = 2;
% Number of samples
Samples = 1000;
% Defining the mse error and filter coeficients vectors.
error = zeros(Samples,1);
weights = zeros(order, Samples);
%Wiener Solution
wiener = [0.35;-0.15];
% Defining the energy of the noise vector.
SNR_dB = inf;
SNR_li = 10^(SNR_dB/10);
variance_noise = 1/SNR_li;
noise = sqrt(variance_noise/2).*randn(Samples,1);
% Generating the original signal.
signal_d = randn(Samples,1);
% Convolving the channel and the signal.
Hz = [1 1.6];
signal_x = filter(Hz,1,signal_d);
% Generating the noisy received signal.
signal_x = signal_x + noise;
% Defining delta by the inverse of the signal energy
delta  = 1/(sum(signal_x.^2)/length(signal_x));
% Defining the autocorrelation matrix and the cross-correlation vector.
Rx = [3.56, 1.60; 1.60, 3.56;];
p = [1; 0;];

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
txt = ['w0'];
plot(1:Samples, weights(1,:),'-','color', [0.3010 0.7450 0.9330], "linewidth", 2, "markersize", 8, "DisplayName",txt);
hold on;
txt = ['w1'];
plot(1:Samples, weights(2,:),'-','color', [0.4660 0.6740 0.1880], "linewidth", 2, "markersize", 8, "DisplayName",txt);
hold off;
title('RLS Coefficients Behavior');
xlabel('Samples');
ylabel('Magnitude');
legend_copy = legend("location", "northeast");
set (legend_copy, "fontsize", 12);
grid on;
saveas(gcf,'rls_coefficients.png')

% MSE Curve
figure
semilogy(1:Samples, error.^2,'-','color', [0.3010 0.7450 0.9330], "linewidth", 1, "markersize", 8);
title('RLS Behavior');
xlabel('Samples');
ylabel('MSE');
grid on;
saveas(gcf,'rls_mse.png')

% Contour
figure
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
plot(wiener(1,1),wiener(2,1),"x",'color', [0.4660 0.6740 0.1880],"markersize", 6); 
hold off;
title('RLS Contour');
xlabel('W_1');
ylabel('W_0');
grid on;
saveas(gcf,'rls_contour.png')