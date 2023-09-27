T = linspace(0, 12*pi, 1000);
R = 8; % The radius of the large circle
r = 2; % The radius of the small circle
d = 4; % The distance from the center of the small circle to the drawing point
n = 15; % The number of rotations

X = (R-r) * cos(n * T) + d * cos(((R-r)/r) * n * T);
Y = (R-r) * sin(n * T) - d * sin(((R-r)/r) * n * T);

plot(X, Y);
grid on
axis equal;