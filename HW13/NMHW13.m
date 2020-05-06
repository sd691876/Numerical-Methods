% Problem 15.1
x = [1 2 2.5 3 4 5];
y = [0 5 7 6.5 2 0];
xx = 3.4;
[c,d] = sort(abs(x-xx));
N = length(x)-1;
f =@(x,y,xx) Newtint(x,y,xx);
n = 1:0.01:5;
y_order = zeros(3,length(n));
f_order = zeros(3,1);
for j = 1:3
    y_order(j,:)    = f(x(d(1:j+1)),y(d(1:j+1)),n);
    f_order(j,:)    = f(x(d(1:j+1)),y(d(1:j+1)),xx);
end
figure;
plot(n,y_order(1,:),xx,f_order(1),'o',n,y_order(2,:)...
,xx,f_order(2),'o',n,y_order(3,:),xx,f_order(3),'o',x,y,x,y,'x');
legend('Linear intepolation', 'Linear point',...
       'Quadratic interpolation', 'Quadratic point',...
       'Cubic interpolation','Cubic point','Original curve','Original point');

%  Problem 15.6
x = [0 1 2 3 4 5];
y = [0 0.5 0.8 0.9 0.941176 0.961538];
yy = 0.93;
f = @(x) x.^2./(1 + x.^2) - yy;
x_pole = fzero(f, [0 5]);

[c,d]  = sort(abs(y - yy));
f_q = @(xx) Newtint(x(d(1:3)),y(d(1:3)),xx) - yy;
f_c = @(xx) Newtint(x(d(1:4)),y(d(1:4)),xx) - yy;
n = 1:0.01:5;
x_pole_q = fzero(f_q, [x(d(1)) x(d(2))]);
x_pole_c = fzero(f_c, [x(d(1)) x(d(2))]);
y_order2 = f_q(n) + yy;
y_order3 = f_c(n) + yy;

figure;
plot(n,y_order2,x_pole_q,f_q(x_pole_q) + yy,'o',n,y_order3,x_pole_c,f_c(x_pole_c) +yy,'o',n,f(n)+yy,x_pole,f(x_pole) +yy,'x');
legend('Quadratic interpolation', 'Quadratic point',...
       'Cubic interpolation','Cubic point',...
       'Function curve','true point');

