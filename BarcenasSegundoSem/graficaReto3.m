B=importdata("campoPlano1.dat"); %LEEMOS EL PLANO MAGNETICO CALCULADO

%GRAFICA DE CAMPO
figure(1)
subplot(3,1,1);

image(256*B);%MULTIPLICADO POR UN FACTOR PORQUE LOS NUMEROS SON PEQUEÑOS
title("Campo magnetico archivo");
xlabel('x(mm)'); ylabel("y(mm)");
xp=-10.5:10.5;
yp=-10.5:10.5;
[X Y]=meshgrid(xp,yp);
subplot(3,1,2); plot3(X,Y,B);xlabel("x(mm)");ylabel("y(mm)");zlabel("B(T)")%Graficamos en 3d
subplot(3,1,3);quiver3(X,Y,0*X,0*X,0*Y,B);xlabel("x(mm)");ylabel("y(mm)");zlabel("B(T)");


%Las siguientes lineas son el promedio de un iman
Bp=sum(B)/22; %Sumamos campos
figure(3);
plot(xp,Bp);
title("Comportamiendo del campo alrededor de un iman");
xlabel("x(mm)");ylabel("B(T)");

%GRAFICAMOS LOS 10 imanes
M=B;
Imanes=10;
for i=1:Imanes-1
    M(:,i*22+1:(i+1)*22)=B; %FOR LOOP PARA NUESTROS IMANES
end
figure(2);image(256*M);xlabel("x(mm)");ylabel("y(mm)");
writematrix(M,"CampoG2.dat","Delimiter","tab");%CREAMOS UN DOCUMENTO PARA EL CAMPO DE LOS 10 IManes
title("Comportamiendo del campo alrededor de los 10 imanes");

B=importdata("CampoG2.dat");%Leemos el campo de los 10 imanes que creamos
xp=1:250;

for i=1:10*22
    Bp(i)=sum(B(:,i))/22;
end

xp=1:220;
figure(4);
plot(xp,Bp,"r");
xlabel("x(mm)");ylabel("B(t)");


%%VAMOS A HACER LOS CALCULOS

%VARIABLES
rhoB=2.82e-8;%Ohm*m Resistividad material
Ab=2.14e-6; %m^2 Area Varilla
Lb=0.05; %m Largo Varilla
Rb=rhoB*Lb/Ab; %Ohm Resistencia
rhor=2.65e-8;%Ohm*m Resistivdad riel
Ar=1.31e-6;%m^2 Area Riel
V=18; %Volt
m=0.6e-3; %Kg
Ri=0.1;%Resistencia inicial


Rr=@(x) rhor*x/Ar;
I=@(x) V./(Rb+ 2*Rr(x)+Ri);
Iv= I(xp/1000);%ESTA Corriente es para graficar
F=Lb*Iv.*Bp;
a=F/(2*m);


figure(6);
plot(xp,Rr(xp/1000));
title("Cambio de resistencia respecto a la posicion")
xlabel("x(mm)");ylabel("R(Ohm)");


figure(7);
plot(xp,I(xp/1000));
title("Cambio de Intensidad de corriente respecto a la posicion")
xlabel("x(mm)");ylabel("R(Ohm)");

figure(8);
plot(xp,F);
title("Cambio de fuerza de corriente respecto a la posicion")
xlabel("x(mm)");ylabel("Fm(Ohm)");

figure(9);
plot(xp,a);
title("Cambio de aceleracion  respecto a la posicion")
xlabel("x(mm)");ylabel("a(m/s^2)");


%CAMPO  UNIFORME
B=0.0000175; %Calcular B con ecuacion de canvas
a_cu=@(x) Lb*B*I(x)/(2*m);
f=@(x, y, z) a_cu(y);
xo=0; yo=0.0125;zo=0;
xf=2;yf=0.150;h=0.0001;
color="b";

[xo yo zo]=RK4(f,xo,yo,zo,h,xf,yf,color);
%CAMPO NO UNIFORME %CAMBIAR
Bo=0.0000451;%Factor de ajuste a prueba de error
a_cnu=@(x) Bo*a(floor(x*1000));
f1=@(x, y, z) a_cnu(y);
xo=0; yo=0.0125;zo=0;
h=0.0001;xf=2;yf=0.150;
color="r";
[xo yo zo]=RK4(f1,xo,yo,zo,h,xf,yf,color);
%TPVI=kine1d_rk4(f1,xo,yo,xf,100,10,color);
%x=t
%y=posicion
%z=velocidad
%TPVI

%función RK4
function [xo yo zo] = RK4(f, xo, yo, zo, h, xf, yf, color)
xp = xo:0.0001:xf;
ite = (xf-xo)/h;
for k=1:ite
    k1z = f(xo,yo, zo);                        k1y = zo;
    k2z = f(xo+h/2, yo + h/2*k1y,zo+h/2*k1z);  k2y = zo+h/2*k1z;
    k3z = f(xo+h/2, yo + h/2*k2y,zo+h/2*k2z);  k3y = zo+h/2*k2z;
    k4z = f(xo + h, yo + h*k3y,zo+h*k3z);      k4y = zo+h*k3z;
    y1 = yo + h/6*(k1y + 2*k2y + 2*k3y + k4y);
    z1 = zo + h/6*(k1z + 2*k2z + 2*k3z + k4z);
 %   fprintf('%f %f\n',xo+h,y1);
    xV(k) = xo + h; yV(k) = y1; zV(k) = z1;
    xo = xo + h; yo = y1; zo = z1;
    if yo > yf   break; end
end


%últimás gráficas
figure(5);
subplot(1,3,1);
plot(xV,yV,color); hold on;
xlabel('t(s)');
ylabel('x(m)');
subplot(1,3,2);
plot(xV,zV,color); hold on;
xlabel('t(s)');
ylabel('v(m/s)');
subplot(1,3,3);
plot(yV,zV,color); hold on;
xlabel('x(m)');
ylabel('v(m/s)');
end     
