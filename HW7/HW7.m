function [T, iter, ea] = HW7(n,Tu,Td,Tl,Tr,es,maxiter)
    reg = zeros(n+1,n+1);
    reg(1,2:end-1)   = Tu;
    reg(:,1)         = Tl;
    reg(end,2:end-1) = Td;
    reg(:,end)       = Tr;
    iter = 0;
    while(1)
       M = reg(2:end-1,2:end-1);
       for i = 2 : size(reg,1)-1
           for j = 2 : size(reg,2)-1
               reg(i,j) = (reg(i-1,j)+reg(i+1,j)+reg(i,j-1)+reg(i,j+1))/4;
           end
       end
       T = reg(2:end-1,2:end-1);
       iter = iter + 1;
       ea=100*max(max(abs((T-M)./T)));
       if iter>=maxiter || ea<=es, break, end
    end
    
    [c, h] = contour((reg),0:100/n:100);
    axis([0,n+1,0,n+1]);    colormap('jet');
    clabel(c,h);
    [X,Y] = meshgrid(1:n-1,1:n-1);
    figure;
    surf(X,Y,T,'edgecolor','none');
    colormap('jet');
end