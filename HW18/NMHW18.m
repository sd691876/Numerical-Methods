clear;
%%
figure;
tspan = [0 10];
g = 9.81; l = 0.6;
f = @(t,theta) [theta(2);-g./l.*sin(theta(1));-g./l.*theta(1)];
[t_pi8,y_pi8] = ode45(f,tspan,[pi/8 0 0]);
[t_pi2,y_pi2] = ode45(f,tspan,[pi/2 0 0]);
s_pi8 = matlabFunction(dsolve('D2y == -g/l*(y)','y(0) =pi/8','Dy(0) = 0'));
s_pi2 = matlabFunction(dsolve('D2y == -g/l*(y)','y(0) =pi/2','Dy(0) = 0'));
subplot(121);plot(t_pi8,y_pi8(:,1)*180/pi,t_pi8,s_pi8(g,l,t_pi8)*180/pi);
title('\theta_0 = \pi/8'); xlabel('t'); ylabel('\theta(deg)');
legend('Approximate','Exact');
subplot(122);plot(t_pi2,y_pi2(:,1)*180/pi,t_pi2,s_pi2(g,l,t_pi2)*180/pi);
title('\theta_0 = \pi/2'); xlabel('t'); ylabel('\theta(deg)');
legend('Approximate','Exact');
%%
p  = 10000;
a  = 0.002/7;
r  = 0.15;
d  = [0 50];
f = @(t,x) [-a.*x(1).*x(2); ... S
            a.*x(1).*x(2)-r.*x(2); ...I
            r.*x(2)];
[t,y] = ode45(f ,[0 50] ,[p 1 0]);
plot(t,y(:,1),t,y(:,2),t,y(:,3));
legend('suseptible','infected','recovered');
xlabel('Day'); ylabel('Population');
figure;
death = 0.01;
f_d = @(t,x) [-a.*x(1).*x(2) ; ... S
            a.*x(1).*x(2)-r.*x(2) - death.*x(2); ...I
            r.*x(2) - death.*x(2)];
[t_d,y_d] = ode45(f_d ,[0 50] ,[p 1 0]);
plot(t_d,y_d(:,1),t_d,y_d(:,2),t_d,y_d(:,3));
legend('suseptible','infected','recovered');
xlabel('Day'); ylabel('Population');
death = p - sum(y_d(end,:));
%%
f = @(t,y) 5*(y - t^2);
str = erase(func2str(f),'@(t,y)');
y0 = 0.08;
s_p = matlabFunction(dsolve('Dy == 5*(y - t^2)','y(0) ==y0'));
t = [0 5];
n = linspace(0,5,100);
[t_rk4,y_rk4] = rk4sys(f,t,y0,0.03125);
[t_o45,y_o45] = ode45(f,t,y0);
[t_o23s,y_o23s] = ode23s(f,t,y0);
[t_o23tb,y_o23tb] = ode23tb(f,t,y0);
plot(n,s_p(n,y0),t_rk4,y_rk4,t_o45,y_o45,t_o23s,y_o23s,t_o23tb,y_o23tb);
axis([0 5 -30 30]); xlabel('t'); ylabel('y');
title(['dy/dt=',str,num2str(y0,',y(0)=%.2f'),',Ae^{5t}+t^2+0.4t+0.08']);
legend('t^2 + 0.4t + 0.08','rk4','ode45','ode23s','ode23tb');