function label = FindClosestCentroid(point,centroids,n)

if n == 1
    label = 1;
else
    distance = zeros(n,1);
    for i = 1 : n
        distance(i,1) = euclidean_distance(point,centroids(i,:));
    end
    min_distance_to_centroids = min(distance);
    index_min = find(distance == min_distance_to_centroids, 1, 'first');
    label = index_min;
 
end

end