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