clear; close all;
%HW7
theta = [0.7;0.7];
[theta_nr,f_nr,ea_nr,iter_nr] = newtmult(@jfreact,theta);

%HW7(cont.)
Tu = 25; Tl =    100; 
Tr =  0; Td =     75;
n =  20; es =  0.001;
maxiter = 1000;
reg = maxiter;
[T1, iter_gs1, ea_gs1] = HW7(n,Tu,Td,Tl,Tr,es,maxiter);
