function tf=isapprox(x1,x0,tol)
%x0~~x1
v=abs(x1); if v<realmin v=1.0;end
tf=(abs(x1-x0)<=tol*v);
end
