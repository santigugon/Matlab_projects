A=[2 3 4 8];
local(A);

x=input("Ingresa x porfavor: ");
y=input("Ingresa y porfavor: ");
V=[x,y];

funcion_incognito=sqrt(V(1).^2+V(2).^2);
fprintf("La magnitud de V es= %f \n",funcion_incognito);


function local(A)
resultado=sum(A);
fprintf("El resultado de la lista es %f, \n", resultado);
end