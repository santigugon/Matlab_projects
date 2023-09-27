syms x y; %Variables simbolicas lo que significa que estas variables pueden tomar CUALQUIER valor y no tenemos que asignar un valor especifico
f=x*y^2-sin(x);%Asignacion
diff(f,x)
diff(f,y)

g=inline(f)

syms x y;
f=x*sin(sqrt(x^2-25))%Asignamos ecuaciones
g=diff(f,x,x)%Con esto obtenemos la segunda derivada
g=inline(g)%Convierte a variable funcion de incognito
%Cuando necesitas que una expresión algebraica sea evaluada
%recurrentemente, muchas funciones en Matlab reciben como entrada este tipo
%de funciones 

H=@(x) x.*sin(sqrt(x.^2-25)); %Esta es nuestra función de incognita
integral(H,0,4)

matriz([1,2;3,4])