% Roll number:130050014
% Rawal Khirodkar

function [best_accuracy, best_C] = cross_validate(X ,y, C_range, folds, classifier)
	m = size(X,1);
	size1 = size(X,1)/folds;
	for j = 1:5
		for i = 1:folds 
			start_index = (i-1)*size1 + 1;
			end_index = start_index + size1 - 1;

			X_test = X(start_index:end_index,:);
			y_test = y(start_index:end_index,:);

			if (start_index == 1)
				X_train = X(end_index + 1 : m ,:);
				y_train =  y(end_index + 1 : m ,:);
			else
				X_train = [X(1:start_index-1,:) ; X(end_index+1:m,:)];
				y_train = [y(1:start_index-1,:) ; y(end_index+1:m,:)];
			end

			[W b] = classifier(X_train,y_train,C_range(j)); 

			prediction = X_test*W - b;
			prediction(find(prediction == 0)) = 1;

			prediction = sign(prediction);
			accuracy(1,i) = sum(prediction == y_test) / size1;
		end
		final_accuracy(1,j) = sum(accuracy) * 20;
	end

	[best_accuracy,index] = max(final_accuracy); %accuracy in percentage
	best_C = C_range(index);
end
 
