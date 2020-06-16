function [t,y] = SM(f,fx,Tspan,Ta,Tb)
za1 = fx(Tspan(1));
[t,y] = ode45(f, Tspan, [Ta za1]);
Tb1 = y(end,1);
za2 = fx(Tspan(2));
[t,y] = ode45(f, Tspan, [Ta za2]);
Tb2 = y(end,1);
if(Tb1 > Tb)
    while(Tb2 > Tb)
        za2 = za2 - 2;
        [t,y] = ode45(f, Tspan, [Ta za2]);
        Tb2 = y(end,1);
    end
else
    while(Tb2 < Tb)
        za2 = za2 + 2;
        [t,y] = ode45(f, Tspan, [Ta za2]);
        Tb2 = y(end,1);
    end
end
z3 = za1 + (za2 - za1)/(Tb2 - Tb1)*(Tb - Tb1);
[t,y] = ode45(f, Tspan, [Ta z3]);
end