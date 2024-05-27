A = input('Input the (Transition)matrix: ');
k = size(A);
if (k(1)~=k(2))
    fprintf('\nNot a square matrix\n\n')
    return;
end
[X,Y] = eig(A);
cor_vec = 0;
for i=1:k
    if round(Y(i,i),10) == 1
        cor_vec = i;   %cor_vec is diagonal number of eigen vector corresponding to eigen value 1 
        break;
    end
end
if cor_vec==0
    fprintf('\nNone of the eigenvalues is 1\n\n')
    return;
end
rank = X(:,cor_vec)/sum(X(:,cor_vec));  %normalization - Dividing by sum of the elements of eigen vector corresponding to eigen value 1s
for i=1:k
    [val,pos] = max(rank);
    fprintf('\nRank %d is page %c with a Probability of %s\n',i,64+pos,num2str(val));
    rank(pos) = [-1];
end