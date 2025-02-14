
valProm = 0;
cont1 = 0;
var1=readmatrix('4_val_36');
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



Num =[ 0.0004         0   -0.0013         0    0.0013         0   -0.0004];
Den =[1.0000   -4.3896    9.1173  -11.0271    8.2084   -3.5580    0.7299];
v=filter(Num,Den,varCent);





%FFT
Fs = 100;                             % Sampling frequency                          
L = 500;                             % Length of signal
Y = abs( fft(v)/L); 
P1 = Y(1:L/4+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/4))/L;
 
 
 
 figure(1);
subplot(3,1,1);
plot(varVol);
subplot(3,1,2);
plot(varCent);
subplot(3,1,3);
plot(f,P1);