clc
clear all

F=51.2;   %freq amostragem
dt=1/F;  %delta t = 5*10^-3
T=10;    %tempo / dominio sinal

t = 0:dt:T-dt;

sinal=triangularPulse((t)/3)+triangularPulse((t-1)/3)+triangularPulse((t-2)/3);
%
hold on
plot(sinal);
title('Sinal no tempo')
hold off
%
y=fft(sinal);

n=length(sinal);
%{

fshift=(-n/2:n/2-1)*(F/n);

yshift= fftshift(abs(y));

yshiftFase= fftshift(angle(y));

%plots
tiledlayout(4,1) 

nexttile
plot(t,sinal)
title('Sinal no tempo (s)')

nexttile
plot(fshift,yshift)
title('Sinal na freq (Hz)')

nexttile
plot(fshift,yshiftFase)
title('Fase (Rad)')
%}

syms t w

f=rectangularPulse(0,10,t)*(triangularPulse((t)/3)+triangularPulse((t-1)/3)+triangularPulse((t-2)/3));

energia= int(abs(f).^2,t,[0 10]);
etot=vpa(energia,10);

W=fourier(f,t,w);
energiaf=int(abs(W).^2,w,[-300 300]);
etotf= (1/(2*pi))*vpa(energiaf);