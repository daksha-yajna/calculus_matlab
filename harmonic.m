syms x n
f = input('Input f(x): ');
p = input('Input Period(2L or T): ');
L = p/2;
N = input('Input the value of N(Number of Harmonics): ');
a0 = (int(f,x,-L,L))/L;
snx = a0/2;
an = (int(f*(cos((n*pi*x)/L)),x,-L,L))/L;
bn = (int(f*(sin((n*pi*x)/L)),x,-L,L))/L;
for i=1:N
     ann = subs(an,n,i);
     bnn = subs(bn,n,i);
     snx = snx + (ann*cos((i*pi*x)/L)) + (bnn*sin((i*pi*x)/L));
end
subplot(2,2,1)
ezplot(f,[-1 1])
subplot(2,2,2)
ezplot(snx,[-1 1])
%f = -1*(heaviside(x+1)-heaviside(x)) + (heaviside(x)-heaviside(x-1))