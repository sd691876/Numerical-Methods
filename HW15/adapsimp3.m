function [v, N,n]=adapsimp3(func, a, b, tol, maxseg)
    v0=Simp3(func, a, b);
    v=Simp3(func, a, (a+b)/2)+Simp3(func, (a+b)/2, b);
if abs((v-v0)/v)<tol || maxseg<8
    N=4;
    n = [ a ((a+b)/2+a)/2 (a+b)/2 ((a+b)/2+b)/2 b];
else
    [v1, N1, n1]=adapsimp3(func, a, (a+b)/2, tol, maxseg-4);
    [v2, N2, n2]=adapsimp3(func, (a+b)/2, b, tol, maxseg-N1);
    v=v1+v2;
    N=N1+N2;
    n = [n1,n2(2:end)];
end



