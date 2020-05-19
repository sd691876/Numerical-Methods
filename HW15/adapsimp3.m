function [v, n]=adapsimp3(func, a, b, tol, maxseg)
    v0=simp3a(func, a, b);
    v=simp3a(func, a, (a+b)/2)+simp3a(func, (a+b)/2, b);
if abs((v-v0)/v)<tol || maxseg<8
    n=4;
else
    [v1 n1]=adapsimp3(func, a, (a+b)/2, tol, maxseg-4);
    [v2 n2]=adapsimp3(func, (a+b)/2, b, tol, maxseg-n1);
    v=v1+v2;
    n=n1+n2;
end

function q =simp3a(f, a, b,tol,varargin)
% Evaluates definite integral of f(x) from a to b
if nargin < 4 | isempty(tol),tol = 1e-4;end
c = (a + b)/2;
fa = feval(f,a,varargin{:});
fc = feval(f,c,varargin{:});
fb = feval(f,b,varargin{:});
q = quadstep(f, a, b, tol, fa, fc, fb, varargin{:});

function q = quadstep(f,a,b,tol,fa,fc,fb,varargin)
% Recursive subfunction used by quadadapt.
h = b - a; c = (a + b)/2;
fd = feval(f,(a+c)/2,varargin{:});
fe = feval(f,(c+b)/2,varargin{:});
q1 = h/6 * (fa + 4*fc + fb);
q2 = h/12 * (fa + 4*fd + 2*fc + 4*fe + fb);
if abs(q2 - q1) <= tol
q = q2 + (q2 - q1)/15;
else
qa = quadstep(f, a, c, tol, fa, fd, fc, varargin{:});
qb = quadstep(f, c, b, tol, fc, fe, fb, varargin{:});
q = qa + qb;
end

