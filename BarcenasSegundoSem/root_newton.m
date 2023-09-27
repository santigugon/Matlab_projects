function [x, fx, i, I] = root_newton(f,x,v)
% Solve f(x)=v starting at x using Newton-Raphson
% Partial results [i x f(x) f'(x) err_approx]

  tolx=0 ; toly=1 ;   %  Tolerance X & Y
  
  f1=matlabFunction(diff(sym(f))); %  Derivative
  fx=f(x); f1x=f1(x);
  I=zeros(9999,5); I(1,:)=[0 x fx f1x NaN];
  for i=2:99999  % Cambiar a valor más razonable
    xp=x ; x=x-(fx-v)/f1x; fx=f(x); f1x=f1(x);
    I(i,:)=[i-1 x fx f1x (x-xp)/x];
    if isapprox(x, xp, tolx)
        I(i+1:end,:)=[]; i=i-1; break;
    end
  end
  if ~isapprox(v, fx, toly) x=NaN ; end
end


