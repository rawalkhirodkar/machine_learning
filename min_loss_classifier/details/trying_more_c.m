%is searching over a larger space guaranteed to improve performance?

%Author: Aman Madaan, amanmadaan@cse.iitb.ac.in
%---Begin code ---


function [] = trying_more_c()
    %read data
    X_train = importdata('mperf_X_train.tsv');
    y_train = importdata('mperf_y_train.tsv');
    X_test = importdata('mperf_X_test.tsv');
    y_test = importdata('mperf_y_test.tsv');
    
    c_range_smaller = 2 .^ [1:5];
    c_range_larger = 2 .^ [1:10];
    num_folds = 5;
    
    hlmm = @hinge_loss_max_margin;
    %find the best C
    [small_acc small_c] = cross_validate(X_train, y_train, c_range_smaller, num_folds, hlmm);
    [large_acc large_c] = cross_validate(X_train, y_train, c_range_larger, num_folds, hlmm);
    [W_l b_l] = hinge_loss_square_max_margin(X_train, y_train, large_c);
    [W_s b_s] = hinge_loss_square_max_margin(X_train, y_train, small_c);
    
    %find accuracy on the test set
    large_accuracy = get_model_accuracy(X_test, y_test, W_l, b_l);
    small_accuracy = get_model_accuracy(X_test, y_test, W_s, b_s);

    small_acc_str = sprintf('Small C range, test set accuracy = %.5f for C = %d', small_accuracy, small_c);
    large_acc_str = sprintf('Large C range, test set accuracy = %.5f for C = %d', large_accuracy, large_c);
    disp(small_acc_str);
    disp(large_acc_str);
end
