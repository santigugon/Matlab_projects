h=11.4;   % Height of solid
nt=50;  % Number of points around θ
nz=50;   % Number of points along z
T=linspace(0,3*pi,nz);
R=linspace(0,4*pi,nz);
F = 1.9 + sin(T)+T.^(1/2);  % Inside function
%volumen=integral(F,0,h);
G = 3 + cos(T)-T.^(1/2);    % Outside function

%fprintf("El volumen de la copa es %f\n", volumen);

[Xi,Yi,Zi] = cylinder(F,nt); Zi=h*Zi;
[Xo,Yo,Zo] = cylinder(G,nt); Zo=h*Zo;
X=[Xi Xo]; Y=[Yi Yo]; Z=[Zi Zo];

clf; surf(X,Y,Z); axis equal;
xlabel('x'); ylabel('y'); zlabel('z');
title(['nt=',num2str(nt),'  nz=',num2str(nz)])

stlwrite('copa.stl', X, Y, Z, 'TRIANGULATION','x');
