function [L U] = LU_Decomposition(A)
    A_size = size(A,1);
    U = A;
    B = zeros(A_size);
    L = eye(A_size);
    for i = 1 : A_size-1
        %{
       [big n] = max(A(i:A_size,i));
       if n~=1
          A([i, i+n-1], :) =A([i+n-1, i],:);
       end
       %}
        factor  = zeros(A_size-i,1); 
        factor(i:end,1) = -U(i+1:end,i)/U(i,i);
        L(i+1:end,i) = -factor; %insert inverse factor
        reg = eye(A_size);
        reg(i+1:end,i) = factor;  % build Gauss's matrix
        U = reg * U;          
    end
end