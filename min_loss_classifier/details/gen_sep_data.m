%Returns means and a sigma to help in generating separable data sampled from a 
%3d gaussian

%Author: Aman Madaan, amanmadaan@cse.iitb.ac.in
%---Begin code ---

function[m1, m2, sigma] = gen_sep_data(n)
    sigma = rand(3, 3);
    sigma = sigma * sigma';
    m1 = [0;0;5];
    m2 = [0;0;-5];
end
