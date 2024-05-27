%Double Mass System Solving
clear vars;close all;clc;syms y(t)
m1 = input('Input m1: ');
m2 = input('Input m2: ');
k1 = input('Input k1: ');
k2 = input('Input k2: ');
x0 = input('Input x1(0): ');
x10 = input('Input diff(x1)(0): ');
x2 = input('Input x2(0): ');
x20 = input('Input diff(x2)(0): ');
A = inv([m1 0;0 m2])*[-(k1+k2) k2;k1 -k2];
dim = size(A);
[V1,V2] = eig(sym(A));
sols = [];
for i=1:dim
    temp = dsolve(diff(y,2) == V2(i,i)*y);
    sols = [sols temp];
end
vec_X = V1*transpose(sols);
matlab_consts = setdiff(symvar(vec_X),[t]);
comp_sols = solve(subs(vec_X(1),t,0)==x0,subs(diff(vec_X(1),t),t,0)==x10,subs(vec_X(2),t,0)==x2,subs(diff(vec_X(1),t),t,0)==x20,matlab_consts);
final_vec_X = subs(vec_X,matlab_consts,[comp_sols.C3,comp_sols.C4,comp_sols.C6,comp_sols.C7]);
subplot(2,2,1)
ezplot(final_vec_X(1))
title('16BCE0783')
ylabel('X1')
subplot(2,2,2)
ezplot(diff(final_vec_X(1)))
title('See y-axis')
ylabel('V1')
subplot(2,2,3)
ezplot(final_vec_X(2))
title(' ')
ylabel('X2')
subplot(2,2,4)
ezplot(diff(final_vec_X(2)))
title(' ')
ylabel('V2')