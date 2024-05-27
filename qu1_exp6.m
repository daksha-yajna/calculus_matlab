%Converting Discrete to Continous function using Fourier Function 16BCE0783
clear vars;close all;clc;
x = input('Input the time vector: ');
ff = input('Input the Voltage Source vector: ');
T = input('Input Period(2L/T): ');
N = input('Input the Number of Harmonics: ');
q = fourierseries(x,ff,T,N);
disp(['The charge on the capacitor as a function of time is:',char(10)]);
pretty(q)
ezplot(q,[0 4*pi]);
ylabel('Charge across Capacitor')
xlabel('time - 16BCE0783')