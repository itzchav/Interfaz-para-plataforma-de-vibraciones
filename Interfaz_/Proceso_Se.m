
valProm = 0;
cont1 = 0;
%[nombre, direc] = uigetfile({'.csv'},'Escoje un archivo');
%var1 = table2array(readtable([direc,nombre]));
var1=readmatrix('3_val_9');
for i=1:(length(var1)/2)
    val1(i)=var1(2*i);
end
val2(1)=var1(1);
for i=1:((length(var1)/2)-1)
    
    val2(i)=var1(2*i+1);
end

varVol = val1;

valY = sum(varVol);
n = length(varVol);

valProm = valY/n;
varCent = varVol - valProm;


for k=1:n
    
    if varCent(k) >=0 
        varTra(k) = varCent(k);
    else
        varTra(k) = 0;
    end
    
end

filter_length = 2;
a=zeros(1,filter_length);
b=ones(1,filter_length);
a(1)=1;

Num =[0.0041    0.0288    0.0863    0.1438    0.1438    0.0863    0.0288    0.0041];
Den =[    1.0000   -1.5515    1.8621   -1.2352    0.5969   -0.1757    0.0319   -0.0025];
v=filter(Num,Den,varCent);



% for k=1:n
%    if envol(k) >= 35
%        cont1 = cont1 + 1;
%    end
% end
% 
% if cont1 >= 30
%     disp('S')
%     cont1 = 0;
% end

figure(1);
subplot(4,1,1);
plot(varVol);
subplot(4,1,2);
plot(varCent);
subplot(4,1,3);
plot(varTra);
subplot(4,1,4);
%plot(envol);
figure(2);
%FFT
Fs = 100;                             % Sampling frequency                          
L = 500;                             % Length of signal
Y = abs( fft(v)/L); 
P1 = Y(1:L/4+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/4))/L;
 plot(f,P1)
