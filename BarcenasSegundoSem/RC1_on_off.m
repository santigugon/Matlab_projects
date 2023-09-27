% RC1_on_off circuit simulator
% Charge - Discharge

clear;
global E_on t_sw;   % Voltage
E_on=.005; t_sw=.006;    % Time of switch

R=100;         % Resistance / Ω
C=10e-6;      % Capacitance / F
tau=R*C;        % Time constant / s
tf=t_sw+5*tau;  % Final time / s
dt=0.001*tau;   % Δt / s
n=tf/dt;        % Number of steps

NTQI = ode_euler(@(t,q) (E_t(t)-q/C)/R,0,0,tf,n);
T=NTQI(:,2);  % Time vector / s
Q=NTQI(:,3);  % Charge vector / C
I=NTQI(:,4);  % Current vetor / A
%V=NTQI(:,5); 

%Graphs
sz=3;              % Scatter Size
tfl=tf+100*eps(tf); % Include last point

subplot(2,3,2);  % I vs t
scatter(T,I,sz,'b'); xlim([0 tfl]);
grid on; ylabel('{\it I_1} / A');
title(sprintf("{\\it R}=%g Ω   {\\it C}=%g F",R,C));

subplot(2,3,5);  % q vs t
scatter(T,Q,sz,'g');  xlim([0 tfl]);
grid on; ylabel('{\it q_1} / C');
xlabel('{\it t} / s');


global E_on t_sw;   % Voltage
E_on=.05; t_sw=.06;    % Time of switch

R=100;         % Resistance / Ω
C=100e-6;      % Capacitance / F
tau=R*C;        % Time constant / s
tf=t_sw+5*tau;  % Final time / s
dt=.0010*tau;   % Δt / s
n=tf/dt;        % Number of steps

NTQI = ode_euler(@(t,q) (E_t(t)-q/C)/R,0,0,tf,n);
T2=NTQI(:,2);  % Time vector / s
Q2=NTQI(:,3);  % Charge vector / C
I2=NTQI(:,4);  % Current vetor / A

subplot(2,3,3);  % I vs t
scatter(T2,I2,sz,'b'); xlim([0 tfl]);
grid on; ylabel('{\it I_2} / A');
title(sprintf("{\\it R}=%g Ω   {\\it C}=%g F",R,C));

subplot(2,3,6);  % q vs t
scatter(T2,Q2,sz,'g');  xlim([0 tfl]);
grid on; ylabel('{\it q_2} / C');
xlabel('{\it t} / s');

vec=1:5:.05;

subplot(2,3,1);  % I vs t
scatter(T2,I+I2,sz,'b'); xlim([0 tfl]);
grid on; ylabel('{\it I_T} / A');
title(sprintf("{\\it R}=%g Ω   {\\it C}=%g F",48,C+10e-6));

%E_values = E_t(T2);
V = arrayfun(@E_t, T2);


x_value = .06; % The x-coordinate where the vertical line should be drawn
y_limits = [0, 5]; % The range of y values for the vertical line


subplot(2,3,4);  % q vs t
% Plot the vertical line
line([x_value, x_value], y_limits, 'Color', 'red', 'LineWidth', 2);
hold on
scatter(T2,V.*100,sz,'r');  xlim([0 tfl]);
grid on; ylabel('{\it E} / V');
xlabel('{\it t} / s');


% Prepare data for Excel export
data_I = [T, I]; % Subplot 1 data (time and current)
data_Q = [T, Q]; % Subplot 2 data (time and charge)
% Export data to Excel files
%writematrix(data_I, 'DatosMalla1Corriente.xlsx');
%writematrix(data_Q, 'DatosMalla1Carga.xlsx');

function E = E_t(t)
    global E_on t_sw;
    if t<t_sw   % Time of switch / s
        E=E_on;    % Voltage ON / V
    else
        E=0;    % Voltage Off / V
    end
end

