
%%Método de euler
xo = 0;
yo = 0;
Fo = 400;
b = .35;
m = 78;
f = @(x,y) (Fo - b*y)/m;
x = 800;
h = 0.1;
for x1 = xo:h:x
    y1 = yo +f(xo,yo)*h;
    fprintf('%f %f\n', x1 + h, y1);
    xo = x1 ; yo = y1;
    plot(x1+h,y1,'.b'); hold on;
end