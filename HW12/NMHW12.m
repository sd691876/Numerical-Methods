S = [0.01 0.05 0.1 0.5 1 5 10 50 100];
v = [6.078e-11, 7.595e-9, 6.063e-8, 5.788e-6, 1.737e-5, 2.423e-5, ...
     2.430e-5, 2.431e-5, 2.431e-5];
 [a_sat,r2_sat,y_sat] = linregr(1./S.^3,1./v,100,'linregr_saturation');
 a  = fminsearch(@fSSR, [1, 1], [] , S, v);
 f  = @(x) a(1)*x.^3./(a(2)+x.^3);
 st = sum((v - mean(v)).^2);
 sr = sum((v - f(S)).^2);
 r2 = 1 - sr/st
 
load Y12.txt
Z=-(1./(Y12(:,2)+1j*Y12(:,3)));
f=Y12(:,1);
plot(f,imag(Z));

Z_img = w * L - 1 /(w * C);
