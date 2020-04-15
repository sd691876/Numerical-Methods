%function [L U] = LU_Decomposition(A)
    %A = [2 -6 -1; -3 -1 7; -8 1 -2];
    A = [1 2 3 7
        5 6 7 8
        9 10 11 12
        13 14 17 16];
    [l u p] =lu(A)
    A_size = size(A,1);
    U = A;
    B = zeros(A_size);
    L = eye(A_size);
    P = eye(A_size);
    for i = 1 : A_size-1
        T =eye(A_size);
        [maxi n] = max(abs(U(:,i)));
        T([i,n],:) = T([n,i],:);
        P = T * P;
        %Gauss's elimination
        U = T * U; % horizental moving
        L = L * T;
        %factor  = zeros(A_size-i,1);
        factor = -U(i+1:end,i)/U(i,i); 
        reg = eye(A_size);
        reg(i+1:end,i) = factor;  % build Gauss's matrix
        U = reg * U;
        L(i:end-1,i) = -factor(end:-1:1,1); %insert inverse factor 
    end
%end