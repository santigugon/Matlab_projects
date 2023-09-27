


%%Movimiento circular con movimiento

r=5;
w=20;
for t=0:0.1:3
x=r*cos(w*t);
y=r*sin(w*t);
plot(x,y,"k o"); hold on;
plot([0,x],[0,y],'k -');
xlim([-r-1,r+1]);%%Esto es para el tamaño del grafico [xmin,xmax]
ylim([-r-1,r+1])

pause(.5)
plot(x,y,"w o"); %%Imprimimos sobre las otras bolas en blanco para ver el movimiento
plot([0,x],[0,y],'w -');
end