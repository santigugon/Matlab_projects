%%Ecuaciones parametricas
vo=22;
theta=30*pi/180;
g=9.8;
for t=0:0.01:3%%Para hacer una impresion mas cercana de los puntos
x=vo*cos(theta)*t;
y=vo*sin(theta)*t-.5*g*t.^2;

if y<0  %%Para evitar que la grafica baje de 0
    break;
end
plot(x,y,'-r o'); hold on;
end
%%Movimiento circular
t=0:0.1:3;
r=5;
w=20;
x=r*cos(w*t);
y=r*sin(w*t);
plot(x,y,"k .")
