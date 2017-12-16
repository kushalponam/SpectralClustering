function S = mykmeans(X, k)
    S = datasample(X, k, 'Replace', false);
    Xs = centers2clusters(S, X, k);
    new_S = clusters2centers(Xs, k);
    while ~isequal(S, new_S)
        S = new_S;
%         D = objective(X, S);
        Xs = centers2clusters(S, X, k);
        new_S = clusters2centers(Xs, k);
    end
end

function Xs = centers2clusters(S, X, k)
    [m,n] = size(X);
    Xs_ms = 1:m:m*k;
    Xs = NaN(m*k, n);
    for i = 1:m
        x = X(i,:);
        cluster_i = closest(S, x);
        Xs_m = Xs_ms(cluster_i);
        Xs_ms(cluster_i) = Xs_ms(cluster_i) + 1;
        Xs(Xs_m,:) = x;        
    end
end

function S = clusters2centers(Xs, k)
    [m, n] = size(Xs);
    m = m / k;
    S = zeros(k, n);
    for i = 1:k
        cluster_size = 0;
        for j = 1:m
            Xs_m = (i-1)*m+j;
            if ~isnan(Xs(Xs_m, 1))
               S(i,:) = S(i,:) + Xs(Xs_m,:);
               cluster_size = cluster_size + 1;
            end
        end
        S(i, :) = S(i, :) / cluster_size;
    end
end



