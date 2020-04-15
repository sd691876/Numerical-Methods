function [x,fx,ea,iter]=parabolicmax(f,x1,x3,es,maxit,varargin)
if nargin<4,error('at least 3 input arguments required'),end
if nargin<5 || isempty(es), es=0.0001;end
if nargin<6 || isempty(maxit), maxit=50;end
iter=0;
x2=(x1+x3)/2;
xopt=0;
vari = x1:0.01:x3;
while(1)
    %{
    plot(vari, f(vari)); hold on;
    plot(x1, f(x1),'marker','O','markersize',20);
    plot(x2, f(x2),'marker','O','markersize',20); 
    plot(x3, f(x3),'marker','O','markersize',20);
    %}
x4 =x2-((x2-x1).^2 * (f(x2)-f(x3)) - (x2-x3).^2 * (f(x2)-f(x1))) / ...
       (2 * (x2-x1) * (f(x2)-f(x3)) - (x2-x3) * (f(x2)-f(x1)));
if x4~=0, ea = abs((x4 - xopt) / x4) * 100;end  
   plot(x4, f(x4),'marker','X','markersize',20); hold off;
   title('parabolic interpolation method');

if(x4>x2)
    if(f(x4)>f(x2))
        x1=x2;
        x2=x4;
    else
        x3=x4;
    end
else
    if(f(x4)>f(x2))
        x3=x2;
        x2=x4;
    else
        x1=x4;
    end
end
xopt=x4;
iter=iter+1;
if ea <= es || iter >= maxit,break,end
pause(0.2)
end
plot(vari, f(vari)); hold on;
plot(x1, f(x1),'marker','O','markersize',20);
plot(x2, f(x2),'marker','X','markersize',20);
plot(x3, f(x3),'marker','O','markersize',20); hold off;
x=x4;fx=f(x4,varargin{:});
