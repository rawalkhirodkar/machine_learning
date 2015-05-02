%Perceptron: Derived from http://www.cs.toronto.edu/~hinton/csc321/tutorialcode/perceptron.m

%Author: Aman Madaan, amanmadaan@cse.iitb.ac.in
%---Begin code ---

function [W b] = perceptron(X,Y)
X = X'; %let us be consistent with the notation, X remains a M x N matrix
%Add ones to the X corresponding to the bias
X = [X;ones(1, size(X, 2))]; 
w = zeros(size(X, 1), 1);
num_iter = 100;
for iteration = 1 : num_iter  %<- in practice, use some stopping criterion!
  for ii = 1 : size(X,2)         %cycle through training set
    if sign(w'*X(:,ii)) ~= Y(ii) %wrong decision?
      w = w + X(:,ii) * Y(ii);   %then add (or subtract) this point to w
    end
  end
  %sum(sign(w'*X)~=Y)/size(X,2)   %uncomment to show misclassification rate
end
W = w(1:3);
b = w(4);
end
