function [J,f]=jfreact(x)
    del=0.000001;   r1 = 5; r2 = 6;
    df1dx1=(u(r1, r2, x(1)+del*x(1), x(2))-u(r1, r2, x(1), x(2)))/(del*x(1));
    df2dx1=(v(r1, r2, x(1)+del*x(1), x(2))-v(r1, r2, x(1), x(2)))/(del*x(1));
    df1dx2=(u(r1, r2, x(1), x(2)+del*x(2))-u(r1, r2, x(1), x(2)))/(del*x(2));
    df2dx2=(v(r1, r2, x(1), x(2)+del*x(2))-v(r1, r2, x(1), x(2)))/(del*x(2));
    J=[df1dx1 df1dx2;df2dx1 df2dx2];
    f1=u(r1,r2,x(1),x(2));
    f2=v(r1,r2,x(1),x(2));
    f=[f1;f2];
end

function f=u(r1,r2,theta1,theta2)
    f = r1*cos(theta1) + r2*cos(theta1+theta2) - 10;
end
function f=v(r1,r2,theta1,theta2)
    f = r1*sin(theta1) + r2*sin(theta1+theta2) -  4;
end