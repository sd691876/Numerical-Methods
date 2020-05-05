%% Problem 15.1
x = [1 2 2.5 3 4 5];
y = [0 5 7 6.5 2 0];
xx = 3.4;
[c,d] = sort(abs(x-xx));
y_order = zeros(1,3);
y_order_ea = zeros(1,3);
N = length(x)-1;
y_ans = polyfit(x,y,N);
y_ans = @(x) y_ans * (x'.^[N:-1:0])';
for j = 1:3
    y_order(j)    = Newtint(x(d(1:j+1)),y(d(1:j+1)),xx);
    y_order_ea(j) = abs((y_ans(xx)-y_order(j))/y_ans(xx))*100; 
end
n = 1:0.01:5;
figure;
plot(n,y_ans(n),xx,y_order,'o');
legend('Polyfit Curve', 'Linear intepolation', ...
       'Quadratic interpolation','Cubic interpolation');
[Min,order] = min(y_order_ea)

%%  Problem 15.6
x = [0 1 2 3 4 5];
y = [0 0.5 0.8 0.9 0.941176 0.961538];
yy = 0.93;
f = @(x) x.^2./(1 + x.^2) - yy;
x_pole = fzero(f, [0 5]);
[c,d]  = sort(abs(x - x_pole));
y_order = zeros(1,2);
y_order_ea = zeros(1,2);
for j = 1 : 2
   y_order(j)    = Newtint(x(d(j:j+2)),y(d(j:j+2)), x_pole);
   y_order_ea(j) = abs((f(x_pole) + yy -y_order(j))/(f(x_pole) + yy))*100;
end
n = 0:0.01:5;
figure;
plot(n,f(n) + yy,x_pole,y_order,'o',[0 5],[yy yy]);
legend('Function curve', 'Quadratic interpolation', ...
       'Cubic interpolation', num2str(yy,'y = %.2f'));
[Min,order] = min(y_order_ea)

% Find Inverse function
%{ 
f  = @(x) x^2/(1 + x^2);
syms x
g  = finverse(f,x);
g = matlabFunction(g);
yy = Newtint(x,y,g(0.93));

%}
%%
% Switch x and y
yy = 0.93;
f  = @(x) x.^2./(1 + x.^2);
syms x
g  = finverse(f,x);
g = matlabFunction(g);
xx = g(yy);
x = [0 1 2 3 4 5];
y = [0 0.5 0.8 0.9 0.941176 0.961538];
[c,d] = sort(abs(y-yy));

x_order = zeros(1,2);
x_order_ea = zeros(1,2);
for j = 1:2
    x_order(j)    = Newtint(y(d(1:j+2)),x(d(1:j+2)),yy);
    x_order_ea(j) = abs((xx-x_order(j))/xx)*100; 
end
n = 0:0.01:5;
figure;
plot(n,f(n),x_order,yy,'o',[0 5],[yy yy],xx,yy,'diamond');
legend('Function curve', 'Quadratic interpolation', ...
       'Cubic interpolation', num2str(yy,'y = %.2f'));
[Min,order] = min(x_order_ea)


