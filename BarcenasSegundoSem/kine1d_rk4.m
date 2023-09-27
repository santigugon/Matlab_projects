function ITXVA = kine1d_rk4(fa,xi,vxi,tf,ncalc,nview)
% rk1 find yf=f(xf) from ODE dy/dx=f1(x,y)
% with initial value (xi,yi) in ncalc steps
% This is a modification of ode_euler to Runge Kutta 4
% save nview partial results: [ i x y dy/dx ]
%funcion para calcular Posicion, velocidad y aceleracion a traves del
%tiempo
  t=0;
  ncalc=round(ncalc);
  if ncalc<1 ITXVA=NaN; return; end
  h=(tf-t)/ncalc; x=xi; v=vxi; a=fa(t,x,v);


  nview=min(ncalc,round(max(1,nview)));
  step=round(ncalc/nview);
  ITXVA=zeros(nview+1,5); iv=1;
  ITXVA(1,:)=[0 t xi vxi a];
  
  for i=1:ncalc
%USAREMOS KV Para calcular la posicion
%Usaremos an para calcular la velocidad
    kv1=h*v;
    a1=h*fa(t,x,v);


    kv2=h*(v+(1/2)*a1);
    a2=h*fa(t+(1/2)*h,x+(1/2)*kv1, v+a1*(1/2));

    kv3=h*(v+(1/2)*a2);
    a3=h*fa(t+(1/2)*h,x+(1/2)*kv2,v+(1/2)*a2);

    kv4=h*(v+a3);
    a4=h*fa(t+h,x+kv3,v+a3);


   t=t+h; 
    x=x+(kv1+2*kv2+2*kv3+kv4)/6;  v=v+(a1+2*a2+2*a3+a4)/6 ; a=fa(t,x,v);
   
    if mod(i,step)==0
        iv=iv+1;  ITXVA(iv,:)=[i t x v a];
    end
  end
  ITXVA(end,:)=[ncalc t x v a];
end