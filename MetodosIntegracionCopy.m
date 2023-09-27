
a=0;
b=5;
n=8;

op=input("1.-Ln \n 2.- Mn\n 3.-Rn \n 4.-Tc \n 5.-Sn13 \n Opcion");
b=input("Ingresa el limite superior: ");
n=input("Dame el numero de partes: ");
g=input("Dame la funcion(x): ","s");
f=inline(g);

switch(op)
    case 1,SumaRiemmanLn(a,b,n,f);
    case 2, SumaRiemmanMn(a,b,n,f);
    case 3, SumaRiemmanRn(a,b,n,f);
    case 4, SumaRiemmanTn(a,b,n,f);
    case 5, Sn13(a,b,n,f);
    otherwise, fprintf("Ingresa una opcion valida \n");
end
%SumaRiemmanLn(1,5,40,@(x) x.^2.*log(x));
%SumaRiemmanRn(1,5,40,@(x) x.^2.*log(x));
%SumaRiemmanMn(1,5,40,@(x) x.^2.*log(x));
%SumaRiemmanTn(1,5,40,@(x) x.^2.*log(x));
%Sn13(0,1,40,@(x) x.^3); 

function SumaRiemmanRn(a,b,n,f)

dx=(b-a)/n;

%Metodo de LN
A=0;
for k=1:n
    xk=a+dx*k;
    A=A+dx*f(xk);
end

fprintf("El resultado de la suma Riemman derecha es :%f\n",A);

end

function SumaRiemmanLn(a,b,n,f)

dx=(b-a)/n;

%Metodo de LNMi
A=0;
for k=1:n
    xk=a+dx*k;
    A=A+dx*f(xk-dx);
end

fprintf("El resultado de la suma Riemman izquierda es :%f\n",A);

end

function SumaRiemmanMn(a,b,n,f)

dx=(b-a)/n;

%Metodo de MN
A=0;
for k=1:n
    xk=a+dx*k;
    A=A+dx*f(xk-dx/2);
end

fprintf("El resultado de la suma Punto Medio es :%f\n",A);

end

function SumaRiemmanTn(a,b,n,f)

dx=(b-a)/n;

%Metodo de TN
A=0;
for k=1:n
    xk=a+dx*k;
    A=A+dx*(f(xk-dx)+f(xk))/2;
end

fprintf("El resultado de la suma TN es :%f\n",A);

end



function Sn13(a,b,n,f)
dx=(b-a)/n;
xd=a+dx:dx:b;
xiz=a:dx:b-dx;
xm=a+dx/2:dx:b-dx/2;
A=dx*(f(xiz)+4*f(xm)+f(xd));
fprintf("La integral es :%f",sum(A));
end
