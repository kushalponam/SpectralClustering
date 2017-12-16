function S = kmeans(X, k)
    S = datasample(X, k, 'Replace', false);
    Xs = centers2clusters(S, X, k);
    new_S = clusters2centers(Xs, k);
    while ~isequal(S, new_S)
        Xs = centers2clusters(S, X, k);
        S = new_S;
        new_S = clusters2centers(Xs, k);
    end
end

function Xs = centers2clusters(S, X, k)
    [m,n] = size(X);
    Xs_ms = 1:m:m*k;
    Xs = NaN(m*k, n);
    for i = 1:m
        x = X(i);
        cluster_i = closest(S, x);
        Xs_m = Xs_ms(cluster_i);
        Xs_ms(cluster_i) = Xs_ms(cluster_i) + 1;
        Xs(Xs_m,:) = x;        
    end
end

function S = clusters2centers(Xs, k)
    [m, n] = size(Xs);
    m = m / k;
    S = NaN(k, n);
    for i = 1:k
        cluster_size = 0;
        for j = 1:m
            Xs_m = (i-1)*m+1;
            if ~isnan(Xs(Xs_m, 1))
               S(i,:) = S(i,:) + Xs(Xs_m,:);
               cluster_size = cluster_size + 1;
            end
        end
        S(i, :) = S(i, :) / cluster_size;
    end
end

function I = closest(S, x)
    [m,n] = size(S);
    s2xs = zeros(m);
    for i = 1:m
        s2xs(i) = euclidean_distance(S(i,:),x);
    end
    [M,I] = min(s2xs);
end