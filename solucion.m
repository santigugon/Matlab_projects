function SumaRiemmanTn(a,b,n,f)

dx=(b-a)/n;

%Metodo de TN
A=0;
for k=1:n
    xk=a+dx*k;
    A=A+dx*(f(xk-dx)+f(xk))/2;
end

fprintf("Suma TN:%f\n",A);

end