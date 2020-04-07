function [L U] = LU_Decomposition(A)
A = [1 0 2 4
    0 1 -3 -1
    -3 -1 -3 1
    -1 1 -5 -2];
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
               if(A(k,k)==0)
                  A(j,:) = 0; 
               else
                  A(j,:) = A(j,:) - A(j,k)/A(k,k) * A(k,:);
               end
           end
       end
    end
    U = A;    
    for i = 2 : A_size-1
        for j = i+1 : A_size
            if(U(i,i)==0)
                U(i,i)=4;
            else
                 L(j,i) =  (reg(j,i) - sum(L(j,1:i-1)*U(1:i-1,i)))/U(i,i);
            end
        end
    end
end