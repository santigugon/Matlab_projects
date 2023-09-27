%%Ejercicio 1
p=@(x,c,d) (c*x-2*d)/(c*x-d);
fprintf("valor1= %f, valor2= %f, valor3= %f \n",p(4,1,2),p(4,5,10),p(1,3,20));

q=@(x,y,z) 2*log10(x)+cos(pi)+abs(y^2-z^2)+sqrt(5*y*z);
fprintf("valor1= %f, valor2= %f, valor3=%f \n",q(4,1,2),q(4,5,10),q(1,3,20));

%%Ejercicio 2
f = @(L,c,R) sqrt((1/(L*c))-(R^2/4*c^2));
fprintf("Valor1= %f, valor 2= %f\n",f(0.00001,0.3,100),f(.00001,0.8,100));