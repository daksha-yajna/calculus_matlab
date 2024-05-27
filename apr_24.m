%Solving Second Order DE using Laplace Transform
%Use '' to enter string as an argument in function
clear vars;close all;clc
syms y(t) s Y
a = input('Input the coefficient of D2y(t): ');
b = input('Input the coefficient of D1y(t): ');
c = input('Input the coefficient of D0y(t) or y(t): ');
inhomo = input('Input the Inhomogenoous Function: ');
y0 = input('Input the value of y(0): ');
y10 = input('Input the value of Dy(0): ');
f = a*diff(y(t),2)+b*diff(y(t))+c*y(t)-inhomo;
F = laplace(f);
F = subs(F,'laplace(y(t),t,s)',Y);
eq_1 = subs(F,{'y(0)' 'D(y)(0)'},[y0 y10]);
sol_1 = solve(eq_1,Y);
func = ilaplace(sol_1);
ezplot(func,[0 4*pi])