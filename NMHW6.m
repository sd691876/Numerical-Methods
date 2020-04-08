%HW6(cont.)
x = [200,250,300,400,500]';
y = [0.746,0.675,0.616,0.525,0.457]';
[coefficient,Cond] = polynomial(x,y)             
A = [2 -6 -1; -3 -1 7; -8 1 -2];
B = [-38 -13; -34 16; -20 -12];
x = lusolve(A,B)

[L U] = LU_Decomposition(A)
[l u] = lu(A);

