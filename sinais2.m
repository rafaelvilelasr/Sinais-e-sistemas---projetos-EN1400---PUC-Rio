clc
clear all

T=8  %tempo / dominio sinal
df=1/T %delta f = 0.125

N=80;

F=N*df;
%freq amostragem = 128

t=linspace(0,T,N); %vetor tempo
f=linspace(-F/2,F/2,N); %vetor freq

sinal=triangularPulse( 2.*t-pi./t  )

y=fft(sinal)/N;

Sinal=fftshift(abs(y));  %modulo transformada

SinalFase=fftshift(angle(y));

idxt =find (abs(t)<=T);  %todos vetores/indices cujo modulo seja <=T
subplot(311),plot(t(idxt),sinal(idxt))
grid
title('sinal pelo tempo')
xlabel('s');

idxf=find (abs(f)<=8); %todos vetores/indices cujo modulo seja <= 50Hz
subplot(312),plot(f(idxf),10+log10(Sinal(idxf)))
grid
title('sinal pela freq')
xlabel('Hz');
ylabel('dB');











