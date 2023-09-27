h=(3*pi)/2;   % Height of solid
nt=80;  % Number of points around θ
nz=50;   % Number of points along z
Z=linspace(0,h,nz); R=zeros(1,nz);
  % Inside function

G = 2+sin(T);    % Outside function


[Xi,Yi,Zi] = cylinder(F,nt); Zi=h*Zi;
[Xo,Yo,Zo] = cylinder(G,nt); Zo=h*Zo;
X=[Xi Xo]; Y=[Yi Yo]; Z=[Zi Zo];

clf; surf(X,Y,Z); axis equal;
xlabel('x'); ylabel('y'); zlabel('z');
title(['nt=',num2str(nt),'  nz=',num2str(nz)])

stlwrite('jarron.stl', X, Y, Z, 'TRIANGULATION','x');