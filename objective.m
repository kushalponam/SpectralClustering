function D = objective(X, S)
    D = 0;
    [m,n] = size(X);
    for i = 1:m
        x = X(i,:);
        cluster_i = closest(S, x);
        s = S(cluster_i, :);
        D = D + euclidean_distance(s, x);
    end
end