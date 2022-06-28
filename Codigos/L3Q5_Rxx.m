clc;
clear all;
close all;

% The filter order is 12
order = 12;
Rxx = zeros(order,order);
for k = 1:10000
    x = randn(10000,1) + randn(10000,1);
    y = zeros(length(x) + order - 1,1);
    for i = order:length(x)
       y(i + order - 1) = x(i) + x(i-1) + x(i-2) +  x(i-3) + x(i-4) + x(i-5) + x(i-6) +...
           x(i-7) + x(i-8) + x(i-9) + x(i-10) + x(i-11);
       %y(i-1) = x(i) + 1.6*x(i-1);
    end

    % The following references were used to solve this problem.
    %https://www.mathworks.com/matlabcentral/answers/4580-calculation-of-autocorrelation-matrix
    %https://ccrma.stanford.edu/~jos/sasp/Sample_Autocorrelation.html
    %http://matlab.izmiran.ru/help/toolbox/signal/corrmtx.html
    %https://www.mathworks.com/help/signal/ref/corrmtx.html
    [~,R] = corrmtx(y,order - 1,'autocorrelation');
    Rxx = Rxx + R;
end
Rxx = Rxx./10000;
step  = 1/max(eig(Rxx)) 

% Misadjustment for mu/2, mu/10 and mu/50
Rxx_empirico = Rxx;
misadjustment_e_2 = ((0.05/2)*(trace(Rxx_empirico)))/(1 - (0.05/2)*(trace(Rxx_empirico)))
misadjustment_e_10 = ((0.05/10)*(trace(Rxx_empirico)))/(1 - (0.05/10)*(trace(Rxx_empirico)))
misadjustment_e_50 = ((0.05/50)*(trace(Rxx_empirico)))/(1 - (0.05/50)*(trace(Rxx_empirico)))
Rxx_teorico = ceil(Rxx);
misadjustment_t_2 = ((0.05/2)*(trace(Rxx_teorico)))/(1 - (0.05/2)*(trace(Rxx_teorico)))
misadjustment_t_10 = ((0.05/10)*(trace(Rxx_teorico)))/(1 - (0.05/10)*(trace(Rxx_teorico)))
misadjustment_t_50 = ((0.05/50)*(trace(Rxx_teorico)))/(1 - (0.05/50)*(trace(Rxx_teorico)))