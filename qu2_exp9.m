%Deflection in Cantilever Beam
clear vars;close all;clc
syms y(x) s Y x a b
wx = input('Input the Weight Function(w(x)): ');
E = input('Input the Elasticity(E): ');
I = input('Input the Moment of Inertia(I): ');
L = input('Input the length of Beam(L): ');
y0 = input('Input the value of y(0): ');
y10 = input('Input the value of Dy(0): ');
y2L = input('Input the value of D2y(L): ');
y3L = input('Input the value of D3y(L): ');
f = diff(y(x),4)-wx/E*I;
F = laplace(f);
F = subs(F,'laplace(y(x),x,s)',Y);
eq = subs(F,{'y(0)' 'D(y)(0)' 'D(D(y))(0)' 'D(D(D(y)))(0)'},[y0 y10 a b]);
sol = solve(eq,Y);
func_temp = ilaplace(sol,s,x);
a_b = solve(subs(diff(func_temp,2),L)==y2L,subs(diff(func_temp,3),L)==y3L,a,b);
func = subs(func_temp,{a,b},[a_b.a a_b.b]);