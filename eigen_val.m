syms lmbd
%n = input('Enter the size of the square matrix: ');
%A = zeros(n);
A = input('Input the matrix: ');
%disp('Going from up to down and then to next column, write the elements of your matrix one by one')
%for i = 1:(n*n)
%    ele = input('');
%    A(i) = ele;
%end
char_eq = A - (lmbd*(eye(size(A))));
sol = solve(det(char_eq),lmbd)