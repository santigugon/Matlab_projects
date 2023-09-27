% Crear un vector con las coordenadas de los puntos que forman la figura
x = [0 1 1 -1 -1 3 3 -2 -2 -3 -2 -1 -2];
y = [0 0 1 1 -1 -1 2 2 -4 -3 -2 -3 -4];

% Graficar la figura original
plot(x, y, '-o');
axis equal; % Ajustar la escala de los ejes para que se vea correctamente

% Definir el ángulo de rotación en radianes
angulo = -pi/4;

% Crear la matriz de rotación usando la fórmula general
matriz_rotacion = [cos(angulo), -sin(angulo); sin(angulo), cos(angulo)];

% Multiplicar la matriz de rotación por las coordenadas de la figura para obtener las nuevas coordenadas rotadas
coordenadas_rotadas = matriz_rotacion * [x; y];

% Obtener los vectores X e Y de las nuevas coordenadas
x_rotado = coordenadas_rotadas(1, :);
y_rotado = coordenadas_rotadas(2, :);

% Graficar la figura rotada
hold on; % Mantener la figura original en la misma gráfica
plot(x_rotado, y_rotado, '-o');
legend('Original', 'Rotado');