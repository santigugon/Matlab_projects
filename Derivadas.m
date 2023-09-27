
syms x y; %Variables simbolicas lo que significa que estas variables pueden tomar CUALQUIER valor y no tenemos que asignar un valor especifico
f=x*y^2-sin(x);%Asignacion
diff(f,x);
diff(f,y);


H=@(x) x.*sin(sqrt(x.^2-25)); %Esta es nuestra función de incognita

syms x y;
%f=x*sin(sqrt(x^2-25));%Asignamos ecuaciones
f=x+y^4-sin(x);

g=inline(f);

TercerDerivada(f);



function TercerDerivada(f)

syms x y; 

fprintf("La tercer derivada en x es ");
g=diff(f,x,x,x)%Con esto obtenemos la segunda derivada

fprintf("La tercer derivada en y es ");
g=diff(f,y,y,y)%Con este obtenemos la tercer derivada en Y

%fprintf("La tercer derivada en x es, %f  La tercer derivada en y es %",tercerderivadax,tercerderivadax);

g=inline(g)%Convierte a variable funcion de incognito
%Cuando necesitas que una expresión algebraica sea evaluada
%recurrentemente, muchas funciones en Matlab reciben como entrada este tipo
%de funciones 

end

