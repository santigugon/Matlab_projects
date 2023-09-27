yo=13;
A1=100;%%Area del circulo superior
A2=0.5;%%Area del hoyo
g=980; %Gravedad en cm/s
tf=2*sqrt(yo*(A1^2-A2^2)/(2*g*A2^2));
t=0:0.01:tf;
h=(sqrt(yo)-0.5*sqrt(2*g*A2^2/(A1^2-A2^2))*t).^2;
v1=sqrt(2*g*A2^2*h/(A1^2-A2^2));
G=A1*v1;
v2=G/A2;
subplot(2,2,1); plot(t,h,"b");xlabel("t(s)");ylabel("h(cm)");
hold on;
subplot(2,2,3);plot(t,G,"b");xlabel("t(s)");ylabel("G(cm^3/s)");
hold on;
subplot(2,2,4);plot(t,v1,"b",t,v2,"r");xlabel("t(s)");ylabel("v(cm/s)");
hold on;

for t=0:1:tf
h=(sqrt(yo)-0.5*sqrt(2*g*A2^2/(A1^2-A2^2))*t).^2;
v1=sqrt(2*g*A2^2*h/(A1^2-A2^2));
G=A1*v1;
v2=G/A2;
subplot(2,2,1); plot(t,h,"b o");
subplot(2,2,3);plot(t,G,"b o");
subplot(2,2,4);plot(t,v1,"b o",t,v2,"r o");
subplot(2,2,2); bar(t,h,"b"); ylim([0,yo]);
pause(1);
subplot(2,2,1); plot(t,h,"w o");
subplot(2,2,3);plot(t,G,"w o");
subplot(2,2,4);plot(t,v1,"w o",t,v2,"w o");
end
