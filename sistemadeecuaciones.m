M=[[-4,3,1];[5,6,-2];[2,-5,4.5]]; %%Escribimos la matriz
B=[-18.2,-48.8,92.5]';%%AQUI PONEMOS LOS COEFICIENTES DE X,Y,Z
X=M^(-1)*B %%AQUI HACEMOS LA MULTIPLICACION;

X2=0:0.1:5; %%Ponemos el dominio
Y2=5*X2.*sin(X2); %%Ponemos el rango
plot(X2,Y2,"b");%%Dominio,rango, color Y SE GRAFICA, REVISAR DOC PARA + DETALLES

