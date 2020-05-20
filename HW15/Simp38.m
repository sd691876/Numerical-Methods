function I = Simp38(func,a,b,n,varargin)
if nargin<3,error('at least 3 input arguments required'),end
if ~(b>a),error('upper bound must be greater than lower'),end
if nargin<4||isempty(n),n=100;end
I_simp3 = 0;   I_simp38 = 0;
x = a; h = (b - a)/n;  % x = xi h = dx
s=func(a,varargin{:}); % s = f(xi)
if(n<3)  
    I_simp3 = Simp3(func, a, b, n);
else
    if(mod(n,3)~=0) %simp3 + simp38
        I_simp3 = Simp3(func, a, (n-3)*h+a, (n-3));
        x = x + (n-3)*h;
        s = func(x,varargin{:});
        for i = n-2 :n-1
            x = x + h;
            s = s + 3*func(x,varargin{:});
        end
        s = s + func(b,varargin{:});
    else %simp38 + simp38
        %{
        s = func(x,varargin{:});
        for j = 1:floor(n/3)
            for i = 3*j-2 :3*j-1
                x = x + h;
                s = s + 3*func(x,varargin{:});
            end
            x = x + h;            
            s = s + func(x,varargin{:})*(1 + (j~=floor(n/3))); %1332331
        end
    end
    I_simp38 = 3*h/8*s;
        %}
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
    end
    I_simp38 = 3*h/8*s;
end
I = I_simp3 + I_simp38;