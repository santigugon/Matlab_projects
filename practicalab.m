grafica=@(t) (((sqrt(1.5))-0.5*sqrt((9.81*.05)/50000))*t).^2;

for t=0:0.1:100
    plot(t,grafica(t),".b");hold on;
    xlabel("t(s)")
    ylabel("h(m)")
end