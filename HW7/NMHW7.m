%HW7
x0 = [0.7;0.7];
[x,f,ea,iter_nr]=newtmult(@jfreact,x0)

%HW7(cont.)
Tu = 25; Tl =    100; 
Tr =  0; Td =     75;
n =  20; es =  0.001;
maxiter = 1000;
reg = maxiter;
for t = 0:100
    [T1, iter_gs1, ea_gs1] = HW7(n,Tu,Td,Tl,Tr,es,maxiter,t);
    if(reg > iter_gs1)
       reg = iter_gs1;
       t
    end
end
%[T2 iter_gs2, ea_gs2] = HW71(n,Tu,Td,Tl,Tr,es,maxiter);
