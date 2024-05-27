syms t
x = input('Input the x vector: ');
f = input('Input the function value vector: ');
n = numel(x);
if numel(x) ~= numel(f)
    disp('The number of elements in x and function value vector are not equal.')
    return;
end
T = input('Input Period(2L/T): ');
N = input('Input the Number of Harmonics: ');
a0 = 2*(sum(f)/n);
snx = a0/2;
xx = (2*pi*x)/T;%(converting rango from 0 to 2pi)
for i=1:N
    aa = 2*(sum(f.*cos(xx*i))/n);
    bb = 2*(sum(f.*sin(xx*i))/n);
    snx = snx + aa*cos(2*i*pi*t/T) + bb*sin(2*i*pi*t/T);
end
ezplot(snx,[x(1) x(n)]);
hold on
for j=1:n
    plot(x(j),f(j),'ro')
    hold on
end