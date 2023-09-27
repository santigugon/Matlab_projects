x=3;
if (x==4)
    fprintf("Condición cumplidad \n");
else
    fprintf("Condicion no cumplida \n");
end

%%Comando SWITCH
n=input("Dame el dia de la semana: ");
switch n
    case 1; fprintf("El dia es lunes \n");
    case 2; fprintf("El dia es Martes \n");
    case 3; fprintf("El dia es Miercoles \n");
    case 4; fprintf("El dia es Jueves \n");
    case 5; fprintf("El dia es Viernes \n");
    case 6; fprintf("El dia es Sabado \n");
    case 7; fprintf("El dia es Domingo \n");
    otherwise; fprintf("La semana solo tiene 7 dias \n");
end

%%Ciclo For
for n=2:3:20
    if mod(n,4)==0
        fprintf("El cuadrado de %d es %d \n",n,n^2)
    end
end
%%WHILE
n=2;
while(n<=20)
    if mod(n,4)==0
        fprintf("El cuadrado de %d es %d \n",n,n^2)
    end
    n=n+3;
end
