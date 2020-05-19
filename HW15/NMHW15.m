clear;
f = @(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 ...
        -900*x.^4 + 400*x.^5;
a = 0;  b = 10; et = 1e-4;
syms x
%f_second = matlabFunction(diff(f(x),2));
f_ans = double(int(f(x), a, b));
% Tr
n_tr = 1;
while(1)
    [I_tr, es_tr] = Trap(f, a, b, n_tr ,f_ans);
    if abs(es_tr)*100<et,break; end
    n_tr = n_tr + 1;   
end
% 31
n_simp3 = 1;
while(1)
    [I_simp3, es_simp3] = Simp3(f, a, b, n_simp3 ,f_ans);
    if abs(es_simp3)*100<et,break; end
    n_simp3 = n_simp3 + 1; 
end
% 38+31
n_simp38 = 1;
while(1)
    [I_simp38, es_simp38] = Simp38(f, a, b, n_simp38 ,f_ans);
    if abs(es_simp38)*100<et,break; end
    n_simp38 = n_simp38 + 1; 
end
% 38
n_simp3_8 = 1;
while(1)
    [I_simp3_8, es_simp3_8] = Simp3_8(f, a, b, n_simp3_8 ,f_ans);
    if abs(es_simp3_8)*100<et,break; end
    n_simp3_8 = n_simp3_8 + 1; 
end


% HW15(cont.)
q = 0.3;    r = 0.9;    s = 6;
f = @(x) 1/((x-q).^2+0.01)+1/((x-r).^2+0.04)-s;
f_ans = 29.85832539549;
a = 0;  b = 1;
Tol = 1e-4;
[v, n]=adapsimp3(f, a, b, Tol, 1000);


