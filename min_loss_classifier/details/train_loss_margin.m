%problem 2

function [] = train_loss(n, C)
    [m1, m2, sigma] = gen_insep_data();
    [X, y] = prep_data_mean_cov(m1, m2, sigma, n);


    %hinge loss
    [W b] = hinge_loss_max_margin(X, y, C);
    plot_hyp_data(X, y, W, b, 'red');
    hold on;

    %hinge_loss_square
    [W_hsq b_hsq] = hinge_loss_square_max_margin(X, y, C);
    plot_hyp(W_hsq, b_hsq, 'yellow');

    %bayes optimal
    [W_bayes b_bayes] = bayes_optimal_gaussian(m1, m2, sigma);
    plot_hyp(W_bayes, b_bayes, 'green');
    hold on;

    xlabel('x1');
    ylabel('x2');
    zlabel('x3');
    title('Classification by minimizing loss and maximizing margin');
end
 
    

