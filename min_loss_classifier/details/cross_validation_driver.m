%Drives step 3 of the assignment. Calls cross_validate with different classifiers and reports accuracy.
%Expects a range of C to search over.

%Author: Aman Madaan, amanmadaan@cse.iitb.ac.in
%---Begin code ---

function [] = cross_validation_driver(C_range)
    %load datasets
    X_train = importdata('mperf_X_train.tsv');
    y_train = importdata('mperf_y_train.tsv');
    num_folds = 5;
    hlmm = @hinge_loss_max_margin;
    hlmms = @hinge_loss_square_max_margin;
    [hl_mm_acc hl_mm_c] = cross_validate(X_train, y_train, C_range, num_folds, hlmm);
    [hls_mm_acc hls_mm_c] = cross_validate(X_train, y_train, C_range, num_folds, hlmms);

    hl_res = sprintf('Hinge loss max margin: Best Accuracy = %.5f for C = %d', hl_mm_acc, hl_mm_c);
    hls_res = sprintf('Hinge square loss max margin: Best Accuracy = %.5f for C = %d', hls_mm_acc, hls_mm_c);
    disp(hl_res);
    disp(hls_res);
end





