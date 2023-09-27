

A=[16 10 13 2; 8 5 6 1;11 7 12 3;14 9 15 4]
Ar=A
B=[9;2;-2;1]
C=A\B
%Intercambio de filas
%A=[16 10 13 2;11 7 12 3;8 5 6 1;14 9 15 4]
%B=[9;-2;2;1]
%Matriz extendida
AB=[A B]
AB([2 3], :) = AB([3 2], :);

AB(2,1:5)=AB(2,1:5)-AB(2,1)*AB(1,1:5)/AB(1,1)
AB(3,1:5)=AB(3,1:5)-AB(3,1)*AB(1,1:5)/AB(1,1)
AB(4,1:5)=AB(4,1:5)-AB(4,1)*AB(1,1:5)/AB(1,1)

AB(3,2:5)=AB(3,2:5)-AB(3,2)*AB(2,2:5)/AB(2,2)
AB(4,2:5)=AB(4,2:5)-AB(4,2)*AB(2,2:5)/AB(2,2)
AB(4,3:5)=AB(4,3:5)-AB(4,3)*AB(3,3:5)/AB(3,3)
%AB(4,3:5)=AB(4,3:5)-AB(4,3)*AB(4,3:5)/AB(3,3)





%Calculo de determinante
det=-1 %Cambio de signo por cambio de filas
det=det*AB(1,1)
det=det*AB(2,2)
det=det*AB(3,3)
det=det*AB(4,4)

%DIAGONAL PRINCIPAL
AB(1,1:5)=AB(1,1:5)/AB(1,1)
AB(2,2:5)=AB(2,2:5)/AB(2,2)
AB(3,3:5)=AB(3,3:5)/AB(3,3)
AB(4,4:5)=AB(4,4:5)/AB(4,4)

%Sustitucion Trasera
AB(3,4:5)=AB(3,4:5) - AB(3,4)*AB(4,4:5)
AB(2,4:5)=AB(2,4:5) - AB(2,4)*AB(4,4:5)
AB(1,4:5)=AB(1,4:5) - AB(1,4)*AB(4,4:5)
AB(2,3:5)=AB(2,3:5) - AB(2,3)*AB(3,3:5)
AB(1,3:5)=AB(1,3:5) - AB(1,3)*AB(3,3:5)
AB(1,2:5)=AB(1,2:5) - AB(1,2)*AB(2,2:5)

X=AB(:,5)

Comprobacion=Ar\B


