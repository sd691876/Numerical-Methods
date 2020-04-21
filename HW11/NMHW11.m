
V = [2 3 4 5 7 10];
I = [5.2 7.8 10.7 13 19.3 27.5];
[a_1,r2_1,y_1] = linregr(V,I,3.5,'linregr_1')
xlabel('V(Volt)');    ylabel('I(Ampere)');

[a_2,r2_2,y_2] = linregr(V,I,3.5,'linregr_2')
xlabel('V(Volt)');    ylabel('I(Ampere)');

p = [100 200 450 950 2000];
t = [0 5 10 15 20];
[a_e,r2_e,y_e] = linregr(t,log(p),25,'linregr_exp')
xlabel('t(Sec)');    ylabel('p(People)');
%{
x = [10 20 30 40 50 60 70 80];
y = [25 70 380 550 610 1220 830 1450];
[a_p,r2_p,y_p] = linregr(log10(x),log10(y),50,'linregr_power')
xlabel('x');    ylabel('y');

S = [1.3 1.8 3 4.5 6 8 9];
v = [0.07 0.13 0.22 0.275 0.335 0.35 0.36];
[a_sat,r2_sat,y_sat] = linregr(1./S,1./v,9,'linregr_saturation')
%}