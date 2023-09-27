%-----Programa para utilizar el método de Euler----%
clc;      %Limpiar pantalla 
clear all;      %% Limpiar memoria 
%Condiciones del problema 
t(1)=1;   %Tiempo inicial 
T(1)=1;       %Temperatura inicial
Dt=1;         %Delta de tiempo
%Inicia ciclo for
for i=2:201
   dT(i-1)=0.001*(T(i-1))*(2000-T(i-1));   %Razón de cambio   
T(i)=T(i-1)+dT(i-1)*Dt;       %Aproximación de Euler   
t(i)=t(i-1)+Dt;                 %Se actualiza el tiempo end
dT(i)=0.001*(T(i-1))*(2000-T(i-1));  %Se calcula un último valor de dT
end
%operaciones para n+1
dT(i)=0.001*(T(i-1))*(2000-T(i-1));
%presentación de resultados
T(i)

%----Gráfica Temperatura vs Tiempo----%

figure(1);

plot(t,T, 'LineWidth', 2);  %Comando para graficar 
hold on;
grid on;                   

%Comando para activar la rejilla

%Título de la gráfica

title('Temperatura (Grados C) vs Tiempo (minutos)','FontName','Times','FontSize', 14);

%Nombre del eje x

xlabel('Tiempo','FontName','Times','FontSize', 14);

%Nombre del eje y

ylabel('Temperatura','FontName','Times','FontSize',14); 

%----Gráfica Tasa de cambio vs Tiempo----% figure(2);
% 
plot(t,dT,'r','LineWidth', 2);   %Comando para graficar
grid on;                         
hold on;
%Comando para activar la rejilla

%Título de la gráfica 
title('Razón de Cambio vs Tiempo(minutos)','FontName','Times','FontSize', 14);

%Nombre del eje x

xlabel('Tiempo','FontName','Times','FontSize', 14);

%Nombre del eje y 
ylabel('Razón de cambio','FontName','Times','FontSize', 14);