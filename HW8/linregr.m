function [a, r2, f] = linregr(x,y,x0,type)
% linregr: linear regression curve fitting
% [a, r2] = linregr(x,y): Least squares fit of straight
% line to data by solving the normal equations
% input:
% x = independent variable
% y = dependent variable
% output:
% a = vector of slope, a(1), and intercept, a(2)
% r2 = coefficient of determination
    n = length(x);
if length(y)~=n, error('x and y must be same length'); end
    x = x(:); y = y(:); % convert to column vectors
    sx = sum(x); sy = sum(y);
    sx2 = sum(x.*x); sxy = sum(x.*y); %sy2 = sum(y.*y);
    xp = linspace(min(x),max(x),n^2);
switch(type)
    case(1) %y = a0 + a1*x
        A(1) = (n*sxy-sx*sy)/(n*sx2-sx^2); 
        A(2) = mean(y)-A(1)*mean(x);
        a    = @(x) A(1)*x + A(2);
        sr   = sum((y - (A(2) + A(1).*x)).^2);
        st   = sum((y - mean(y)).^2);
        me   = [num2str(A(1),'y = %.4fx'),num2str(A(2),'%.4f')];
    case(2) % y = a1*x
        A(1) = sxy/sx2;
        a    = @(x) A(1)*x;
        sr   = sum((y - A(1).*x).^2);
        st   = sum((y - mean(y)).^2);
        me   = [num2str(A(1),'y = %.4fx')];
    case(3) % ln(y) = ln(a0) + a1*x 
        A(1) = (n*sxy-sx*sy)/(n*sx2-sx^2);
        A(2) = exp(mean(y)-A(1)*mean(x));
        y    = exp(y);
        a    = @(x) A(2) * exp(A(1) * x);
        sr   = sum((y - a(x)).^2);
        st   = sum((y - mean(y)).^2);
        me   = [num2str(A(2),'y = %.4f'),num2str(A(1),'e^{%.4fx}')];
end
    yp = a(xp);
    f  = a(x0);
    r2 = 1 - sr/st;
    figure;
    plot(x,y,'o',xp,yp);
    grid on
    title(me);
%{
if(type == 2)  % y = a1*x
    A(1) = sxy/sx2;
    A(2) = 0;
else
    A(1) = (n*sxy-sx*sy)/(n*sx2-sx^2); 
    A(2) = mean(y)-A(1)*mean(x);
end
    xp = linspace(min(x),max(x),2);
    yp = A(1)*xp+A(2);
    sr = sum((y - (A(2) + A(1).*x)).^2);
    st = sum((y - mean(y)).^2);
if(type == 3) % lny = ln(a0) + a(1)*x
    A(2) = exp(A(2));
    a = @(x) A(2) * exp(A(1) * x);
    sr = sum((exp(y) - a(x)).^2);
    st = sum((exp(y) - mean(exp(y))).^2);
else
    a = @(x) A(1)*x + A(2);
end
%}
% create plot of data and best fit line