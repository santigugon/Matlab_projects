function ITXVA = testrk(fa, xi, vxi, tf, ncalc, nview)
ncalc = round(ncalc);
if ncalc < 1
ITXVA = NaN;
return;
end
h = tf / ncalc;
t = 0;
x = xi;
v = vxi;
a = fa(t, xi, vxi);
nview = min(ncalc, round(max(1, nview)));
step = round(ncalc / nview);
ITXVA = zeros(nview + 1, 5);
iv = 1;
ITXVA(1, :) = [0, t, xi, vxi, a];
for i = 1:ncalc
k1 = h * v;
l1 = h * a;
k2 = h * (v + 0.5*l1);
l2 = h * fa(t + h/2, x + k1/2, v + l1/2);
k3 = h * (v + 0.5*l2);
l3 = h * fa(t + h/2, x + k2/2, v + l2/2);
k4 = h * (v + l3);
l4 = h * fa(t + h, x + k3, a + l3);
t = t + h;
x = x + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
v = v + (1/6)*(l1 + 2*l2 + 2*l3 + l4);
a = fa(t, x, v);
if mod(i, step) == 0
iv = iv + 1;
ITXVA(iv, :) = [i, t, x, v, a];
end
end
ITXVA(end, :) = [ncalc, t, x, v, a];
end