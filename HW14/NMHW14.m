clear;
close all;
x = [-1 -0.5 0 0.5 1];
f = @(x) 1./(1 + 25*x.^2);
f4 = polyfit(x, f(x), 4);
y4 = @(x) f4 * (x'.^[4:-1:0])';
xx = linspace(x(1),x(end), 100);
y_ccl = spline(x, f(x), xx);
plot(xx,y4(xx),xx,y_ccl,'--',xx,f(xx),'-');
legend('4-th order polynomial', 'cubic spline','Original point');
figure;
for i = 3:30
    x1 = linspace(x(1), x(end), i);
    y = spline(x1, f(x1), xx);
    plot(xx,y,'--',xx,f(xx),x,f(x),'o');
    er(i) = sum(abs((f(xx) - y)./(f(xx))))*100;
    legend('cubic spline', 'Original curve', 'Original point');
    title([num2str(i,'i = %.1f, '),num2str(er(i),'er = %.3f%%')]);
    pause(0.1);
end
min(er(3:end))

f = @(x) sin(x).^2;
syms x
d_f = diff(f,x);
d_f = matlabFunction(d_f);
x = linspace(0, 2*pi, 8);
xx = linspace(0, 2*pi, 100);
y  = [d_f(0) f(x) d_f(2*pi)];
y_cn = spline(x, f(x), xx);
y_ccl = spline(x, y, xx);
y_ccu = interp1(x, f(x), xx, 'pchip');
figure;
plot(xx,y_cn,xx,y_ccl,'--',xx,y_ccu,'b:',x,f(x),'o');
legend('not-a-knot','clamped','hermite','original point');
figure;
plot(xx,abs(f(xx)-y_cn), xx , abs(f(xx)-y_ccl), xx, abs(f(xx)-y_ccu));
legend('not-a-knot','clamped','hermite');

