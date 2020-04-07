function [L U] = LU_Decomposition(A)
    A_size = size(A,1);
    %U = A;
    B = zeros(A_size);
    L = eye(A_size);
    for i = 1 : A_size-1
       [big n] = max(A(i:A_size,i));
       if n~=1
          A([i, i+n-1], :) =A([i+n-1, i],:);
       end
       if(i==1)
        reg = A;
        L(2:end,1) = reg(2:end,1)/reg(1,1);
       end
       for k = 1 : A_size -1
           for j = k+1 : A_size
               A(j,:) = A(j,:) - A(j,k)/A(k,k) * A(k,:);
           end
       end
    end
    U = A;    
    for j = 2 : A_size
        for i = j : A_size
            if(i==j)
                continue;
            end
            for k = 1 : j-1
               L(i,j) =  (reg(i,j) - L(i,k)*U(k,j) + L(i,j))/U(j,j);
            end
        end
    end
    
    
end