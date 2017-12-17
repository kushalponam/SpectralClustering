function label = set_label(X, S)
    [m, n] = size(X);
    label = NaN(m, 1);
    for i = 1:m
        x = X(i,:);
        cluster_i = closest(S, x);
        label(i) = cluster_i;
    end
end