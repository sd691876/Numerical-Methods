function [T iter ea]= HW71(n, TU, TD, TL, TR, es, maxiter)
% n: number of sections
% TU, TD, TL, TR: boundary values of up, down, left and right sides.
% es: convergence criteria, relative error
% maxiter: maximum iteration

% 0 = d2 T/dx2 + d2 T / dy2;
% 0 = (Ti+1,j - 2Ti,j + Ti-1,j) / dx^2 +
%     (Ti,j+1 - 2Ti,j + Ti,j-1) / dy^2
iter = 0;
T = zeros(n+1,n+1);
T(1,:) = TD;
T(n+1,:) = TU;
T(:,1) = TL;
T(:,n+1) = TR;
while 1
    Told = T;
    for i = 2:n
        for j = 2:n
            T(i,j) = (T(i-1,j) + T(i+1,j) + T(i,j-1) + T(i,j+1))/4;
            if T(i,j) ~= 0
                ea(i,j) = abs((T(i,j) - Told(i,j))/T(i,j)) * 100;
            end
        end
    end
    iter = iter + 1;
    if max(max(ea))<=es || iter >= maxiter, break, end
end
[c, h] = contour((T)', n-1);	
clabel(c,h);
[X,Y] = meshgrid(1:n-1,1:n-1);
figure;surface(X,Y,T(2:n,2:n)','edgecolor','none');
T = reshape((T(2:n,2:n)),[(n-1)^2 1]);
ea = max(max(ea));
%T = T(2:n,2:n);
