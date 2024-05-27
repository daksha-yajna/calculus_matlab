c=0.5;l=10;p=10;
p1 = [];p2 = [];
x=linspace(0,l,200);
y=linspace(-c,c,24);
[X,Y] = meshgrid(x,y);
for i=1:numel(x)
    for j=1:numel(y)
        sx = (-3*p*(l-X(j,i)).*Y(j,i))/(4*c^3);
        sy = 0;
        txy = (-3*p*(c^2-Y(j,i).^2))/(4*c^3);
        shr_mat = [sx txy;txy sy];
        lambda = eig(shr_mat);
        p1(j,i) = lambda(1);
        p2(j,i) = lambda(2);
    end
end
contour(X,Y,p2,10);text(8.191,0.1957,'\leftarrow p2')
hold on;
contour(X,Y,p1,10);text(7.035,-0.1087,'\rightarrow p1')
title('16BCE0783')