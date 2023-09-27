T = linspace(0, 12*pi, 1000);
R = 5; % The radius of the large circle
r = 3; % The radius of the small circle
d = 4; % The distance from the center of the small circle to the drawing point

X = (R-r) * cos(T) + d * cos(((R-r)/r) * T);
Y = (R-r) * sin(T) - d * sin(((R-r)/r) * T);

% Escalar la estrella
X = 0.6 * X;
Y = 0.6 * Y;

% Crear los elementos de la cara (ojos y boca)
theta_ojo = linspace(0, 2*pi, 100);
theta_boca = linspace(pi, 2*pi, 100);
radio_ojo = 0.3;
radio_boca = 1.2;

X_ojo_izquierdo = radio_ojo * cos(theta_ojo) - 1.5;
Y_ojo_izquierdo = radio_ojo * sin(theta_ojo) + 3;

X_ojo_derecho = radio_ojo * cos(theta_ojo) + 1.5;
Y_ojo_derecho = radio_ojo * sin(theta_ojo) + 3;

X_boca = radio_boca * cos(theta_boca);
Y_boca = 0.3 * radio_boca * sin(theta_boca) + 0.5; % Trasladar la sonrisa hacia abajo

% Dibujar la estrella y los elementos de la cara
plot(X, Y, X_ojo_izquierdo, Y_ojo_izquierdo, X_ojo_derecho, Y_ojo_derecho, X_boca, Y_boca);
axis equal;

