% function like = calcGaussianProb(data,gaussMean,gaussCov)
function like = calcGaussianProb(data, gaussMean, gaussCov)
[nDim nData] = size(data);
e= exp(-(0.5* (data-gaussMean)' * inv(gaussCov) *(data-gaussMean)));
like=( 1/(((2*pi)^(nDim/2))* sqrt(det(gaussCov))))* e;