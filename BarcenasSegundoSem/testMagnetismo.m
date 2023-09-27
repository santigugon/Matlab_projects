clc; disp('Gráfica de Campo Magnético (2d/3d) de Imán Rectangular');

x=	[0 1 2.5 3.5 4 5.3];
y=	[3 2 3 5.5 6.4	4.6];



switch input("Introduzca 2 para 2D y 3 para 3D: ")
case 2
   % clf; load('magnet_2d.mat'); plot(XB(:,1),XB(:,2),'b', 'LineWidth',2); hold on;
    title('Campo magnético imán'); subtitle('20 mm × 10 mm × 2 mm');
    xlabel('{\it x} / mm'); ylabel('{\it B}');  grid on;
    sum_squared_errors=100;
    contador=1;

    arr_errores_cuadrados=[];

    while(sum_squared_errors>1e-27) %Creamos un while  donde buscamos reducir al minimo los errores
    coefficients = polyfit(x,y , contador); %Obtenemos los coeficientes de la funcion polyfit
    errors = y - polyval(coefficients, x);   % Calculamos el error restando del array original de datos los nuevos datos ajustados de nuestro polinomio
    squared_errors = errors.^2;   % Elevamos los errores al cuadrado
    sum_squared_errors = sum(squared_errors);   %Calculamos la suma de los errores cuadrados
    arr_errores_cuadrados(contador)=sum_squared_errors; %Agregamos los errores cuadrados a un array para graficarlos
    contador=contador+1; %Aumentamos el contador que representa el grado del polinomio

    
      % Calcular los errores cuadrados utilizando la función exponencial
    errors_exp = y - exp(polyval(coefficients, x));
    squared_errors_exp = errors_exp.^2;
    sum_squared_errors_exp = sum(squared_errors_exp);

    % Ajuste con función sigmoidal (función logística)
sigmoid_function = @(params, x) params(3) ./ (1 + exp(-params(1) * (x - params(2))));
initial_guess = [1, mean(XB(:, 1)), max(XB(:, 2)) - min(XB(:, 2))];
coefficients_sigmoid = lsqcurvefit(sigmoid_function, initial_guess, XB(:, 1), XB(:, 2));
errors_sigmoid = XB(:, 2) - sigmoid_function(coefficients_sigmoid, XB(:, 1));
squared_errors_sigmoid = errors_sigmoid.^2;
sum_squared_errors_sigmoid = sum(squared_errors_sigmoid);


    end
    sum_squared_errors
    contador
    sum_squared_errors_exp
    sum_squared_errors_sigmoid

    equation = '';

% Iteracion para la construccion de la ecuación
for i = 1:length(coefficients)
    if coefficients(i) ~= 0
   
        term = '';
        if coefficients(i) ~= 1
            term = num2str(coefficients(i));
        end
        
        % Funcion para agregar el exponente de manera que pueda ser
        % introducido en excel
        term = [term 'x^' num2str(length(coefficients) - i)];
        
        % Agregamos cada termino en la ecuacion final
        if isempty(equation)
            equation = term;
        else
            if coefficients(i) > 0
                equation = [equation ' + ' term];
            else
                equation = [equation '  ' term];
            end
        end
    end
end


equation
clipboard('copy', equation);



    xFit = linspace(min(x), max(x), 100); 
    yFit = polyval(coefficients, xFit);     
    
    plot(x, y, 'o');        % Grafica de datos originales
    hold on;
    plot(xFit, yFit,"g");       % Grafica de datos ajustados
    %OPCIONALMENTE GRAFICA DE LA EXPONENCIAL
     
    % GRAFICACION DE LA SUMA DE ERRORES CUADRADOS VS GRADO POLINOMIO

        figure;
        plot(1:contador-1, arr_errores_cuadrados, 'b-', 'LineWidth', 2);
        title('Suma de los errores cuadrados vs grado del polinomio');
        xlabel('Grado del polinomio');
        ylabel('Suma de los errores cuadrados');
        grid on;

    

case 3
    clf; load('magnet_3d.mat'); surf(X,Y,B); hold on;
    title('Campo magnético imán'); subtitle('20 mm × 10 mm × 2 mm');
    xlabel('{\it x} / mm'); ylabel('{\it y} / mm'); zlabel('{\it B}');
    a=10; b=5; Xm=[a -a -a a a]; Ym=[b b -b -b b];
    p=plot3(Xm, Ym, zeros(1,5)+0.5, 'y');
end