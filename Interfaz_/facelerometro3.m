function [DatX1,Datx1,f,P1]= facelerometro3(val,tiempo,Fs_osc,tipo_archivo,offset)

L=2000;
DatX1=val;
n=8;
i=1:length(DatX1);

%% Lectura Osciloscopio
if (tipo_archivo ==4)
  Fs=Fs_osc
  
  Datx1 = (DatX1+offset)*(1/4.09468);
  

  
Y = abs( fft(Datx1)/L); 
P1 = Y(1:L/n+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/n))/L;
 
 
 figure(1);
subplot(3,1,1);
plot(tiempo,DatX1);
grid on
title('Señal Adquirida');
set(gca, 'FontName','Times New Roman','FontSize', 10,  'FontAngle', 'italic')
xlabel('Tiempo(s)')
 ylabel('Amplitud (V)')
subplot(3,1,2);
plot(tiempo,Datx1);
grid on
title('Señal Procesada');
set(gca, 'FontName','Times New Roman','FontSize', 10,  'FontAngle', 'italic')
xlabel('Tiempo(s)')
 ylabel('Desplazamiento(mm)')

 subplot(3,1,3);
xlim([0 15]);
 plot(f,P1);
xlim([0 15]);
grid on
title('Señal en función de la frecuencia'); 
set(gca, 'FontName','Times New Roman','FontSize', 10,  'FontAngle', 'italic')
set(gcf,'color','w')
xlabel('f (Hz)'); ylabel('|P1(f)|')




%% Lectura Arduino
else 
    L=length(DatX1)
   Fs = L/tiempo(length(tiempo))
   Datx1 = DatX1-2.6;

Y = abs( fft(Datx1)/L); 
P1 = Y(1:L/n+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/n))/L;
 
 
 
 figure(1);
subplot(3,1,1);

plot(tiempo,DatX1);
grid on
title('Lectura');
set(gca, 'FontName','Times New Roman','FontSize', 10,  'FontAngle', 'italic')
xlabel('Tiempo(s)')
 ylabel('Aceleración(m/s^2)')
subplot(3,1,2);

plot(tiempo,Datx1);
grid on
title('Señal Procesada');
set(gca, 'FontName','Times New Roman','FontSize', 10,  'FontAngle', 'italic')
xlabel('Tiempo(s)')
 ylabel('Aceleración(m/s^2)')
subplot(3,1,3);
xlim([0 15]);
plot(f,P1);
xlim([0 15]);
grid on
title('Señal en función de la frecuencia'); 
set(gca, 'FontName','Times New Roman','FontSize', 10,  'FontAngle', 'italic')
set(gcf,'color','w')
xlabel('f (Hz)'); ylabel('|P1(f)|')

end
 