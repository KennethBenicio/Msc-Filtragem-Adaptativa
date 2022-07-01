%% RLS Filter Implementation
clc;
close all;
clear all;


% Forgeting rate
lambda = 0.98;
delta = 100;
% Filter order
order = 2 + 1;


% Number of samples
Samples = 100;
% Defining the mse error and filter coeficients vectors.
error = zeros(Samples,1);
weights = zeros(order, Samples);
weights(1,1) = 1; 
% Generating the sinoide signal.
t = linspace(-pi,pi,Samples).';
signal_d = cos(pi*t/3);
% Defining the energy of the noise vector.
SNR_dB = 15;
SNR_li = 10^(SNR_dB/10);
variance_noise = 1/SNR_li;
noise = sqrt(variance_noise/2).*randn(Samples,1);
% Generating the noisy received signal.
signal_x = signal_d + noise;

% Deterministic correlation matrix initialization
y = zeros(Samples,1);
Rd = delta*eye(order); 
for ss = 2:(Samples - order - 1)
    % Deterministic correlation matrix inverse
    Rd = (1/lambda)*(Rd - (Rd*signal_x(ss:ss+order-1)*signal_x(ss:ss+order-1)'*Rd)/(lambda + signal_x(ss:ss+order-1)'*Rd*signal_x(ss:ss+order-1)));
    % Error between the desired signal and the filtered signal.
    error(ss) = signal_d(ss) - weights(:,ss-1)' * signal_x(ss:ss+order-1); 
    % Recursive expression.
    weights(:,ss) = weights(:,ss-1) + Rd*error(ss)*signal_x(ss:ss+order-1);
    % Output
    y(ss) = weights(:,ss-1)' * signal_x(ss:ss+order-1);
end

aux = weights(:,1:10).';
tabela = [aux(1,:);aux(2,:);aux(3,:);aux(4,:);aux(5,:);aux(6,:);aux(7,:);aux(8,:);aux(9,:);aux(10,:);];
Tabela = array2table(tabela);
Tabela.Properties.RowNames = {'i = 1' 'i = 2' 'i = 3' 'i = 4' 'i = 5' 'i = 6' 'i = 7' 'i = 8' 'i = 9' 'i = 10'};
Tabela.Properties.VariableNames = {'1st Coeff' '2nd Coeff' '3rd Coeff'};
%table2latex(Tabela,'tabela.tex');

% MSE Curve
figure
txt = ['Filtered Signal'];
plot(y,'-','color', [0.4660 0.6740 0.1880], "linewidth", 2, "markersize", 8, "DisplayName", txt);
hold on;
txt = ['Source Signal'];
plot(signal_x,'-','color', [0.3010 0.7450 0.9330], "linewidth", 2, "markersize", 8, "DisplayName", txt);
hold off;
title('Predicted Signal vs. Source Signal');
xlabel('Samples');
ylabel('Magnitude');
legend_copy = legend("location", "northeast");
set (legend_copy, "fontsize", 12);
grid on;
%saveas(gcf,'L4Q1.png')