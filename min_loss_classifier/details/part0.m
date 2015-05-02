function[] = part0(n)
        sigma = rand(3, 3);
        sigma = sigma * sigma';
        m1 = [0;0;5];
        m2 = [0;0;-5];
        [X, y] = prep_data_mean_cov(m1, m2, sigma, n); 
        C = 1;
        %max margin
        [W b] = hinge_loss_square_max_margin(X, y, C);
        plot_hyp_data(X, y, W, b, 'red');
        hold on;
        
        %bayes
        [W_bayes b_bayes] = bayes_optimal_gaussian(m1, m2, sigma);
        plot_hyp(W_bayes, b_bayes, 'green');
        hold on;

        %perceptron
        [W b] = perceptron(X, y)
        plot_hyp(W, b, 'yellow')
end
