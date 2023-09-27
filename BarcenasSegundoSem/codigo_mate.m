X=pi*(-2:0.1:2); Y=X';
F= sin(X)+cos(Y);
[Px,Py]=gradient(F);
quiver(X,Y,Px,Py); hold on;
axis equal; contour(X,Y,F);