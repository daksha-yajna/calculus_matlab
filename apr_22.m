%Double Mass System Solving
syms y(t)
m1 = input('Input m1: ');
m2 = input('Input m2: ');
k1 = input('Input k1: ');
k2 = input('Input k2: ');
A = inv([m1 0;0 m2])*[-(k1+k2) k2;k1 -k2];
%or A = [m1 0;0 m2]/[-(k1+k2) k2;k1 -k2]
%V2 is diagonal matrix
dim = size(A);
[V1,V2] = eig(sym(A));
sols = [];
for i=1:dim
    temp = dsolve(diff(y,2) == V2(i,i)*y);
    sols = [sols temp];
end
vec_X = V1*transpose(sols);
matlab_consts = setdiff(symvar(vec_X),[t]);
final = subs(vec_X,matlab_consts,[1,2,3,4]);