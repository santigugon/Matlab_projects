% Datos
x = [0, 1, 2.5, 3.5, 4, 5.3];
y = [3, 2, 3, 5.5, 6.4, 4.6];

% Ajuste del modelo y = a + b/x
X = x;     % Mantenemos los datos de x sin transformación
Y = y;     % Mantenemos los datos de y sin transformación

% Regresión lineal
A = [ones(length(X), 1), 1./X'];  % Matriz de diseño
coeffs = A \ Y';                   % Cálculo de los coeficientes a y b

a = coeffs(1);  % Coeficiente a
b = coeffs(2);  % Coeficiente b

% Cálculo de la suma de errores cuadrados (SSE)
y_predicted = a + b ./ x;  % Valores predichos
SSE = sum((y - y_predicted).^2);

% Mostrar la suma de errores cuadrados
disp(['La suma de errores cuadrados (SSE) es: ', num2str(SSE)]);

% Gráfica con datos y modelo
plot(x, y, 'ro', 'MarkerSize', 8);  % Datos originales en rojo
hold on;
plot(x, y_predicted, 'b-', 'LineWidth', 1.5);  % Modelo en azul
xlabel('x');
ylabel('y');
title('Ajuste del modelo y = a + b/x');
legend('Datos originales', 'Modelo');

% Imprimir la ecuación con los coeficientes
disp(['Ecuación del modelo: y = ', num2str(a), ' + ', num2str(b), '/x']);
