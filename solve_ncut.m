function ncut = solve_ncut(data, vols, label, L, D)
   X = solve_X(data, vols, label)
   [m,n] = size(vols);
   ncut = 0;
   for j=1:m
       X_j = X(:,j);
       numerator = (X_j')*L;
       numerator = numerator * X_j;
       denominator = (X_j')*D*(X_j);
       value = numerator/denominator;
       ncut = ncut + value;
   end
end

function X = solve_X(data, vols, label)
    [m, n] = size(data);
    [m1,n1] = size(vols);
    X = NaN(m,m1);
    for i=1:m
        for j=1:m1
            if label(i) == j
                a_j = 1/sqrt(vols(j));
                X(i,j) = a_j;
            else
                X(i,j) = 0;
            end
        end
    end
end