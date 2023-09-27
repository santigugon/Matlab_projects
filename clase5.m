%Clase 5
A=-2:2:2000; %%Lista del -2 al 2000 de 2 en 2
B=(-2:2:2000)';%%PONEMOS LA TRASPUESTA QUE ES EL PEQUEÑO APOSTROFE, sirve para cambiar renglones a columnas
length(B);%%Sirve para arreglos
length(A);
size(A);%%Sirve para matrices
size(B);
C=A(1:20);%%Esto nos genera un array del Array B, que nos muestra entonces los primeros 20 elementos de A
A(length(A));%%Nos da el ultimo elemento de A
A(end-4:end);%%END Sirve para visualizar el ultimo elemento, aqui vamos a imprimir los ultimo 5 elementos

A2=-2:0.1:2;
B2=sin(A);%%Calcula el seno de cada numero de la lista en radianes
C2=5*A;%%Multiplica todos los valores de A por 5
D=(5*A)*(sin(A))';%%Aqui tranversamos la seguna matriz para que la multiplicacion sea 1*42 42*1 y coincidan los centros
D2=5*A.*(sin(A));%%En este caso NO transversamos ya que el .* se caracteriza por multiplicar elemento por su otro elemento en la misma posicion, no matricial
D3=[2,5,7,9];
E=[4,7,0,-2];
D3.*E; %%Aqui multiplicamos por dos elementos y al tener la misma longitud ambas no nos arroja error

M= [[2,3,4];[3,5,8];[3,5,8]];%% USAMOS El ; PARA SEPARAR POR RENGLONES CADA ARREGLO, esta seria una matriz 3*3
A3=M(1,3);%% Tomamos el elemento del renglon 1 y de la columna 3
