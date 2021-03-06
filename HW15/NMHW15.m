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
    I_tr = Trap(f, a, b, n_tr);
    es_tr = abs((f_ans - I_tr)/f_ans)*100;
    if es_tr<et,break; end
    n_tr = n_tr + 1;   
end
% 31
n_simp3 = 2;
while(1)
    I_simp3 = Simp3(f, a, b, n_simp3);
    es_simp3 = abs((f_ans - I_simp3)/f_ans)*100;
    if es_simp3<et,break; end
    n_simp3 = n_simp3 + 2; 
end
% 38+31
n_simp38 = 3;
while(1)
    I_simp38  = Simp38(f, a, b, n_simp38);
    es_simp38 = abs((f_ans - I_simp38)/f_ans)*100;
    if es_simp38<et,break; end
    n_simp38 = n_simp38 + 2; 
end
% 38
n_simp3_8 = 3;
while(1)
    I_simp3_8 = Simp3_8(f, a, b, n_simp3_8);
    es_simp3_8 = abs((f_ans - I_simp3_8)/f_ans)*100;
    if es_simp3_8<et,break; end
    n_simp3_8 = n_simp3_8 + 3; 
end
% 2-points Gaussian Quadrature
n_GaussQuad2p = 1;
while(1)
    I_GaussQuad2p = GaussQuad2p(f, a, b, n_GaussQuad2p);
    es_GaussQuad2p = abs((f_ans - I_GaussQuad2p)/f_ans)*100;
    if es_GaussQuad2p<et,break; end
    n_GaussQuad2p = n_GaussQuad2p + 1; 
end


% HW15(cont.)
q = 0.3;    r = 0.9;    s = 6;
f = @(x) 1./((x-q).^2+0.01)+1./((x-r).^2+0.04)-s;
f_ans = 29.85832539549;
a = 0;  b = 1;
Tol = 1e-4;
[v, N,n]=adapsimp3(f, a, b, Tol, 1000);
plot(n,f(n)); hold on;
stem(n,f(n)); hold off;
title([num2str(Tol,'Tol = %.1e')]);

