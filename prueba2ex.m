%B)

funcion_incognito=@(x,y) sqrt(x.^2+y.^2);%Creamos nuestra funcion de incognito
fprintf("La magnitud de V es= %f \n",funcion_incognito(3,9));%Imprimos el resultado

A=[2 3 4 6];%Nuestro arreglo de prueba
local(A);% Llamamos la funcion
function local(A)%Aqui declaramos la funcion 
resultado=sum(A);%El resultado es igual a la suma de los elementos del arreglo
fprintf("El resultado de la lista es %f, \n", resultado);%Imprimimos nuestro resultado %con formato
end%Finalizamos la funcion