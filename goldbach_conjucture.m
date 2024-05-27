%Goldbach Conjucture - 16BCE0783 -> Number input = 783
n = input('Enter the number n: ');
list = [];
c = 0;
while n>1
    if (rem(n,2)==0)
        f = n/2;
    else
        f = (3*n) + 1;
    end
    c = c+1;
    n = f;
    list(c) = f;
end
list
disp(['Number of steps is: ',num2str(c)])