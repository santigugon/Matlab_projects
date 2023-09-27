
function [X,d]=simeq_gelim_np(A,B)
signoDet=1;
%Eliminacion Gaussiana con pivote
AB=[A B];[r,c]=size(AB);%Matriz aumentada
for k=1:r-1 %Eliminacion delantera
    for i=k+1:r
        if AB(k,k)~=0
            AB(i,k:c)=AB(i,k:c)-AB(i,k)*AB(k,k:c)/AB(k,k);
       else
            AB([k k+1], :) = AB([k+1 k], :);
            signoDet=signoDet*-1;
        end
    end
end
d=1*signoDet; for i=1:r d=d*AB(i,i); end %Determinante
if d~=0 %Sustitucion trasera
    for i=1:r; AB(i,i:c)=AB(i,i:c)/AB(i,i);end
    for k=r:-1:2
        for i=k-1:-1:1
            AB(i,k:c)=AB(i,k:c)-AB(i,k)*AB(k,k:c);
        end
    end
    X=AB(:,r+1:c);
else
    X=NaN;
end
end
