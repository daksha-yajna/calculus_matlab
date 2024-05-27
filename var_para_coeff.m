%Variation of Parameters - 16BCE0783
clear vars;clc
syms m x c1 c2
a = input('Input the coefficient of Second Derivative of y(D2): ');
b = input('Input the coefficient of First Derivative of y(D1): ');
c = input('Input the coefficient of y(D0): ');
f = input('Input the Inhomogenous function f(x): ');
i1 = input('Input the initial condition for y = 0: ');
i2 = input('Input the initial condition for y1 = 0: ');
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
    y1 = exp(m(1)*x);
    y2 = exp(m(2)*x);
end
yc = c1*y1 + c2*y2;
Wm = [y1 y2;diff(y1,x) diff(y2,x)];
Wd = det(Wm);
if (Wd==0)
    y2 = y2*x;
    Wm = [y1 y2;diff(y1,x) diff(y2,x)];
    Wd = det(Wm);
end
u1 = -int((y2*f)/(a*Wd),x);
u2 = int((y1*f)/(a*Wd),x);
yp = u1*y1 + u2*y2;
y = yc + yp;
%Solution - pretty(y)
eq1 = subs(y,x,0);
eq2 = subs(diff(y,x),x,0);
c = solve(eq1-i1,eq2-i2,c1,c2);
y_final = subs(y,{c1,c2},[c.c1,c.c2]);
figure
ezplot(y_final,[0 10]);
xlabel('Time')
ylabel('Displacement')