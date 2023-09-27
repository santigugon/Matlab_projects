grad(1.5)
M=[2 4 ;-6 7];
determinante(M)
graficasCos(10,10,0:0.001:2*pi);

function w= grad(x)
    w=x*180/pi;
end

function w=determinante(M)
    w=M(1,1)*M(2,2)-M(1,2)*M(2,1);
end

function graficasCos(A,a,x)
y=A*cos(a*x);
plot(x,y, "LineWidth",1.5,"MarkerSize",10);
hold on;
title("Acos(ax)")
xlabel("x");
ylabel("y");
end