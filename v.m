function v1=v(Cd)
t=4;
v1=36;
g=9.81;
m=80;
v1=@(Cd) sqrt(g*m/Cd)*tanh(sqrt(g*Cd/m)*t)-v1;
end