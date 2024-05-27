syms lmbd
A = input('Input the matrix: ');
k = size(A);
if (k(1)~=k(2))
    disp('Not a square matrix')
    return;%stops the program
end
%char_eq = A - (lmbd*(eye(k)));
%sol = solve(det(char_eq),lmbd)
[X,Y] = eig(A)
%X gives modal matrix(P) and Y gives Diagonal Matrix (D)
