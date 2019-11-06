clc, clear all, close all
n = 0:11;
g = zeros(1,length(n));
for a = 1:length(n)
 b = a-1;
 g(a) = (1/3)*(1/(4^(b+1)) + exp(-b-1) + 1/(b+2));
end
%% Matrizes
G1 = [g(1) 0 0 0 0;...
 g(2) g(1) 0 0 0;...
 g(3) g(2) g(1) 0 0;...
 g(4) g(3) g(2) g(1) 0];
g2 = [g(5);g(6);g(7);g(8)];
G3 = [g(4) g(3) g(2) g(1);...
 g(5) g(4) g(3) g(2);...
 g(6) g(5) g(4) g(3);...
 g(7) g(6) g(5) g(4)];
%% Outras matrizes
a = -inv(G3)*g2;
b = G1*[1;a];
er = g2 + G3*a;
%% função de transferência H(z)
num = b.';
den = [1 a.'];
n2=101;
% Usar lfilter do Python aqui - ver exemplo no site:
%https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.lfilter.html
[h,t] = impz(num,den,n2);
%% sinal g[n] desejado e o h[n] obtido
n = 0:(n2-1);
G = (1/3).*(1./(4.^(n+1)) + exp(-n-1) + 1./(n+2));
figure()
plot(n,G,'k',t,h,'r.','LineWidth',1,'MarkerSize',12);
grid
title('Livro - n = 0 a 7');
xlabel('\it{n}');
ylabel('{\it{g[n]}} e {\it{h[n]}}');
%% Questão 1
% Matrizes
G1 = [g(1) 0 0 0 0 0 0;...
 g(2) g(1) 0 0 0 0 0;...
 g(3) g(2) g(1) 0 0 0 0;...
 g(4) g(3) g(2) g(1) 0 0 0;...
 g(5) g(4) g(3) g(2) g(1) 0 0;...
 g(6) g(5) g(4) g(3) g(2) g(1) 0];
g2 = [g(7);g(8);g(9);g(10);g(11);g(12)];
G3 = [g(6) g(5) g(4) g(3) g(2) g(1);...
 g(7) g(6) g(5) g(4) g(3) g(2);...
 g(8) g(7) g(6) g(5) g(4) g(3);...
 g(9) g(8) g(7) g(6) g(5) g(4);...
 g(10) g(9) g(8) g(7) g(6) g(5);...
 g(11) g(10) g(9) g(8) g(7) g(6)];
% Outras matrizes
a = -inv(G3)*g2;
b = G1*[1;a];
er = g2 + G3*a;
% função de transferência H(z)
num = b.';
den = [1 a.'];
% Usar lfilter do Python aqui - ver exemplo no site:
%https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.lfilter.html
[h,t] = impz(num,den,n2);
% Gráfico questão 1
figure()
plot(n,G,'k',t,h,'r.','LineWidth',1,'MarkerSize',12);
grid
title('Questão 1');
xlabel('\it{n}');
ylabel('{\it{g[n]}} e {\it{h[n]}}');
%% Questão 2
% Matrizes
G1 = [g(1) 0 0 0 0;...
 g(2) g(1) 0 0 0;...
 g(3) g(2) g(1) 0 0;...
 g(4) g(3) g(2) g(1) 0;...
 g(5) g(4) g(3) g(2) g(1);...
 g(6) g(5) g(4) g(3) g(2);...
 g(7) g(6) g(5) g(4) g(3);...
 g(8) g(7) g(6) g(5) g(4)];
g2 = [g(9);g(10);g(11);g(12)];
G3 = [g(8) g(7) g(6) g(5);...
 g(9) g(8) g(7) g(6);...
 g(10) g(9) g(8) g(7);...
 g(11) g(10) g(9) g(8)];
% Outras matrizes
a = -inv(G3)*g2;
b = G1*[1;a];
er = g2 + G3*a;
% função de transferência H(z)
num = b.';
den = [1 a.'];
% Usar lfilter do Python aqui - ver exemplo no site:
%https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.lfilter.html
[h,t] = impz(num,den,n2);
% Gráfico questão 2
figure()
plot(n,G,'k',t,h,'r.','LineWidth',1,'MarkerSize',12);
grid
title('Questão 2');
xlabel('\it{n}');
ylabel('{\it{g[n]}} e {\it{h[n]}}');
%% Questão 3
% Matrizes
G1 = [g(1) 0 0 0 0 0 0 0 0 0;...
 g(2) g(1) 0 0 0 0 0 0 0 0;...
 g(3) g(2) g(1) 0 0 0 0 0 0 0];
g2 = [g(4);g(5);g(6);g(7);g(8);g(9);g(10);g(11);g(12)];
G3 = [g(3) g(2) g(1) 0 0 0 0 0 0;...
 g(4) g(3) g(2) g(1) 0 0 0 0 0;...
 g(5) g(4) g(3) g(2) g(1) 0 0 0 0;...
 g(6) g(5) g(4) g(3) g(2) g(1) 0 0 0;...
 g(7) g(6) g(5) g(4) g(3) g(2) g(1) 0 0;...
 g(8) g(7) g(6) g(5) g(4) g(3) g(2) g(1) 0;...
 g(9) g(8) g(7) g(6) g(5) g(4) g(3) g(2) g(1);...
 g(10) g(9) g(8) g(7) g(6) g(5) g(4) g(3) g(2);...
 g(11) g(10) g(9) g(8) g(7) g(6) g(5) g(4) g(3)];
% Outras matrizes
a = -inv(G3)*g2;
b = G1*[1;a];
er = g2 + G3*a;
% função de transferência H(z)
num = b.';
den = [1 a.'];
% Usar lfilter do Python aqui - ver exemplo no site:
%https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.lfilter.html
[h,t] = impz(num,den,n2);
% Gráfico questão 3
figure()
plot(n,G,'k',t,h,'r.','LineWidth',1,'MarkerSize',12);
grid
title('Questão 3');
xlabel('\it{n}');
ylabel('{\it{g[n]}} e {\it{h[n]}}');