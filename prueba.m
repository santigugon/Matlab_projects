f=@(a,x,b,d) (a*x-b)/(c*x-d);

graficaReto()

function graficaReto(a,x,b,d)
y=A*sin(a*x);
plot(x,y, "LineWidth",1.5,"MarkerSize",10);
hold on;
title("Asin(ax)")
xlabel("x");
ylabel("y");
end