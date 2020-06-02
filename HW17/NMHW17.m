clear;
%%
dydt = @(t,y) y*t.^2 - 1.1*y;
h = 0.5;
y0 = 1;
tspan = [0 2];
n = linspace(tspan(1),tspan(2),100);
syms y(t)
f = matlabFunction(dsolve(diff(y) == y*t.^2 - 1.1*y,y(0) == y0));
et = @(t,y) abs((f(t) - y)./f(t))*100;
[t_eu1,y_eu1] = eulode(dydt,tspan,y0,h);
[t_eu2,y_eu2] = eulode(dydt,tspan,y0,h/2);
[t_heu,y_heu] = heuode(dydt,tspan,y0,h);
[t_mid,y_mid] = midode(dydt,tspan,y0,h);
[t_rk4,y_rk4] = rk4sys(dydt,tspan,y0,h);
figure;
subplot(121); plot(n,f(n) , t_eu1,y_eu1 , t_eu2,y_eu2 , ...
                   t_heu,y_heu , t_mid,y_mid , t_rk4,y_rk4);
legend('true','0.5','0.25','heu','mid','rk4');
xlabel('t');    ylabel('y value');
subplot(122); plot(t_eu1,et(t_eu1,y_eu1) , t_eu2,et(t_eu2,y_eu2) , ...
                   t_heu,et(t_heu,y_heu) , t_mid,et(t_mid,y_mid) , t_rk4,et(t_rk4',y_rk4));
legend('0.5','0.25','heu','mid','rk4');
xlabel('t');    ylabel(' \epsilon_t');
%%
k1 = 3000;  k2 = 2400;  k3 = 1800;
m1 = 12000; m2 = 10000; m3 = 8000;
d2xdt2 = @(t,x) [x(4);x(5);x(6);-k1/m1.*x(1) + k2/m1.*(x(2)-x(1)); ...
                 k2/m2.*(x(1)-x(2))+k3/m2.*(x(3)-x(2));k3/m3.*(x(2)-x(3))];
[t1,y1] = rk4sys(d2xdt2,[0 20],[0 0 0 1 0 0],0.01); %dx/dt
subplot(121);plot(t1,y1(:,1),t1,y1(:,2),t1,y1(:,3));
legend('x1','x2','x3'); xlabel('t(sec)'); ylabel('Displacement(m)');
subplot(122);plot(t1,y1(:,4),t1,y1(:,5),t1,y1(:,6));
legend('v1','v2','v3'); xlabel('t(sec)'); ylabel('Velocity(m/sec)');