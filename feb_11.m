x=0;c=0.5;l=10;p=10; %Question 1 - 16BCE0783
counter=0;
p1 = [];p2 = [];
y=linspace(-c,c,6);
for i=1:numel(y)
    sx = (-3*p*(l-x)*y(i))/(4*c^3);
    sy = 0;
    txy = (-3*p*(c^2-y(i)^2))/(4*c^3);
    shr_mat = [sx txy;txy sy];
    lambda = eig(shr_mat);
    counter = counter+1;
    p1(counter) = lambda(1);
    p2(counter) = lambda(2);
end
p1,p2
plot(p1);text(2,180.5,'\leftarrow p2')
hold on;
plot(p2);text(5,-180.5,'\rightarrow p1')
title('16BCE0783');