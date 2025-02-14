function [DatX2,Datx2,f,P1]= fdesplazamiento2(val,tiempo)
%DatX = readmatrix('May_4_3.csv');
%val=DatX ;
val2(1)=val(1);


fin4(1)=tiempo(1);
 for i=1:((length(val)/2)-1)
    
    val2(i)=val(2*i);
    fin4(i)=tiempo(2*i);
end


DatX2=val2;
i=1:length(DatX2);
N = DatX2/max(DatX2);


%FFT
Datx2 = DatX2-12.6;
L=2000;
Fs = L/((tiempo(2000)));      

Y = abs( fft(Datx2)/L); 
P1 = Y(1:L/8+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/8))/L;





 figure(1);
subplot(3,1,1);
plot(fin4,DatX2);
title('Desplazamiento');
subplot(3,1,2);
plot(fin4,Datx2);
subplot(3,1,3);
title('Desplazamiento Filtrado');
plot(f,P1);
%plot(f,P1(1:n/2+1)) 
title('FFT Desplazamiento'); 
