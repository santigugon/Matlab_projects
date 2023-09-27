function IXYD = ode_rk2(f1,xi,yi,xf,ncalc,nview)
% rk1 find yf=f(xf) from ODE dy/dx=f1(x,y)
% with initial value (xi,yi) in ncalc steps
% This is a modification of ode_euler to Runge Kutta 2
% save nview partial results: [ i x y dy/dx ]

  ncalc=round(ncalc);
  if ncalc<1 IXYD=NaN; return; end
  h=(xf-xi)/ncalc; x=xi; y=yi;
  k1=f1(xi,yi);  % k1=dy/dx=f1(x,y)=f'(x,y)
    
  nview=min(ncalc,round(max(1,nview)));
  step=round(ncalc/nview);
  IXYD=zeros(nview+1,4); iv=1;
  IXYD(1,:)=[0 xi yi k1];
  
  for i=1:ncalc
    k2=f1(x+h,y+k1*h);
    x=xi+h*i ; y=y+h*(k1+k2)/2 ; k1=f1(x,y);
    if mod(i,step)==0
        iv=iv+1;  IXYD(iv,:)=[i x y k1];
    end
  end
  IXYD(end,:)=[ncalc x y k1];
end

