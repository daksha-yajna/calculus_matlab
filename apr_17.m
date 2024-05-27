syms t p w m A r C %omega mu
ysol = dsolve('r^2*D2y + r*Dy - (I*w*p/m)*r^2*y == -A*r^2/m','r');
matlab_consts = setdiff(symvar(ysol),[t p w m A r C]);
ysol = subs(ysol,matlab_consts,[C,0]);
C = solve(subs(ysol,r,sym('R')),C);
ysol = eval(ysol);
W = real(ysol*exp(1i*w*t));