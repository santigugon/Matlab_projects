function raices(a,b,c)

raizpositiva=@(a,b, c) (-b+ (b^2-4*a*c) ^0.5) / (2*a) ;%declaramos funcion de incognito
raiznegativa=@(a,b, c) (-b- (b^2-4*a*c)^0.5) / (2*a) ;

fprintf("La raiz positiva es %f, La raiz negativa es %f", raizpositiva(a,b,c),raiznegativa(a,b,c));
end