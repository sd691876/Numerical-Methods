clear;
t=4;
v2=36;
g=9.81;
m=80;
x0=0.25;
e=0.1;
vt=@(Cd) sqrt(g*m/Cd)*tanh(sqrt(g*Cd/m)*t)-v2;
%{
syms Cd;
dvt=diff(vt,Cd);
dvt=matlabFunction(dvt);
[root_nr,fx_nr,ea_nr,iter_nr]=newtraph(vt,dvt,x0,e,100);
x0=0.1;
x1=0.2;
[root_sc,fx_sc,ea_sc,iter_sc]=secant(vt,x0,x1,e,100);
[root_bs,fx_bs,ea_bs,iter_bs]=bisect(vt,x0,x1,e,100);
%}
[b,c,d,e]=bisect(v,0.1,0.2,0.1,100);
syms Cd;
matlabFunction(diff(v,Cd));