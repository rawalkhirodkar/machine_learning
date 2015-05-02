%sg
%generates a 3d random gaussian distribution sample of given size
%given a mean, sigma and the number of samples

%Author: Aman Madaan, amanmadaan@cse.iitb.ac.in
%---Begin code ---

function [X] = rnorm3(mean_vec, sigma, n)
X = mvnrnd(mean_vec, sigma, n);
end
