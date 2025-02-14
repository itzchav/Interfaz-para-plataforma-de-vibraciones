function [DatX2,Datx2,f,P1]= fdesplazamiento(val,tiempo)
%DatX = readmatrix('May_4_3.csv');
%val=DatX ;
val2(1)=val(1);


fin4(1)=tiempo(1);
 for i=1:((length(val)/2)-1)
    
    val2(i)=val(2*i+1);
    fin4(i)=tiempo(2*i+1);
end
% 
% for i=1:(length(val)/2)
%     val2(i)=val(2*i);
% end

DatX2=val2;
i=1:length(DatX2);
N = DatX2/max(DatX2);
valY = sum(N);
n1 = length(N);
%%%%Eliminacion del Offset
valProm = valY/n1;
varCent = N- 0.93;


%%%%%%%%Filtro


Num =[    0.0010         0   -0.0020         0    0.0010];
Den =[    1.0000   -2.8723    3.9720   -2.7436    0.9125];

Num = [   0.0069         0   -0.0137         0    0.0069];
Den =[    1.0000   -3.6931    5.1737   -3.2595    0.7797];
%Num =[    0.0131         0   -0.0262         0    0.0131];
%Den =[    1.0000   -2.7852    3.6035   -2.3332    0.7038];



Datx2=filter(Num,Den,varCent);
%FFT
Fs = 250;                             % Sampling frequency                          
L = 500;                             % Length of signal
Y = abs( fft(Datx2)/L); 
P1 = Y(1:L/4+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/4))/L;
% n=2.^nextpow2(500);
% 
%  Y=fft(Datx2,n); 
%  f = Fs*(0:(n/2))/n;
% P1 = abs(Y/n).^2;



 figure(1);
subplot(3,1,1);
plot(fin4',DatX2);
title('Desplazamiento');
subplot(3,1,2);
plot(varCent);
subplot(3,1,3);
title('Desplazamiento Filtrado');
plot(f,P1);
%plot(f,P1(1:n/2+1)) 
title('FFT Desplazamiento'); 


% 
% %Desplazamiento
% i=1:length(DatX2);
% figure(2); subplot(3,1,1); plot(i,DatX2(1,:));
% title('Desplazamiento');  
% 
% %%%%%%%Filtro
% DatX2=normalize(DatX2,'range',[0,1]);
% Num =[0.0041    0.0288    0.0863    0.1438    0.1438    0.0863    0.0288    0.0041];
% Den =[    1.0000   -1.5515    1.8621   -1.2352    0.5969   -0.1757    0.0319   -0.0025];
% %Num=[0.0022         0   -0.0109         0    0.0218         0   -0.0218         0    0.0109         0   -0.0022]
% %Den=[1.0000   -4.7636   11.9057  -19.6951   23.6997  -21.4584   14.7919   -7.6559    2.8737   -0.7121   0.0937]
% 
% Datx2=filter(Num,Den, DatX2);
% i=1:length(Datx2);
% subplot(3,1,2);  plot(i,Datx2(1,:));
% title('Desplazamiento Filtrado');
% 
% %FFT  
% Fs = 100;                             % Sampling frequency                          
% L = 500;                             % Length of signal
% Y = abs( fft(Datx2)/L); 
% P1 = Y(1:L/4+1);
% P1(2:end-1) = 2*P1(2:end-1);
% f = Fs*(0:(L/4))/L;
% 
% subplot(3,1,3); plot(f,P1) 
% title('FFT Desplazamiento'); 
%Num =1.0e-03 *[0.1257         0   -0.3772         0    0.3772         0   -0.1257];
%Den =[    1.0000   -4.0219    8.1880   -9.9113    7.6411   -3.5026    0.8127];
%Num =[    0.0369         0   -0.0369];
%Den =[    1.0000   -1.4155    0.9262];%Num =[ 0.0004         0   -0.0013         0    0.0013         0   -0.0004];
%Den =[1.0000   -4.3896    9.1173  -11.0271    8.2084   -3.5580    0.7299];
%Num=[0.000418108715641348,0,-0.00125432614692404,0,0.00125432614692404,0,-0.000418108715641348];
%Den=[1,-4.38960470731527,9.11729132368008,-11.0270615456918,8.20844372416254,-3.55796562839219,0.729863404881302];
Num=[5.94491536170280e-09,0,-4.16144075319196e-08,0,1.24843222595759e-07,0,-2.08072037659598e-07,0,2.08072037659598e-07,0,-1.24843222595759e-07,0,4.16144075319196e-08];
Den=[1,-10.3244613736863,52.0718176052653,-168.850499088267,391.717102299116,-686.029025092557,933.894373867947,-1003.00114461231,853.786542858550,-573.383494307938,299.313209150480,-117.952300175464,33.2551879363007,-6.02813121757374,0.533814137866259];

Num =[     0.0057         0   -0.0115         0    0.0057];
Den =[  1.0000   -2.5641    3.4230   -2.2890    0.7975];
 