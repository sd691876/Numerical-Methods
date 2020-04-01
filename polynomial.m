function [a,Cond] = polynomial(x,y)
    n = length(x)-1:-1:1;
    fx = zeros(length(x));
    for i = 1 : length(x)
        for j = 1: length(x)-1
            fx(i,j) =x(i).^(n(j));
        end
    end
    fx(:,end) = ones(length(x),1);
    a = fx\y';
    Cond =cond(fx,2);
end