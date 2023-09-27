clear; clf;
E=5;
R=47.3;
C=110e-6;
tau=R*C;
tf=5*tau;
dt=(.05*tau)/1;
n=tf/dt;
%M = csvread("grafica1.csv")
%col1=M(:,1);
%col2=M(:,2);

V=R*I;


NTQI=ode_euler(@(t,q) (E-q/C)/R,0,0,tf,n);
T=NTQI(:,2);%s
Q=NTQI(:,3);%C
I=NTQI(:,4);%A



t=0:(tf/(n)):tf;
%t2=0:(tf/(n*1000)):tf;
qt=C*E*(1-exp(-t/(R*C)));
i=(E-(qt./C))/R;
v=R*i;

%scatter(T,I,"black");
 %axis equal; grid on;
subplot(3,2,1)
scatter(T,I,"red");
hold on
plot(t,i,"black")
hold on
%plot(col1,col2,"red")

title('R=47.2Ω  C=110 microF')
xlabel(' t')
ylabel('{\it I1}/A')
grid on


subplot(3,2,2)
scatter(T,Q,"red");
hold on
plot(t,qt,"black")
title('R=47.2Ω  C=110 microF')
xlabel(' t')
ylabel('{\it q1}/C')
grid on
% Prepare data for Excel export
data_I = [T, I]; % Subplot 1 data (time and current)
data_Q = [T, Q]; % Subplot 2 data (time and charge)
% Export data to Excel files
writematrix(data_I, 'Subplot1_Current_Data.xlsx');
writematrix(data_Q, 'Subplot2_Charge_Data.xlsx');

%CALCULO DE ERRORES
eI=abs(i-I');
erelativoI=(eI./i);

subplot(3,2,3)
scatter(t,eI,"black");
hold on
title('Error absolute')
xlabel(' t')
ylabel('deltaI, I/A')
grid on


eq=abs(qt-Q');
erelativoQ=eq./qt;

subplot(3,2,4)
scatter(t,eq,"black");
hold on
title('Error absolute')
xlabel(' t/s')
ylabel('deltaq, I/C')
grid on

errRelCar=(qt-Q)./qt;
errRelCor=(i-I)./i;

subplot(3,2,5)
scatter(t,errRelCor,"black");
hold on
title('Error relativo Corriente')
xlabel(' t/s')
ylabel('deltaC')
grid on

subplot(3,2,6)
scatter(t,errRelCar,"black");
hold on
title('Error relativo Carga')
xlabel(' t/s')
ylabel('deltaI, I/C')
grid on

datosErrores = [1 1 5.819767/10 1; 1/10 1*10 3.037554/100
5.219373/100;
1/100 1*100 2.922069/1000 5.020938/1000; 1/1000 1*1000 2.911097/10000
5/10000;
1/10000 1*10000 2.910005/100000 5.000208/100000; 1/100000 1*100000 2.909896/1000000
5/1000000;
1/1000000 1*1000000 2.909885/10000000 5.000002/10000000; 1/10000000 1*10000000 2.909891/100000000
5.000013/100000000;
1/100000000 1*100000000 2.910131/1000000000 5.000425/1000000000];

h_tau = datos(:,1);
n = datos(:,2);

q_error = datos(:,3);
i_error = datos(:,4);
% Graficar q_error y i_error en base a n
loglog(n, q_error, 'o-', 'LineWidth', 2, 'DisplayName', 'Error carga');
hold on;
loglog(n, i_error, 's-', 'LineWidth', 2, 'DisplayName', 'Error corriente');
grid on;
xlabel('n', 'FontSize', 12);
ylabel('Error relativo', 'FontSize', 12);
title('Errores de Q e I en función de n', 'FontSize', 14);
legend('Location', 'best');

%nexttile