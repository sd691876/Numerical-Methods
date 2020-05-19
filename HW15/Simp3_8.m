function [I,ea] = Simp3_8(func,a,b,n,f_ans,varargin)
if nargin<3,error('at least 3 input arguments required'),end
if ~(b>a),error('upper bound must be greater than lower'),end
if nargin<4||isempty(n),n=100;end
x = a; h = (b - a)/n;  % x = xi h = dx
s=func(a,varargin{:}); % s = f(xi)
for i = 1 :n-1
    x = x + h;
    if(mod(i,3)==0)
       m = 2;
    else
       m = 3;
    end
    s = s + m*func(x,varargin{:});
end
    s = s + func(b,varargin{:});
    I = 3*h/8*s;
ea = abs((f_ans - I)/f_ans);