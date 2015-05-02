function vary_gamma_linear_data()
    p = 1:5;
    g = 10 .^ p;
    for i =1:5
        optionsStr = sprintf('-t 2 -g %d', i);
        model = svmtrain(train_labels, train_features, optionsStr);

