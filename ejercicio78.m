%%Ejericicio 7
A=[3 8 2 3;3 1 3 9;8 8 6 3;5 7 3 9];
A*A;
A.*A;
A\A;
A./A;
det(A);
inv(A);

%%fprintf("A*A= %f, A.*A= %f, A/A= %f A./A= %f, determinacion de A= %f, Matriz Inversa= %f   \n",A*A,A.*A,A\A,A./A,det(A),inv(A));
%%A*A Multiplicacion Matricial A.*A Multiplicacion por el elemento de la matriz en la misma posicion 
% A/A Division matricial A./A Division por los elementos en la misma posicion
% ,det(A) Hace una determinacion de la matriz,inv(A) Despliega la matriz
% inversa

%%Ejercicio 8
x=@(vi,o,t) vi*cos(o*pi/180)*t;
y=@(vi,o,t,g) vi*sin(o)*t-1/2*g*t^2;
r=@(a,b) sqrt((a^2)+(b^2));
tgt=@(x5,y5) atan(y5/x5);

x1=x(162,70,1);
x2=x(162,70,6);
x3=x(162,70,11);
x4=x(162,70,46);

y1=y(162,70,1,9.81);
y2=y(162,70,6,9.81);
y3=y(162,70,11,9.81);
y4=y(162,70,46,9.81);

r1=r(x1,y1);
r2=r(x2,y2);
r3=r(x3,y3);
r4=r(x4,y4);

tgt1= tgt(x1,y1);
tgt2= tgt(x2,y2);
tgt3= tgt(x3,y3);
tgt4= tgt(x4,y4);



