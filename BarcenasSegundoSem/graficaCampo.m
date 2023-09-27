anguloIman=[69 58 40 35 27];
distancia=[7 9 11 13 15];
campoMagnetico=[];



for i=1:1:5
    campoMagnetico=3*10^(-5)*tan(anguloIman*pi/180);
    B0=campoMagnetico.*distancia.^2;
end


campoMagnetico
B0
promedioB0=mean(B0)
scatter(distancia, campoMagnetico);             % Crea el diagrama de dispersión
xlabel('Distancia (cm)');           % Etiqueta del eje x
ylabel('campoMagnetico');           % Etiqueta del eje y
title('Distancia contra campo magnetico'); 
%scatter(distancia,campoMagnetico,sz,c,"red");
hold on

r = 6:0.1:20;  % Rango de valores de r
y = promedioB0./(r.^2);  % Ecuación a graficar

plot(r, y);  % Trazar el gráfico



%plot()