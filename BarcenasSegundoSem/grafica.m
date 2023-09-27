for t=0:1:4
    x=2*t^3-8*t-6;
    v=6*t^2-8;
    a=12*t;
    plot(t,x,"k -o")
    hold on
    plot(t,v,"r *")
    hold on
    plot(t,a,"b o")
    hold on
end