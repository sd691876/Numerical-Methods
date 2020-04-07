function [a,Cond] = polynomial(x,y)
    n  = length(x)-1:-1:0; % power
    fx = x.^n;
    a = fx\y;
    Cond =cond(fx,2);
end