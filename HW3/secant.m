function [root,fx,ea,iter]=secant(func,x0,x1,es,maxit,varargin)
% newtraph: Newton-Raphson root location zeroes
% [root,ea,iter]=newtraph(func,dfunc,xr,es,maxit,p1,p2,...):
% uses Newton-Raphson method to find the root of func
% input:
% func = name of function
% dfunc = name of derivative of function
% xr = initial guess
% es = desired relative error (default = 0.0001%)
% maxit = maximum allowable iterations (default = 50)
% p1,p2,... = additional parameters used by function
% output:
% root = real root
% ea = approximate relative error (%)
% iter = number of iterations
if nargin<3,error('at least 3 input arguments required'),end
if nargin<4|isempty(es),es=0.0001;end
if nargin<5|isempty(maxit),maxit=50;end
iter = 0;
while (1)
xrold1 = x1;
x1 = x1 - func(x1)*(x0-x1)/(func(x0)-func(x1));
x0 = xrold1;
iter = iter + 1;
if x1 ~= 0, ea = abs((x1 - xrold1)/x1) * 100; end
if ea <= es | iter >= maxit, break, end
end
root = x1;fx = func(x1, varargin{:});