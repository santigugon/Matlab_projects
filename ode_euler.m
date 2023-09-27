function XY = ode_euler(f1,xi,yi,xf,n)

% rk1 find yf=f(xf) from ODE dy/dx=f1(x,y)

% with initial value (xi,yi) in n steps

% Save all partial results: [ i x y dy/dx ]

 

  h=(xf-xi)/n; x=xi; y=yi;

  k1=f1(xi,yi);  % k1=dy/dx=f1(x,y)=f'(x,y)

  XY=zeros(n+1,4);  XY(1,:)=[0 xi yi k1];

  for i=1:n

    x=x+h ; y=y+h*k1 ; k1=f1(x,y);

    XY(i+1,:)=[i x y k1];

  end

end 