function I = GaussQuad2p(func,a,b,n,varargin)
if nargin<3,error('at least 3 input arguments required'),end
if ~(b>a),error('upper bound must be greater than lower'),end
if nargin<4||isempty(n),n=100;end
x = a; h = (b - a)/n;  % x = xi h = dx
s = 0;
cxd1 = ((x+h)-x)/2; %(b-a)/2
for i = 1 : n
    cxd2  = ((x+h)+x)/2; %(b+a)/2
    x1 = cxd1/(sqrt(3)) + cxd2;
    x2 = cxd1/(-sqrt(3)) + cxd2;
    s = s + 1*func(x1) + 1*func(x2); %c1*f(x1) + c2*f(x2)
    x = x + h;
end
I = cxd1 * s;
