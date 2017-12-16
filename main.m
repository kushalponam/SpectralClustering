%function label = main(filename,K,sigma)

%% Load data
A = importdata('data/aggregation.txt');

global D
D = A(:,[1,2]);

global N
N = size(D,1)
sigma = 1;
K = 5;

matrix_A = zeros(N,N);

for i=1:N
    for j=1:N
        distance_ij = euclidean_distance(D(i,:), D(j,:));
        matrix_A(i, j) = exp(-distance_ij/(2*sigma^2));
        if(i == j)
            matrix_A(i, j) = 0;
        end
    end
end


%% calculate Degree matrix
matrix_D = zeros(N,N);


for i=1:N
    matrix_D(i, i) = sum(matrix_A(i, :));
end

%% calculate laplacian matrix
matrix_L = zeros(N,N);

for i=1:N
    for j=1:N
        matrix_L(i,j) = matrix_A(i,j) / (sqrt(matrix_D(i,i)) * sqrt(matrix_D(j,j)));  
    end
end

%% calculate eigenvalue and eigen vector
[eigenvectors, eigenvalues] = eig(matrix_L);

matrix_X = zeros(N, K);
size_eigenvectors = size(eigenvectors(1,:));
size_eigen = size_eigenvectors(1,2);
matrix_X(:, :) = eigenvectors(:, size_eigen-K+1:size_eigen);

%% calculate normalized matrix of eigenvector and run kmeans on it
matrix_Y = normc(matrix_X);

label = kmeansplus(matrix_Y,K);
%%call kmeans on matrix_Y and K
%[idx, S] = kmeans(matrix_Y, K);
S = mykmeans(matrix_Y, K);
value = objective(matrix_Y, S);
end