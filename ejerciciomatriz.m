
syms x y z
eqn1=3*x+2*y-z==-7;
eqn2=6*x-y+3*z==-4;
eqn3=x+10*y-2*z==2;

[A,B] = equationsToMatrix([eqn1, eqn2, eqn3], [x, y, z])


A=[3 2 -1;6 -1 3; 1 10 -2];
B=[-7 ;-4 ;2];
C=inv(A)*B


