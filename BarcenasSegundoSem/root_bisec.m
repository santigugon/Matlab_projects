function [x, fx, i, I] = root_bisec(f,a,b,v)
% Solve f(x)=v in [a,b] also returns iterations
% Partial results [i a b x f(x) err_approx]

  tolx=0 ; toly=1e-8 ;   %  Tolerance X & Y
  
  xp=NaN; x=NaN; fx=NaN; i=NaN; I=NaN;
  sfa=sign(f(a)-v); sfb=sign(f(b)-v);
  if sfa ~= sfb
      I=zeros(2100,6);
      for i=1:2100
          xp=x ; x=(a+b)/2 ; fx=f(x);
          I(i,:)=[i a b x fx (x-xp)/x];
          if isapprox(x, xp, tolx)
              I(i+1:end,:)=[]; break;
          end
          if sign(fx-v)==sfa a=x ;
          else b=x ; end
      end
  end
  if ~isapprox(v, fx, toly) x=NaN ; end
end

