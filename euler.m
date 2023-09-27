
%%Metodo de EULER
xo=0;
yo=40;
f=@(x,y) .1*y-0.00025*y^2;
x=100;
h=0.5;
for x1=xo:h:x
    y1=yo+f(xo,yo)*h; %%POnemos la formula del metodo de EULER
    plot(x1,y1,'b .');hold on;
    xo=y1; yo=y1;  %%De esta menra tomamos el valor anterior para evitar poner x1,x2,x3,etc
end

%%Metodo de EULER
xo=0;
yo=20;
k=0.1;
K=500;
f=@(x,y) k*y*(1-y/K);
x=100;
h=0.5;
for x1=xo:h:x
    y1=yo+f(xo,yo)*h; %%POnemos la formula del metodo de EULER
    plot(x1,y1,'r .');hold on;
    xo=y1; yo=y1;  %%De esta menra tomamos el valor anterior para evitar poner x1,x2,x3,etc
end