V = [2 3 4 5 7 10];
I = [5.2 7.8 10.7 13 19.3 27.5];
[a_1,r2_1,y_1] = linregr(V,I,3.5,1)
xlabel('V(Volt)');    ylabel('I(Ampere)');
[a_2,r2_2,y_2] = linregr(V,I,3.5,2)
xlabel('V(Volt)');    ylabel('I(Ampere)');
%a1 = a(1) + a(2)*sum(V)/sum(V.*V)
p = [100 200 450 950 2000];
t = [0 5 10 15 20];
[a_e,r2_e,y_e] = linregr(t,log(p),25,3)
xlabel('t(Sec)');    ylabel('p(People)');