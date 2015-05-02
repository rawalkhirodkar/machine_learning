%This function plots the bayes optimal boundary for the gaussian with means
%mean1, mean2 and covariance given by S

%Author: Aman Madaan, amanmadaan@cse.iitb.ac.in
%---Begin code ---

function [W b] = bayes_optimal_gaussian(m1, m2, S)
    W = inv(S) * (m1 - m2)
    x0 = (m1 + m2) / 2
    b = W' * x0
end
    
