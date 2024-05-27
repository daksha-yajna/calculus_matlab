%Variation of Parameters when the External Force is Given at Points (but not as a function)
clear vars;close all;clc
syms m x c1 c2 t
a = input('Input the coefficient of Second Derivative of y(D2): ');
b = input('Input the coefficient of First Derivative of y(D1): ');
c = input('Input the coefficient of y(D0): ');
x_pts = input('Input the x vector: ');
fx = input('Input the function value vector: ');
n = numel(x_pts);
if numel(x_pts) ~= numel(fx)
    disp('The number of elements in x and function value vector are not equal.')
    return;
end
T = input('Input Period(2L/T): ');
N = input('Input the Number of Harmonics to be taken into consideration for the external Force: ');
a0 = 2*(sum(fx)/n);
snx = a0/2;
xx = (2*pi*x_pts)/T;%(converting rango from 0 to 2pi)
for i=1:N
    aa = 2*(sum(fx.*cos(xx*i))/n);
    bb = 2*(sum(fx.*sin(xx*i))/n);
    snx = snx + aa*cos(2*i*pi*t/T) + bb*sin(2*i*pi*t/T);
end
i1 = input('Input the initial condition for y0 = 0: ');
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
u1 = -int((y2*snx)/(a*Wd),x);
u2 = int((y1*snx)/(a*Wd),x);
yp = u1*y1 + u2*y2;
y = yc + yp;
eq1 = subs(y,x,0);
eq2 = subs(diff(y,x),x,0);
c_sol = solve(eq1-i1,eq2-i2,c1,c2);
y_final = subs(y,{c1,c2},[c_sol.c1,c_sol.c2]);
ezplot(y_final,[0 10]);
xlabel('Time')
ylabel('Displacement')