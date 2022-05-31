clc;
clear all;
close all;

x = -100:0.1:100;
y = -100:0.1:100;
[X,Y] = meshgrid(x,y);
Z = 24.40 - 4*X - 9*Y + X.^2 + Y.^2;

figure
h = surf(X,Y,Z);
set(h,'LineStyle','none')
title('Superficie de Erro para Filtro Wiener')
xlabel('w_0')
ylabel('w_1')

grid on;
Ax = gca;
Ax.ZAxis.Visible = 'off';
Ax.Color = 'none';

saveas(gcf,'superficie-de-erro.png')