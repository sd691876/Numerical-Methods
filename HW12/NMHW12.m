S = [0.01 0.05 0.1 0.5 1 5 10 50 100];
v = [6.078e-11, 7.595e-9, 6.063e-8, 5.788e-6, 1.737e-5, 2.423e-5, ...
     2.430e-5, 2.431e-5, 2.431e-5];
 [a_sat,r2_sat,y_sat] = linregr(1./S.^3,1./v,100,'linregr_saturation');
 a  = fminsearch(@fSSR, [1, 1], [] , S, v);
 f  = @(x) a(1)*x.^3./(a(2)+x.^3);
 st = sum((v - mean(v)).^2);
 sr = sum((v - f(S)).^2);
 r2 = 1 - sr/st
 
load Y12.txt
Z=-(1./(Y12(:,2)+1j*Y12(:,3))); % impedance
f=Y12(:,1);
figure;
plot(f*1e-9,real(1./Z),'-b','lineWidth',3); hold on;
plot(f*1e-9,imag(1./Z),'-g','lineWidth',3); hold off;
legend('Real','Imag');
xlabel('Freq(GHz)'); ylabel('Y');

f  = f(f<=4e+9);
y  = imag(Z(1:length(f)));
z  =  [2*pi*f -(1./(2*pi*f))];
a  = (z' * z)\(z' * y);
L  = a(1);
C  = 1/a(2);
Eq = @(f) 2*pi*f*L - 1./(2*pi*f*C);
St = sum((y-mean(y)).^2);
Sr = sum((y-z*a).^2);
r2 = 1 - Sr/St;
figure;
plot(f*1e-9,y,'-b','lineWidth',3); hold on;
plot(f*1e-9,Eq(f),'-g','lineWidth',1); hold off;
legend('Measured','Fitted');
xlabel('Freq(GHz)'); ylabel('imag(Z)');
