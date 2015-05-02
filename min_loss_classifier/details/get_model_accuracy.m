%Returns the accuracy of a margin based classifier on the given test dataset
%function [accuracy] = get_model_accuracy(X_test, y_test, W, b)

%Author: Aman Madaan, amanmadaan@cse.iitb.ac.in
%---Begin code ---

function [accuracy] = get_model_accuracy(X_test, y_test, W, b)
    correct = 0;
        for i = 1:size(X_test, 1)
            if(((X_test(i, :) * W - b) * y_test(i)) > 0)
                correct = correct + 1;
        end
    end

    accuracy = correct / size(X_test, 1)


