function [x,y,Mb_t,w,k1, Mt1,M]= wn(a,b,c,Mmotor,E,Mbarra,densidad,k,cmasa,sal,ent,Wdis,w2)
%assignin('base','w2',w2)
%assignin('base','w2',w2)
% a=1;                          %largo                    %metros             
% b=1/39.37;                            %ancho                    %metros
% c=(1/2)/39.37;                       %alto                     %metros
% Mmotor=.0959;                          % Peso Motor              %kg
% %densidad=2700;                       %Aluminio                 %kg/m^3
% densidad=7850;                        %Acero                    %kg/m^3
% %Modulo Elastico
% %E=71.7e9;                            %Aluminio                 %GPa
% E=206.8e9;                            %Acero                    %GPa
% volumen=a*b*c;     
% Mbarra1_3=2.8;                        %Barra 1.3m               %kg
% Mbarra1_5=4.8;                        %Barra 1.5m               %kg
% %Mbarra=volumen*densidad;                                        %kg              
% Mbarra=Mbarra1_3;
% m=0.5*Mbarra;     
% E=206.8e9;                            %Acero                    %GPa
volumen=a*b*c;                        %m^3

Mb_t=volumen*densidad;                                        %kg              

m=cmasa*Mbarra;                                                   %kg

I=(1/12)*(c^3)*b;                     %Inercia                  %m^4
k1=k*E*I/(a^3)                    %Constante de resorte     %N/m

%Pesos de elementos                                             %kg
R1=.100;                              
R2=.101;
P3=0.028; 

%Masa_extra=2+147+56+27+26+15+10;
%M=R2+P3+Mmotor+(Masa_extra/1000);
Masa_extra=1050-690;
%Masa_extra=1117-690;
M=(Masa_extra/1000)+Mmotor;
%Mb_t=M;
Mt1=M+m                                %Masa total              %kg
C=0.05*(2*sqrt(k1*Mt1));                 %Constante de amortiguamineto

w=sqrt(k1/Mt1);                         %Frec. de resonancia     %rad/s
if (Wdis==1)
        w=w2;
    end
rpm=w*30/pi;                                                   %rpm
e=2.5/100;                             %Excentricidad           %m
F=P3*e*w^2;  
    
assignin('base','Wdis',Wdis)
assignin('base','I',I)
assignin('base','b',b)
assignin('base','a',a)
assignin('base','c',c)
assignin('base','densidad',densidad)
assignin('base','volumen',volumen)
assignin('base','F',F)
assignin('base','w',w)
assignin('base','Mt1',Mt1)
assignin('base','M',M)
assignin('base','Mb_t',Mb_t)
assignin('base','k1',k1)
assignin('base','cmasa',cmasa)
assignin('base','Mmotor',Mmotor)
assignin('base','Mbarra',Mbarra)
assignin('base','E',E)
if (ent==1)
    out=sim('Frec_Nat_s_mk.slx');
else
    out=sim('Frec_Nat_c_mk.slx');
end
if(sal==1)
y=out.G1(:,2);
x=out.G1(:,1);
else
    Fs = 100;                             % Sampling frequency                          
L = 1000;      % Length of signal
n=4;
Y = abs( fft(out.G1(:,2))/L); 
y = Y(1:L/n+1);
y(2:end-1) = 2*y(2:end-1);
x = Fs*(0:(L/n))/L;

    
end
w=rpm/60;
end