syms x

a=input("Dame el limite inferior ");
b=input("Dame el limite superior ");
fun=input("Dame la funcion ","s");
f=inline(fun);%%Inline convierte sumbolos a una función, Al teclear una funcion NO PODEMOS USAR ESPACIO Y USAR SINTAXIS DE MATLAB
g=@(x) f(x)
fprintf("El resultado de la integral es:%f",integral(g,a,b));
