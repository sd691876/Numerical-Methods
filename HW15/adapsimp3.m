function [v, n]=adapsimp3(func, a, b, tol, maxseg)
    v0=Simp3(func, a, b);
    v=Simp3(func, a, (a+b)/2)+Simp3(func, (a+b)/2, b);
if abs((v-v0)/v)<tol || maxseg<8
    n=4;
else
    [v1 n1]=adapsimp3(func, a, (a+b)/2, tol, maxseg-4);
    [v2 n2]=adapsimp3(func, (a+b)/2, b, tol, maxseg-n1);
    v=v1+v2;
    n=n1+n2;
end


