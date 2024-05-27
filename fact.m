function y = fact(n)
c = n;
if rem(n,1)~=0
    disp('n is not integer')
    return;
end
if n<0
    disp('n is less than 0')
    return;
end
y = 1;
for i=1:n
    y = y*c;  
    c = c-1;
end