%Solving Second Order DE using Laplace Transform
%Use '' to enter string as an argument in function
%sym2str - Copyright (c) 2008, Martin Lawson. All rights reserved.
%Ignore the dots(.) in Output. - 16BCE0783
clear vars;close all;clc
syms y(t) s Y
a = input('Input the coefficient of D2y(t): ');
b = input('Input the coefficient of D1y(t): ');
c = input('Input the coefficient of D0y(t) or y(t): ');
y0 = input('Input the value of y(0): ');
y10 = input('Input the value of Dy(0): ');
type = {'Color','LineStyle'};
value = {'r','g','k','-','--',':'};
sol_store = [];
for j=1:3
    fprintf('Input f1(t) for iteration number %d:\t',j)
    inhomo1 = input('');
    fprintf('Input f2(t) for iteration number %d:\t',j)
    inhomo2 = input('');
    inhomo = inhomo1 + inhomo2;
    f = a*diff(y(t),2)+b*diff(y(t))+c*y(t)-inhomo;
    F = laplace(f);
    F = subs(F,'laplace(y(t),t,s)',Y);
    eq = subs(F,{'y(0)' 'D(y)(0)'},[y0 y10]);
    sol = solve(eq,Y);
    func = ilaplace(sol);
    sol_store = [sol_store func];
    fprintf('The solution for iteration number %d is:\n',j)
    disp(sym2str(func))
    fprintf('\n')
    H = ezplot(func,[0 5*pi]);
    set(H,type(1),value(j),type(2),value(j+3));
    legend(H,sym2str(inhomo))
    hold on;
    title('16BCE0783')
end