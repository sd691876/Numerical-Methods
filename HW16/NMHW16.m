clear;
%%
f = @(x) exp(-2.*x) - x;
xi = 2;
syms x
d2f = matlabFunction(diff(f,x,2));
d2f_ans = d2f(xi);
h = [0.5 0.4 0.3 0.2 0.1];
f_cen = (f(xi+h) - 2*f(xi) + f(xi-h))./(h.^2);
f_cen_er = abs((d2f_ans - f_cen)/d2f_ans);
f_bw2 = (2*f(xi) - 5*f(xi-h) + 4*f(xi-2*h) - f(xi-3*h))./(h.^2);
f_bw2_er = abs((d2f_ans - f_bw2)/d2f_ans);
f_fw2 = (-f(xi+3*h) + 4*f(xi+2*h) - 5*f(xi+h) + 2*f(xi))./(h.^2);
f_fw2_er = abs((d2f_ans - f_fw2)/d2f_ans);
plot(h,f_cen_er,h,f_bw2_er,h,f_fw2_er);
legend('central','2nd order backward','2nd order forward');
xlabel('h'); ylabel('Absolute error');

%%
t   = [200 202 204 206 208 210];
th  = [0.75 0.72 0.70 0.68 0.67 0.66];
r   = [5120 5370 5560 5800 6030 6240];
ti  = 206;
p   = find(t==ti);
h   = t(p) - t(p-1);
%dr  = (-r(p+2) + 8*r(p+1) - 8*r(p-1) + r(p-2))/(12*h);
%dth = (-th(p+2) + 8*th(p+1) - 8*th(p-1) + th(p-2))/(12*h);
dr   = (r(p+1) - r(p-1))/(2*h);
dth  = (th(p+1) - th(p-1))/(2*h);
d2r  = (r(p+1) - 2*r(p) + r(p-1))/h.^2;
d2th = (th(p+1) - 2*th(p) + th(p-1))/h.^2;
%method 1 normal compute
%{
v_x = dr*cos(th(p)) - r(p)*sin(th(p))*dth;
v_y = dr*sin(th(p)) + r(p)*cos(th(p))*dth;
a_x = d2r*cos(th(p)) - dr*sin(th(p))*dth - (dr*sin(th(p))*dth ...
      + r(p)*cos(th(p))*dth*dth + r(p)*sin(th(p))*d2th);
a_y = d2r*sin(th(p)) + dr*cos(th(p))*dth + (dr*cos(th(p))*dth ...
      - r(p)*sin(th(p))*dth*dth + r(p)*cos(th(p))*d2th);
%}
%method 2  A*R = A*cos(th)*X + A*sin(th)*Y; B*TH = -B*sin(th)*X + B*cos(th)*Y
vr_coef  = dr;   
vth_coef = r(p)*dth;
v_x = vr_coef*cos(th(p)) - vth_coef*sin(th(p));
v_y = vr_coef*sin(th(p)) + vth_coef*cos(th(p));
ar_coef  = d2r - r(p)*dth.^2;
ath_coef = r(p)*d2th + 2*dr*dth;
a_x = ar_coef*cos(th(p)) - ath_coef*sin(th(p));
a_y = ar_coef*sin(th(p)) + ath_coef*cos(th(p));

%%
P = [0.1 5 10 20 25 30 40 45 50];
T = [220    4.1 2.2 1.35  1.1  0.9 0.68  0.61 0.54
     250    4.7 2.5 1.49  1.2 0.99 0.75 0.675  0.6
     282.5 5.23 2.7 1.55 1.24 1.03 0.78   0.7 0.62];
h  = 50;
xi = 2;
dV = (T(xi+1,:) - T(xi-1,:))/(2*h);
H  = T(xi,:) - 400*dV;
H_ans = trapz(P,H);


