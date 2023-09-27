clear; clf;
E=5;
R=1100;
C=2200e-6;
tau=R*C;
tf=5*tau;
dt=0.5*tau;
n=tf/dt;

NTQI=ode_euler(@(t,q) (E-q/C)/R,0,0,tf,n);
T=NTQI(:,2);%s
Q=NTQI(:,3);%C
I=NTQI(:,4);%A



t=0:(tf/n):tf;
qt=C*E*(1-exp(-t/(R*C)));
i=(E-(qt./C))/R;

%scatter(T,I,"black");
 %axis equal; grid on;
subplot(2,2,1)
scatter(T,I,"red");
hold on
plot(t,i,"black")

title('R=1100  C=0.022 F')
xlabel(' t')
ylabel('I1/A')
grid on


subplot(2,2,2)
scatter(T,Q,"red");
hold on
plot(t,qt,"black")
title('R=1100  C=0.022 F')
xlabel(' t')
ylabel('q1/C')
grid on

%CALCULO DE ERRORES
eI=abs(i-I');
erelativoI=(eI./i).*10;

subplot(2,2,3)
scatter(erelativoI,eI,"black");
hold on
title('Error absolute')
xlabel(' t')
ylabel('deltaI, I/A')
grid on


eq=abs(qt-Q');
erelativoQ=eq./qt;

subplot(2,2,4)
scatter(t,eq,"black");
hold on
title('Error absolute')
xlabel(' t/s')
ylabel('deltaq, I/C')
grid on

%nexttile