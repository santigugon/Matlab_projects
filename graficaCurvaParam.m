T=linspace(0,12*pi,1000);
S=exp(cos(T)-2*cos(4*T)-sin(T/12).^5);
X=S.* sin(T);
Y=S .* cos(T);
plot(X,Y);
axis equal
