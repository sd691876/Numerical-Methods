function T = rod(T0, Tn, Ta, h, n, L)
    delta    = L/n;
    Equation = diag(ones(n-1,1)) * (-2-(h*delta.^2)) + ...
               diag(ones(n-2,1),1) + diag(ones(n-2,1),-1);
    y        = ones(n-1,1) * (-h*Ta*delta.^2); 
    y(1)     = y(1)   - T0;
    y(end)   = y(end) - Tn;
    T        = [T0 ; Equation\y ; Tn];
    A        = ((Tn-Ta) - (T0-Ta)*exp(-L*sqrt(h))) / ...
               (exp(L*sqrt(h))-exp(-L*sqrt(h)));
    B        = (-(Tn-Ta) + (T0-Ta)*exp(L*sqrt(h))) / ...
               (exp(L*sqrt(h))-exp(-L*sqrt(h)));
    x = linspace(0,L,n+1);
    Tx       = A.*exp(x*sqrt(h)) + B.*exp(-x*sqrt(h)) + Ta;
    plot(x,Tx); hold on;
    plot(x,T,'mo');  hold off;
    legend('Analytic','Computed');
    xlabel('X'); ylabel('T');
end