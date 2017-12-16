function label = loadData(fileName)

A = importdata(fileName);

%global D
D = A(:,[1,2]);

%global N
N = size(D,1);

label = kmeansplus(D,5);

end