clear all;clc
syms t p y w m A R r C alpha %omega mu
u = (A*R^2/1i*alpha^2)*(1-besselj(0, y*(1i^3/2)*alpha)/besselj(0, (1i^3/2)*alpha));
u_sub = subs(u,{alpha,A,R},[1,1,1]);
ww = real(u_sub*exp(1i*w*t));
t_vec = [0:pi/6:2*pi];
for i=1:numel(t_vec)
    ww_sub = subs(ww,{w,t},[1,t_vec(i)]);
    ezplot(ww_sub,[-1,1,-0.06,0.06]);
    hold on;
end