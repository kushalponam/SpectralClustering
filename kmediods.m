
function [label, index, opt_target_val] = kmediods(X, init)
  [d,n] = size(X);
  if numel(init)==1
      k = init;
      label = ceil(k*rand(1,n));
  elseif numel(init)==n
      label = init;
  end
  X = X-mean(X,2);             
  v = dot(X,X,1);
  D = v+v'-2*(X'*X);            % Euclidean distance matrix
  D(sub2ind([d,d],1:d,1:d)) = 0;              
  last = zeros(1,n);
  while any(label ~= last)
      [~,~,last(:)] = unique(label);   % remove empty clusters
      [~, index] = min(D*sparse(1:n,last,1),[],1);  % find k medoids
      [val, label] = min(D(index,:),[],1);                % assign labels
  end
  opt_target_val = sum(val);
end