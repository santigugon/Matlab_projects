
% Graficar q_error y i_error en base a n
%loglog(n, q_error, 'o-', 'LineWidth', 2, 'DisplayName', 'Error carga');
%hold on;
%loglog(n, i_error, 's-', 'LineWidth', 2, 'DisplayName', 'Error corriente');
grid on;
xlabel('Pasosn', 'FontSize', 13);
ylabel('Error relativo comparativa', 'FontSize', 13);
title('Errores de Q e I y su relacion con n', 'FontSize', 15);
%legend('Location', 'best');