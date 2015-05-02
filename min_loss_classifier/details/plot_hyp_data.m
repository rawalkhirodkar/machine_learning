%Plots the given hyperplane and 3d dataset

%Author: Aman Madaan, amanmadaan@cse.iitb.ac.in
%---Begin code ---

function[] = plot_hyp_data(X, y, W, b, color)
    scatter3(X(y == 1,1), X(y == 1, 2), X(y == 1, 3), 'r', 'filled');
    hold on;
    scatter3(X(y == -1,1), X(y == -1, 2), X(y == -1, 3), 'MarkerFaceColor',[0.5 .1 .7]);
    hold on;
    plot_hyp(W, b, color);
