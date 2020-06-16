clear;
%%
figure;
Tspan = [0 10];
Ta  = 40;
Tb = 200;
fx = @(x) -(0.12.*x.^3 - 2.4.*x.^2 + 12.*x);
f  = @(x,T) [T(2);fx(x)];
[t,y] = SM(f,fx,Tspan,Ta,Tb);
T3 = y(end,1);
plot(t,y(:,1)); hold on;
delta = 2;
[x,T] = rod(fx,Ta,Tb,Tspan,delta);
plot(x,T,'o');
legend('Shooting Method','Finite Difference');
xlabel('x');    ylabel('T');
%%
w0  = 450;   la  = 60;       Ta = 0;
Tb =  15;  dydx =  0;    Tspan = [0 la];
fx  = @(x) (1 + sin(pi.*x/(2*la)));
T0 = 1;
while(1)
    f  = @(x,T) [T(2);fx(x)/T0];
    [t,y] = SM(f,fx,Tspan,Ta,Tb);
    if(abs((y(end,1)-Tb)/(Tb))<=1e-12)
        T3 = y(end,1);
        plot(t,y(:,1));
        break;
    end
    T0 = T0 + 1;
end
T0 = w0/T0