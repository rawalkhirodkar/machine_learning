%Returns means and a sigma to help in generating inseparable data sampled from a 
%3d gaussian

%Author: Aman Madaan, amanmadaan@cse.iitb.ac.in
%---Begin code ---

function[m1, m2, sigma] = gen_insep_data()
    sigma = rand(3, 3) .* 10;
    sigma = sigma * sigma';
    m1 = [4;3;6];

    m2 = [4;-1;7]; 
