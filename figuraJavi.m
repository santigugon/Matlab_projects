T = linspace(0, 13*pi, 500);
R = 1; 
r = 0.3; 
p = 0.7; 

theta = R/r * T;
X = (R-r) * cos(T) + p * cos(theta);
Y = (R-r) * sin(T) - p * sin(theta);

grid on
plot(X, Y);
axis equal;