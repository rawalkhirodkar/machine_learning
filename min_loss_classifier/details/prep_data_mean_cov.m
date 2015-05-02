%this function accepts a number mean1, mean2, covariance and n and generates a training
%data file which is basically n samples taken from gaussians with random
%variances centered at mean1 and mean2

%Author: Aman Madaan, amanmadaan@cse.iitb.ac.in
%---Begin code ---


function[X, y] = prep_data_mean_cov(mean1, mean2, S, n)
x1 = rnorm3_sigma(mean1, S, n);
x2 = rnorm3_sigma(mean2, S, n);
y = [ones(n, 1);-1 * ones(n, 1)];
X = [x1;x2];
end
