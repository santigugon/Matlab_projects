x=input("Ingresa x ");
y=input("Ingresa y ");
r=x*y+2*y;
fprintf("xy+2y es igual a %f\n ",r);



z = input("Dame el radio de circulo: ");
A = 3.1416*z^2;
fprintf("El area es de %f\n", A)

B=input("Dame la magnitud del vector ");
theta= input("Dame el angulo del vector ");
theta=theta*pi/180;
Bx=B*cos(theta);
By=B*sin(theta);
fprintf("La magnitud x es %f\nLa magnitud de y es %f\n",Bx,By);