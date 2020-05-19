function [I,ea] = Simp3(func,a,b,n,f_ans,varargin)

if nargin<3,error('at least 3 input arguments required'),end
if ~(b>a),error('upper bound must be greater than lower'),end
if nargin<4||isempty(n),n=100;end
x = a; h = (b - a)/n;  % x = xi h = dx
s=func(a,varargin{:}); % s = f(xi) 
for i = 1 :n-1
    x = x + h;
    if(mod(i,2)==0)
       s = s + 2*func(x,varargin{:});
    else
       s = s + 4*func(x,varargin{:});
    end
    %es = es + dfunc(i,varargin{:});
end
%es = -(b-a).^3/(12*n.^3)*(es + dfunc(n,varargin{:}));
s = s + func(b,varargin{:});
I = h/3 *s; % I = (b - a) * s/(3*n)
ea = abs((f_ans - I)/f_ans);