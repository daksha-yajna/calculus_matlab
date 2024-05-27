%Determining the Shape of a Suspension Cable - 16BCE0783
clear vars;close all;clc
syms m x c1 c2
a = input('Input the coefficient of Second Derivative of y(D2): ');
b = input('Input the coefficient of First Derivative of y(D1): ');
c = input('Input the coefficient of y(D0): ');
f = input('Input the Inhomogenous function f(x): ');
i3 = input('Input conditional x0: ');
i1 = input('Input value at condition y(x0): ');
i4 = input('Input value at condition y1(x0): ');
m = solve(a*m^2+b*m+c,m);
if (b^2-4*a*c<0)
    alpha = (m(1) + m(2))/2;
    beta = abs((m(1) - m(2))/2);
    y1 = exp(alpha*x)*cos(beta*x);
    y2 = exp(alpha*x)*sin(beta*x);
elseif (b^2-4*a*c==0)
    y1 = exp(m(1)*x);
    y2 = x*exp(m(2)*x);
else
    y1 = exp(m(1)*x);diff(y,x)
    y2 = exp(m(2)*x);
end
Wm = [y1 y2;diff(y1,x) diff(y2,x)];
Wd = det(Wm);
if (Wd==0)
    y2 = y2*x;
end
Wm = [y1 y2;diff(y1,x) diff(y2,x)];
Wd = det(Wm);
yc = c1*y1 + c2*y2;
u1 = -int((y2*f)/(a*Wd),x);
u2 = int((y1*f)/(a*Wd),x);
yp = u1*y1 + u2*y2;
y = yc + yp;
eq1 = subs(y,x,i3);
eq2 = subs(diff(y,x),x,i3);
[sol_c1,sol_c2] = solve(eq1==i1,eq2==i4,c1,c2);
y_final = subs(y,{c1,c2},[sol_c1,sol_c2]);
figure
ezplot(y_final,[-3 10]);
title([char(y_final),' - 16BCE0783'])
xlabel('Displacement')
ylabel('Height')
%Finding the Length of the cable
cable_length = int((1+diff(y_final,x)^2)^0.5,x,-3,10);
disp('The cable length is ');
cable_length