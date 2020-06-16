function [x,T] = rod(f,T0, Tn, Tspan, delta)
    x = Tspan(1):delta:Tspan(2);
    n = Tspan(2)/delta;
    Equation = diag(ones(n-1,1)) * (-2) + ...
               diag(ones(n-2,1),1) + diag(ones(n-2,1),-1);
    y        = (f(x(2:end-1)).*delta.^2)'; 
    y(1)     = y(1)   - T0;
    y(end)   = y(end) - Tn;
    T        = [T0 ; Equation\y ; Tn];    
end