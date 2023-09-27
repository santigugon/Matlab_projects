% Parámetros del circuito RLC
R = 100;      % Resistencia (Ohms)
L = 0.001;    % Inductancia (Henrios)
C = 1e-6;     % Capacitancia (Faradios)
tspan = [0, 0.1]; % Intervalo de tiempo (segundos)

% Función V(t) - Voltaje en función del tiempo (puedes cambiarla según el problema)
V = @(t) 10 * sin(2 * pi * 1000 * t);

% Sistema de ecuaciones diferenciales de primer orden
odefun = @(t, x) [x(2); (V(t) - R * x(2) - (1/C) * x(1)) / L];

% Condiciones iniciales (puedes cambiarlas según el problema)
x0 = [0; 0];

% Resolver el sistema de ecuaciones diferenciales
[t, x] = ode45(odefun, tspan, x0);

% Graficar las soluciones
figure
plot(t, x(:, 1), 'r', 'LineWidth', 2)
hold on
plot(t, x(:, 2), 'b', 'LineWidth', 2)
xlabel('Tiempo (s)')
ylabel('Soluciones')
legend('Corriente i(t)', 'Derivada di/dt')
title('Soluciones numéricas de un circuito RLC serie')
grid on