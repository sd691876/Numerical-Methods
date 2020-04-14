function [J,f]=jfreact(x)
    del=0.000001;
    df1dx1=(u(x(1)+del*x(1),x(2))-u(x(1),x(2)))/(del*x(1));
    df1dx2=(u(x(1),x(2)+del*x(2))-u(x(1),x(2)))/(del*x(2));
    df2dx1=(v(x(1)+del*x(1),x(2))-v(x(1),x(2)))/(del*x(1));
    df2dx2=(v(x(1),x(2)+del*x(2))-v(x(1),x(2)))/(del*x(2));
    J=[df1dx1 df1dx2;df2dx1 df2dx2];
    f1=u(x(1),x(2));
    f2=v(x(1),x(2));
    f=[f1;f2];
end

function f=u(theta,phi)
    f = 5*cos(theta) + 6*cos(theta+phi) - 10;
end
function f=v(theta,phi)
    f = 5*sin(theta) + 6*sin(theta+phi) - 4;
end