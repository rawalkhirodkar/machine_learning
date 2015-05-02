%Shows the stability of classifier trained using max margin technique over perceptron


%Author: Aman Madaan, amanmadaan@cse.iitb.ac.in
%---Begin code ---

function [] = hyp_dance(n)
    sigma = rand(3, 3);
    sigma = sigma * sigma';
    m1 = [0;0;25];
    m2 = [0;0;-25];

    [m1, m2, S] = gen_sep_data()
    NUM_POINTS = 1000;
    for i = 1:n

        [X y] = prep_data_mean_cov(m1, m2, S, NUM_POINTS);
        [W_s b_s] = hinge_loss_max_margin(X, y, 10000);
        [W_bayes b_bayes] = bayes_optimal_gaussian(m1, m2, S);
        plot_hyp(W_bayes, b_bayes, 'green');
        view([-30.5 -20])
        title('Regularized: Green plane is bayes optimal, yellow is trained using max margin + hinge loss');
        hold on;
        plot_hyp_data(X, y, W_s, b_s, 'yellow');
        disp('Regularized: Green plane is bayes optimal, yellow is trained using max margin + hinge loss');
        pause(0.010);
        if(i == 1)
            input('Set your viewpoint');
        end
        hold off;
        camproj('orthographic')
    end
    hold off;
    disp('And now the non regularized case');
    input('press a key to continue');
    for i = 1:n
        [X y] = prep_data_mean_cov(m1, m2, S, NUM_POINTS);
        [W_l b_l] = perceptron(X, y);
        pause(0.010);
        [W_bayes b_bayes] = bayes_optimal_gaussian(m1, m2, S);
        plot_hyp(W_bayes, b_bayes, 'green');
        view([-30.5 -20])
        title('Unstable: Green plane is bayes optimal, cyan is trained using perceptron');
        hold on;
        plot_hyp_data(X, y, W_l, b_l, 'cyan');
        hold off;
        camproj('orthographic')
    end
    disp('Exiting');
end


