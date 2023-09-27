% RC1_on_off circuit simulator
% Charge - Discharge

clear;
global E_on t_sw;   % Voltage
E_on=.05; t_sw=.06;    % Time of switch

R=100;         % Resistance / Ω
C=100e-6;      % Capacitance / F
tau=R*C;        % Time constant / s
tf=t_sw+5*tau;  % Final time / s
dt=0.001*tau;   % Δt / s
n=tf/dt;        % Number of steps

NTQI = ode_euler(@(t,q) (E_t(t)-q/C)/R,0,0,tf,n);
T=NTQI(:,2);  % Time vector / s
Q=NTQI(:,3);  % Charge vector / C
I=NTQI(:,4);  % Current vetor / A

%Graphs
sz=3;              % Scatter Size
tfl=tf+100*eps(tf); % Include last point

subplot(2,1,1);  % I vs t
scatter(T,I,sz,'b'); xlim([0 tfl]);
grid on; ylabel('{\it I_1} / A');
title(sprintf("{\\it R}=%g Ω   {\\it C}=%g F",R,C));

subplot(2,1,2);  % q vs t
scatter(T,Q,sz,'g');  xlim([0 tfl]);
grid on; ylabel('{\it q_1} / C');
xlabel('{\it t} / s');

% Prepare data for Excel export
data_I = [T, I]; % Subplot 1 data (time and current)
data_Q = [T, Q]; % Subplot 2 data (time and charge)
% Export data to Excel files
%writematrix(data_I, 'DatosMalla2Corriente.xlsx');
%writematrix(data_Q, 'DatosMalla2Carga.xlsx');

function E = E_t(t)
    global E_on t_sw;
    if t>=t_sw   % Time of switch / s
        E=E_on;    % Voltage ON / V
    else
        E=0;    % Voltage Off / V
    end
end
