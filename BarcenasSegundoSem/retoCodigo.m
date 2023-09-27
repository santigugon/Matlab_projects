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


rhoB=2.82e-8;%Ohm*m Resistividad material
Ab=2.14e-6; %m^2 Area Varilla
Lb=0.05; %m Largo Varilla
Rb=rhoB*Lb/Ab; %Ohm Resistencia
rhor=2.65e-8;%Ohm*m
Ar=1.31e-6;%m^2
V=18; %Volt
m=0.6e-3; %Kg
Ri=0.1;


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
B=0.0000175;
a_cu=@(x) Lb*B*I(x)/(2*m);
f=@(x, y, z) a_cu(y);
xo=0; yo=0.0125;zo=0;
xf=2;yf=0.150;
color="b";

TPVI=kine1d_rk4(f,yo,zo,xf,100000,10,color);
TPVI
%CAMPO NO UNIFORME
Bo=0.0000451;
a_cnu=@(x) Bo*a(floor(x*1000));
f1=@(x, y, z) a_cnu(y);
xo=0; yo=0.0125;zo=0;
h=0.0001;xf=2;yf=0.150;
color="r";

%TPVI=kine1d_rk4(f1,xo,yo,xf,100,10,color);
%x=t
%y=posicion
%z=velocidad
%TPVI

%GRAFICACION DE  POSICION VELOCIDAD CONTRA TIEMPO Y CONTRA POSICION
function ITXVA = kine1d_rk4(fa,xi,vxi,tf,ncalc,nview,color)
% rk1 find yf=f(xf) from ODE dy/dx=f1(x,y)
% with initial value (xi,yi) in ncalc steps
% This is a modification of ode_euler to Runge Kutta 4
% save nview partial results: [ i x y dy/dx ]
%funcion para calcular Posicion, velocidad y aceleracion a traves del
%tiempo
  t=0;
  ncalc=round(ncalc);
  if ncalc<1 ITXVA=NaN; return; end
  h=(tf-t)/ncalc; x=xi; v=vxi; a=fa(t,x,v);


  nview=min(ncalc,round(max(1,nview)));
  step=round(ncalc/nview);
  ITXVA=zeros(nview+1,5); iv=1;
  ITXVA(1,:)=[0 t xi vxi a];
  
  for i=1:ncalc
%USAREMOS KV Para calcular la posicion
%Usaremos an para calcular la velocidad
    kv1=h*v;
    a1=h*fa(t,x,v);


    kv2=h*(v+(1/2)*a1);
    a2=h*fa(t+(1/2)*h,x+(1/2)*kv1, v+a1*(1/2));

    kv3=h*(v+(1/2)*a2);
    a3=h*fa(t+(1/2)*h,x+(1/2)*kv2,v+(1/2)*a2);

    kv4=h*(v+a3);
    a4=h*fa(t+h,x+kv3,v+a3);


   t=t+h; 
    x=x+(kv1+2*kv2+2*kv3+kv4)/6;  v=v+(a1+2*a2+2*a3+a4)/6 ; a=fa(t,x,v);
   
    if mod(i,step)==0
        iv=iv+1;  ITXVA(iv,:)=[i t x v a];
    end
  end
  ITXVA(end,:)=[ncalc t x v a];
figure(5);
subplot(1,3,1);
plot(ITXVA(2,:),ITXVA(3,:),color); hold on;
xlabel("t(s)");
ylabel("x(m)")

subplot(1,3,2);
plot(ITXVA(2,:),ITXVA(4,:),color); hold on;
xlabel("t(s)");
ylabel("x(m)")

subplot(1,3,3);
plot(ITXVA(2,:),ITXVA(5,:),color); hold on;
xlabel("t(s)");
ylabel("x(m)")

end


