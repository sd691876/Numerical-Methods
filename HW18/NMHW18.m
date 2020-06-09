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
I0  = 0;
r0  = 0;
d  = [0 50];
f = @(t,x) [-x(4).*x(1).*x(2); ... S
            x(4).*x(1).*x(2)-x(5).*x(2); ...I
            x(5).*x(2);
            -0.028./(x(1)+x(2)+x(3))./(t.^2); ... a
            -0.3./(t.^2)];
[t,y] = ode45(f ,[0.1 50] ,[p I0 r0 0 0]);
plot(t,y(:,5));

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
plot(n,s_p(n,y0));  hold on;
plot(t_rk4,y_rk4);
plot(t_o45,y_o45);
plot(t_o23s,y_o23s); 
plot(t_o23tb,y_o23tb); hold off;
axis([0 5 -30 30]); xlabel('t'); ylabel('y');
title(['dy/dt=',str,num2str(y0,',y(0)=%.2f'),',Ae^{5t}+t^2+0.4t+0.08']);
legend('t^2 + 0.4t + 0.08','rk4','ode45','ode23s','ode23tb');