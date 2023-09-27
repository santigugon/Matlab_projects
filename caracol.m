theta = linspace(0,10*pi,3000);
r = .1-1*(theta);
x = r.*cos(theta)-30;
%x2=finverse(x);
%y2=finverse(y);
y = r.*sin(theta);
plot(x,y,'r')
axis equal