function volume = CalculateClusterVolumes(label,degreeMat,K)
    
    volume = zeros(K,1);
    global N;
    
    for i = 1:N
        volume(label(i)) = volume(label(i)) + degreeMat(i,i);
    end
    
end