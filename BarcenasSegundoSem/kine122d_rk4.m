function ITXVA = kine122d_rk4(f2, xi, vxi, tf, ncalc, nview)
% Cinemática en una dimensión usando RK4
% f2 : función de aceleración x de (t,x, vx)
% xi : Posición inicial x
% vxi : Velocidad inicial x
% tf : Tiempo final
% ncalc : Número de pasos
% Guarda los resultados parciales de nview: [ i t x vx a ]
ncalc = round(ncalc);
if ncalc < 1
ITXVA = NaN;
return;
end
h = tf / ncalc; % Tamaño de paso
t = 0; % Tiempo
x = xi; % Posición
v = vxi; % Velocidad
a = f2(t, xi, vxi); % Aceleración
nview = min(ncalc, round(max(1, nview))); % Cantidad de iteraciones para
%visualizar
paso = round(ncalc / nview);
ITXVA = zeros(nview + 1, 5); % Resultados
iv = 1;
ITXVA(1, :) = [0, t, xi, vxi, a]; % Resultados iniciales
for i = 1:ncalc
% Pendientes RK4, k implica velocidad, l implica aceleración
k1 = h * v;
l1 = h * a;
k2 = h * (v + 0.5 * l1);
l2 = h * f2(t + h/2, x + k1/2, v + l1/2);
k3 = h * (v + 0.5 * l2);
l3 = h * f2(t + h/2, x + k2/2, v + l2/2);
k4 = h * (v + l3);
l4 = h * f2(t + h, x + k3, v + l3);
t = t + h;
x = x + (1/6) * (k1 + 2 * k2 + 2 * k3 + k4);
v = v + (1/6) * (l1 + 2 * l2 + 2 * l3 + l4);
a = f2(t, x, v);
if mod(i, paso) == 0
iv = iv + 1;
ITXVA(iv, :) = [i, t, x, v, a];
end
end
ITXVA(end, :) = [ncalc, t, x, v, a];
end