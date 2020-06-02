function [t,y] = midode(dydt,tspan,y0,h,varargin)

if nargin<4,error('at least 4 input arguments required'),end
ti = tspan(1);tf = tspan(2);
if ~(tf>ti),error('upper limit must be greater than lower'),end
t = (ti:h:tf)'; n = length(t);
% if necessary, add an additional value of t
% so that range goes from t = ti to tf
if t(n)<tf
t(n+1) = tf;
n = n+1;
end
y = y0*ones(n,1); %preallocate y to improve efficiency
for i = 1:n-1 %implement Euler's method
reg = y(i) + dydt(t(i),y(i))*h/2;
y(i+1) =y(i) + dydt(t(i) + h/2,reg)*h;
end