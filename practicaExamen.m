%a=input("Ingresa punto inferior: ");
%b=input("Ingresa punto superior: ");
%n=input("Ingresa el numero de recuadros: ");

%g=input("Dame la funcion inferior(x): ","s");
%g=inline(g);

%f=input("Dame la funcion superior(x): ","s");
%f=inline(f);

a=0;
b=1;
n=50;
%g=@(x)x.^3;
f=@(x)x.^(1/3);





superiorTn=SumaRiemmanTn(a,b,n,f);
inferiorTn=SumaRiemmanTn(a,b,n,g);
AreaTn=superiorTn-inferiorTn;

superiorSn=Sn13(a,b,n,f);
inferiorSn=Sn13(a,b,n,g);
AreaSn=superiorSn-inferiorSn;

fprintf("El area del trapecio es de %f \n", AreaTn);
fprintf("El area con Simpson es de %f \n", sum(AreaSn)/6);

xg=@(x)(x.^3).*x;
xf=@(x)x.^(1/3).*x;
superiorTnx=SumaRiemmanTn(a,b,n,xf);
inferiorTnx=SumaRiemmanTn(a,b,n,xg);
CentroideTnx=(superiorTnx-inferiorTnx)./AreaTn;

fprintf("El centroide X es %f \n",CentroideTnx);

prismaRect(10,5,20);
r=input("ingresa el r de la esfera ");
z=input("ingresa la z de la esfera ");
costoCilindrico=4*pi*r*18;
fprintf("El costo cilindrico es de %f \n",costoCilindrico);


%yf=f.^2;


%yg=g.^2;



function SumaRiemmanRn(a,b,n,f)

dx=(b-a)/n;

A=0;
for k=1:n
    xk=a+dx*k;
    A=A+dx*f(xk);
end

fprintf("Suma Riemman derecha:%f\n",sum(A));

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

function A=SumaRiemmanTn(a,b,n,f)

dx=(b-a)/n;

%Metodo de TN
A=0;
for k=1:n
    xk=a+dx*k;
    A=A+dx*(f(xk-dx)+f(xk))/2;
end

%fprintf("Suma TN:%f\n",A);
return 
end



function A=Sn13(a,b,n,f)
for k=1:n
dx=(b-a)/n;
xd=a+dx:dx:b;
xiz=a:dx:b-dx;
xm=a+dx/2:dx:b-dx/2;
A=dx*(f(xiz)+4*f(xm)+f(xd));
end
fprintf("La integral con simpson es :%f",sum(A)/6);
end

function prismaRect(x,y,z)
areaTapas=x*y;
areaLadosx=x*z*2;
areaTapasy=y*z*2;
Areatotal=areaTapasy+areaLadosx+areaTapas;
fprintf("El costo a pagar es de, %f \n ",Areatotal*18);
end

