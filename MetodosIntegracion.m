
f=@(x)3 + cos(T)-T.^(1/2);    % Outside function;
a=0;
b=110;
n=100;

%op=input("1.-Ln \n 2.- Mn\n 3.-Rn \n 4.-Tc \n 5.-Sn13 \n Opcion");
%a=input("Ingresa el limite inferior: ");
%b=input("Ingresa el limite superior: ");
%n=input("Dame el numero de partes: ");
%g=input("Dame la funcion(x): ","s");
%g=inline(g);

%switch(op)
    %case 1,SumaRiemmanLn(a,b,n,g);
    %case 2, SumaRiemmanMn(a,b,n,g);
    %case 3, SumaRiemmanRn(a,b,n,g);
   % case 4, SumaRiemmanTn(a,b,n,g);
  %  case 5, Sn13(a,b,n,g);
 %   otherwise, fprintf("Ingresa una opcion valida \n");
%
%end
%SumaRiemmanTn(0,5,10,f)
%SumaRiemmanTn(-6,6,600,f)
%Rn(-5,5,200,f);
Sn13(0,19.5,500,f);
%SumaRiemmanLn(1,5,40,@(x) x.^2.*log(x));
%Rn(1,5,40,@(x) x.^2.*log(x));
SumaRiemmanTn(0,19.5,500,f)
%a=SumaRiemmanTn(0,21,500,@(x) -4.*10.^(-6).*x.^6+.0003.*x.^5-0.0067.*x.^(4)+0.0855*x.^3-0.5096.*x.^2+1.1382*x+10.864);
%a=SumaRiemmanTn(0,21,500,@(x)-4*10.^(-6)x.^6+.0003x.^5-0.0067x.^(4)+0.0855x.^3-0.5096x.^2+1.1382x+10.864);
%b=SumaRiemmanTn(0,21,500,@(x)4*10.^(-6)x.^6-.0003x.^5+0.0072x.^(4)-0.0838x.^3+0.4464x.^2-.8402x+4.5946);
%b=SumaRiemmanTn(0,20.5,500,@(x)4.*10.^(-6).*x.^6-.0003.*x.^5+0.0072.*x.^(4)-0.0838*x.^3+0.4464.*x.^2-.8402*x+4.5946);

%volumen=a-b;
%fprintf("El volumen es de %f \n",a);

function Rn(a,b,n,f)

dx=(b-a)/n;

A=0;
for k=1:n
    xk=a+dx*k;
    A=A+dx*f(xk);
end

fprintf("Suma Riemman derecha:%f\n",A);

end

function SumaRiemmanLn(a,b,n,f)

dx=(b-a)/n;

A=0;
for k=1:n
    xk=a+dx*k;
    A=A+dx*f(xk-dx);
end

fprintf("Suma Riemman izquierda:%f\n",A);

end

function SumaRiemmanMn(a,b,n,f)

dx=(b-a)/n;

%Metodo de MN
A=0;
for k=1:n
    xk=a+dx*k;
    A=A+dx*f(xk-dx/2);
end

fprintf("Suma Punto Medio :%f\n",A);

end

function SumaRiemmanTn(a,b,n,f)

dx=(b-a)/n;

%Metodo de TN
A=0;
for k=1:n
    xk=a+dx*k;
    A=A+dx*(f(xk-dx)+f(xk))/2;
end

fprintf("Suma TN:%f\n",A);

end



function Sn13(a,b,n,f)
dx=(b-a)/n;
xd=a+dx:dx:b;
xiz=a:dx:b-dx;
xm=a+dx/2:dx:b-dx/2;
A=dx*(f(xiz)+4*f(xm)+f(xd));
fprintf("La integral con Simpson es :%f \n",sum(A)/6);
end
