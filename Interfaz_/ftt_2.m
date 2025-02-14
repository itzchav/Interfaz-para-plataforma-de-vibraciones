%Lectura Sensor
VarName=readmatrix("Doble_10_8_22_osc22_28.csv");
Fs=1/4.00E-03;
d=VarName(1:2100,2);
time=VarName(1:2100,1);
plot(time,d)
D=d+9;
%Lectura Arduino
%Name=readmatrix("doble_10_8_22_abs_ard30.csv");
%time=readmatrix("doble_10_8_22_abs_ard30_tiempo.csv");
%L=2000;
%Fs=L/time(2000);
%plot(time,Name)
%D=Name-2.6;
figure(1);
plot(time,D)

NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(D,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
% Plot single-sided amplitude spectrum.
figure(2);
plot(f,2*abs(Y(1:NFFT/2+1)))
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')