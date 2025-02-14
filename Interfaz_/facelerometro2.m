function [DatX1,Datx1,f,P1]= facelerometro2(val,tiempo)
% DatX = readmatrix('4822.csv');
% tiempo = readmatrix('tiempo.csv');
%val=DatX ;
val1(1)=val(1);



 for i=1:((length(val)/2-1))
    
    val1(i)=val(2*i+1);
    fin4(i)=tiempo(2*i+1);
end

% for i=1:(length(val)/2)
%     val2(i)=val(2*i);
% end

% for i=1:(length(val)/2)
%     val1(i)=val(2*i);
% end
DatX1=val1;
i=1:length(DatX1);
% figure(2);
% subplot(3,1,1);
% plot(i,DatX1(1,:));
% title('Acelerometro'); 

 N = DatX1/max(DatX1);
%valY = sum(N);
%n = length(N);
%%%%Eliminacion del Offset
%valProm = valY/n;
varCent = DatX1-2.6;
L=2000;
Fs = L/(14.7);                             % Sampling frequency                          
%%%%%%%%Filtro
Num =[    0.0132         0   -0.0530         0    0.0794         0   -0.0530         0    0.0132];

Den =[    1.0000   -3.6409    6.8985   -8.5515    7.5864   -4.8410    2.1836   -0.6376    0.1000];

Datx1=filter(Num,Den,varCent);
%Datx1=bandpass(varCent,[8 15],Fs);
% Datx1=filter(Num,Den,Datx1);
%Datx1=bandpass(DatX1,[30 60],320);

%FFT

L=2000;
Y = abs( fft(varCent)/L); 
P1 = Y(1:L/8+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/8))/L;
 
 
 
 figure(1);
subplot(3,1,1);
plot(fin4,DatX1);
title('Aclerometro');
subplot(3,1,2);
plot(fin4,varCent);
subplot(3,1,3);
title('Aclerometro Filtrado');
plot(f,P1);
title('FFT Acelerometro'); 
 