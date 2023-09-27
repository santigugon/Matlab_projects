function errRelativo()
eReal=exp(1);
% Inicialización de los vectores para almacenar los errores y los pasos
errorRelativo1 = [];
errorRelativo2 = [];
errorRelativo4 = [];
steps1 = [];
steps2 = [];
steps4 = [];

n1=49000000;
n2=1;
n4=1;

while(true)
    IXYD=ode_rk1(@(t,y)y,0,1,1,n1,100);
    eAprox1=IXYD(end,end);
    err1=(eReal-eAprox1)/eReal;
    %errorRelativo1 = [errorRelativo1, err1];
   % steps1 = [steps1, n1];
    if(err1<=1e-8)
        break;
    end
    n1=n1+1;
end

%while(true)
 %   IXYD=ode_rk2(@(t,y)y,0,1,1,n2,1);
  %  eAprox2=IXYD(end,end);
   % err2=(eReal-eAprox2)/eReal;
    %errorRelativo2 = [errorRelativo2, err2];
    %steps2 = [steps2, n2];
    %if(err2<=1e-8)
     %   break;
    %end
    %n2=n2+1;
%end

%while(true)
 %   IXYD=ode_rk4(@(t,y)y,0,1,1,n4,1);
  %  eAprox4=IXYD(end,end);
   % err4=(eReal-eAprox4)/eReal;
    %errorRelativo4 = [errorRelativo4, err4];
    %steps4 = [steps4, n4];
    %if(err4<=1e-8)
    %    break;
    %end
    %n4=n4+1;
%end

% Graficando los errores relativos
%figure;
%semilogy(steps1, errorRelativo1, 'r', 'DisplayName', 'RK1');
%hold on;
%semilogy(steps2, errorRelativo2, 'g', 'DisplayName', 'RK2');
%semilogy(steps4, errorRelativo4, 'b', 'DisplayName', 'RK4');
%hold off;
%legend;
%xlabel('Número de pasos');
%ylabel('Error relativo');
%grid on;
%title('Error relativo vs. Número de pasos');

n1
n2
n4
end
