function I = closest(S, x)
    [m,n] = size(S);
    s2xs = zeros(1, m);
    for i = 1:m
        s2xs(i) = euclidean_distance(S(i,:),x);
    end
    [M,I] = min(s2xs);
end