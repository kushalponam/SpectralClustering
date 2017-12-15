function d = euclidean_distance(p1,p2)

p = p2-p1;

d = sqrt(sum(p .* p));

end