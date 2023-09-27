%A=[2 -1;1 3];
%B=[5 ; 13];

%A=[1 -2; -3 6];
%B=[-2;-4];


%simeq_2x2(A,B)

function [X,determ]=funcionSimEq(A,B)
determ=A(1,1)*A(2,2)-A(2,1)*A(1,2);
if size(A,1)==2 && size(A,2)==2 && size(B,1)==2 && size(B,2)==1 && determ~=0
Ai=adjoint(A)*(1/determ);

X=Ai*B
determ
elseif size(B,1)~=2
X=[0/0;0/0]

d=0/0
elseif determ==0
X=[0/0;0/0]
d=0


end
end




