T=linspace(-4*pi, 4*pi,200);
X=cos(T); Y=sin(T); Z=T/10;
plot3(X,Y,Z,"m-")
axis equal; grid on

hold on
comet3(X,Y,Z)