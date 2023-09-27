for i=0:1:3
    fprintf("%d",i)
end

N=5;
x=[11 12 3 4 5];
MA = N./sum(1./x);
fprintf("La media armónica es:%f\n",MA);