function label = kmeansplus(data, K)

%get global
global N
N = size(data,1);
global d
d = size(data,2);

%% find a random center first
centroids = zeros(K,d);

random_indexes = rand(K,1);
random_indexes = ceil(random_indexes .* N);
random_indexes = unique(random_indexes);

centroids(1,:) = data(random_indexes(1,1),:);


%% Compute distance from each point to centroid
distance_to_centroids = zeros(N,d);
currentClusters = 1;
while currentClusters < K
    for i = 1 : N
        closestCentroid = FindClosestCentroid(data(i,:),centroids,currentClusters);
        distance_to_centroids(i,:) = euclidean_distance(data(i,:),centroids(closestCentroid,:));
    end
    maxDist = max(distance_to_centroids);
    probDistribution = distance_to_centroids / maxDist;
    sortProbDistribution = probDistribution;
    sortProbDistribution = sort(sortProbDistribution);
    
    random_indexes = rand(10,1);
    random_indexes = ceil(random_indexes .* 10) + (N-11);
    random_indexes = unique(random_indexes);
  
    currentClusters = currentClusters + 1;
    index = find(sortProbDistribution(random_indexes(1)) == probDistribution , 1 , 'first');
    
    centroids(currentClusters,:) = data(index,:);
end

%% make clusters

label = make_clusters(data,K,centroids);

%% if some clusters are empty, re-set that cluster's centroid.
while(find_empty_cluster(K, label) ~= 0)
    empty_cluster_index = find_empty_cluster(K, label);
    centroids = re_set_that_centroid(data, K, centroids, empty_cluster_index);
    label = make_clusters(data, K, centroids);
end

%% save current centroids in previous_centroids
previous_centroids = centroids;

%% update centroids using set_centroids
centroids = set_centroids(data, K, label);

%% if there are difference between centroids and previous_centroids, do all jobs again
while(check_change_of_centroids(previous_centroids, centroids, K) == 1)
    label = make_clusters(data, K, centroids);
    while(find_empty_cluster(K, label) ~= 0)
        empty_cluster_index = find_empty_cluster(K, label);
        centroids = re_set_that_centroid(data, K, centroids, empty_cluster_index);
        label = make_clusters(data, K, centroids);
    end
    previous_centroids = centroids;
    centroids = set_centroids(data, K, label);
end

end