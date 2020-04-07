%HW6(cont.)
x = [200,250,300,400,500]';
y = [0.746,0.675,0.616,0.525,0.457]';
[coefficient,Cond] = polynomial(x,y);

%HW6
% Qij*ci + Qik*ci - Qji*cj + kVici = Qi_in*Ci_in ;
Q1  = 100; c1_in =  10; Q2  =  10; c2_in = 200; Q3 = 110;
Q12 =   5; Q21   =  22; Q13 = 117; Q32   =   7;
k   = 0.1; V1    = 100; V2  =  50; V3    = 150;
result = [Q1*c1_in Q2*c2_in 0]';
Matrix = [Q12+Q13+k*V1      -Q21            0
                  -Q12  Q21+k*V2         -Q32
                  -Q13         0  Q3+Q32+k*V3];
[l u] = lu(Matrix); 
[ll uu] = LU_Decomposition(Matrix);
c = Matrix\result;

