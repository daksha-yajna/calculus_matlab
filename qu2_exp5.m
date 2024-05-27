%Solving an RC Circuit
%sym2str - Copyright (c) 2008, Martin Lawson. All rights reserved.
clear vars;close all;clc;
syms q(t) i(t)
r = input('Input the value of Resistor: ');
c = input('Input the value of Capacitor: ');
e = input('Input the external Voltage: ');
Dq = diff(q);
sol_q = dsolve(r*Dq+(q/c) == e,Dq(0) == e/r);
sol_q = vpa(sol_q);
%time constant is the time at which the charge on the capacitor is equal to
%(1-1/e) times final charge(=c*e)(which occurs at infinity) (in charging state)
max_q = limit(sol_q,t,inf);
time_const = solve(sol_q == (1-1/exp(1))*max_q,t);
max_i = limit(diff(sol_q),t,0);
disp(['The time constant for the given circuit is:',char(10),sym2str(time_const),char(10)]);
disp(['The maximum charge on the capacitor in the given circuit is:',char(10),sym2str(max_q),char(10)]);
disp(['The maximum current in the given circuit is:',char(10),sym2str(max_i)]);
subplot(2,2,1)
ezplot(sol_q,[0 7]);
title('Capacitor Charge - Charging - 16BCE0783')
subplot(2,2,2)
ezplot(diff(sol_q),[0 7]);
title('Capacitor Current - Charging')
%Discharging State
sol2_q = dsolve(Dq+q/(r*c)==0,q(0)==max_q);
subplot(2,2,3)
ezplot(sol2_q,[0 7]);
title('Capacitor Charge - Discharging')
subplot(2,2,4)
ezplot(diff(sol2_q),[0 7]);
title('Capacitor Current - Discharging')