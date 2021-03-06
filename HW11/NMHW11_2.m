V    = [2 3 4 5 7 10];
I    = [5.2 7.8 10.7 13 19.3 27.5];
[a_1,r2_1] = linregr2(V,I);
f1   = @(x) a_1(1)*x + a_1(2);
I1   = f1(3.5);
a_2  = a_1(1) + a_1(2)*sum(V)/sum(V.*V);
f2   = @(x) a_2*x;
st_2 = sum((I - mean(I)).^2);
sr_2 = sum((I - f2(V)).^2);
r2_2 = 1 - sr_2/st_2;
I2   = f2(3.5);
p    = [100 200 450 950 2000];
t    = [0 5 10 15 20];
[a_e,r2_e] = linregr2(t,log(p));
a_e(2) = exp(a_e(2));
f3   = @(x) a_e(2)*exp(a_e(1)*x);
st_e = sum((p - mean(p)).^2);
sr_e = sum((p - f3(t)).^2);
r2_e = 1 - sr_e/st_e;
P    = f3(25);

