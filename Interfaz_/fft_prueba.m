clear all
Fs = 1/(4e-3);                             % Sampling frequency                          
Datx1=readmatrix("Pruebas_6_9_bien/ALL0033/F0033CH1.csv");
%L = length(Datx1);                             % Length of signal
L=2100;
R=2000;
o=101;
figure(1);
DatX1(1:R,1)=Datx1(o:L,4);
DatX1(1:R,2)=Datx1(o:L,5)+4.2;
plot(DatX1(1:R,1),DatX1(1:R,2));
%Datx1=Datx1(:,2);
n=4;
Y = abs( fft(DatX1(:,2))/L); 
P1 = Y(1:L/n+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/n))/L;
figure(2);
plot(f,P1);
title('FFT'); 