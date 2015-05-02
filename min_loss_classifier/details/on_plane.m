%This demo depicts the difference between training time when lots of points sit on the surface, hence
%motivating the importance of the dual formulation (most of the times the points won't all be on the 
%surface)

%Author: Aman Madaan, amanmadaan@cse.iitb.ac.in
%---Begin code ---

function [] = why_the_dual(n)
    %first plane
    [X Y] = meshgrid(-n:1:n);
    Z = X + Y;
    X_train = []
    for i = 1:n
        for j = 1:n
            X_train = [X_train;[X(i, j) Y(i, j) Z(i, j)]];
        end
    end
    Z = X + Y + 1000;
    for i = 1:n
        for j = 1:n
            X_train = [X_train;[X(i, j) Y(i, j) Z(i, j)]];
        end
    end
    y_train = [ones(n*n, 1);-1 * ones(n*n, 1)];
    time_start = tic;
    [W_pl b_pl] = hinge_loss_max_margin(X_train, y_train, 1);
    time_taken_for_planar_data = toc(time_start)

    plot_hyp_data(X_train, y_train, W_pl, b_pl, 'yellow');
    
    input('press any key to continue');

    [m1, m2, S] = gen_insep_data()
    [X y] = prep_data_mean_cov(m1, m2, S, n*n);
    
    time_start = tic;
    [W b] = hinge_loss_max_margin(X, y, 1);
    plot_hyp_data(X, y, W, b, 'yellow');
    time_taken_for_fuzzy_data = toc(time_start)
end


