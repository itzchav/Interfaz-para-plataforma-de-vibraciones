function [val,tiempo]= lectura_arduino()
% clear all;clc;
inicio=now;
muestras=1000;
delete(instrfind({'port'},{'COM6'}));
pserial=serial('COM6','BaudRate',9600);
fopen(pserial);

figure('Name','Gráfica de valores obtenidos')
title('LECTURA ANALOGICA CON ARDUINO');
xlabel('Muestra');
ylabel('Voltaje de Salida');
val=zeros(1,muestras);
grid off;

lectura=fscanf(pserial,'%f')
%val(1,muestras)=lectura(1);
for i=1:muestras
    i
    ylim([-20 20]); 
    %xlim([i-100 i+10]);
    xlim([i-100 i+10]);
    %lectura=fscanf(pserial);
    lectura=fscanf(pserial,'%f')
    val(i)=lectura(1);
    
%     hold on 
%     %vector(i)=toc(tstart);;
%      plot(i,val(i),'.');
%     drawnow
    fin(i)=now;
end
plot(val,'.');
% for i=1:muestras/2
%     val1(i)=val(2*i);
% end
% val2(1)=val(1);
% for i=1:((muestras/2)-1)
%     
%     val2(i)=val(2*i+1);
% end

% hold off
% figure(2);
% ylim([0 1]); 
% xlim([5 i+10]);
% y=1:muestras/2;
% plot(y,val1,'r');
% 
% figure(3);
% ylim([0 25]); 
% xlim([5 i+10]);
% y=1:(muestras/2)-1;
% plot(y,val2,'b');
% dlmwrite('Valores_Obtenidos.dat', val, 'delimiter', '\n', 'precision', '%.2f')
% val = readmatrix('7_val_4.csv');
% val1 = readmatrix('7_val_4.csv');
% val2 = readmatrix('7_val_4.csv');
fclose(pserial); 
delete(pserial);
fin2=datevec(fin-inicio);
t=fin2(:,6);
tiempo=t-t(1);
assignin('base','inicio',inicio)
assignin('base','fin',fin)
assignin('base','tiempo',tiempo)




%clear all;

