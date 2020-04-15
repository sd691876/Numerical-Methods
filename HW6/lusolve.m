function X = lusolve(A,B)
    [l u] = lu(A)
    %B =p * B;
    d = zeros(size(B,1),size(B,2));
    for i = 1 : size(B,1)
           d(i,:) = B(i,:) -l(i,1:i-1) * d(1:i-1,:) ;
    end
    X = zeros(size(B,1),size(B,2));
    for j = size(B,1):-1:1
           X(j,:) = (d(j,:) -u(j,j+1:size(B,1)) * X(j+1:size(B,1),:))/u(j,j);
    end
end