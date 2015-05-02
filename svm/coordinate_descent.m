% Roll number:130050014
% Rawal Khirodkar
% y is m*1 matrix
% X is m*n matrix, ith row of X is the feature vector of ith training sample.
% Assuming the scaling of X matric is done
% C is a input parameter of the function

function [W] = coordinate_descent(X ,y, C)
	n = size(X,2);
	m = size(X,1);
	U = C;% U = C  --> hingeloss

	%normalize
	a = mean(X);
	for i = 1:n
		X(:,i) = X(:,i)/a(1,i);
	end
	%"appending 1 at end of each feature vector to incorporate "b" in W" 

	X = [X, ones(m,1)];


	%random initialisation of alpha
	alpha = rand(m,1); %random numbers from 0 to 1

	%coefficients of linear combinations of feature vectors
	lin_coeff = y.*alpha;

	for i = 1:m
		for j = 1:n+1
			temp_X(i,j) = lin_coeff(i) * X(i,j);
		end
	end

	W = sum(temp_X)'; %'starting W, dimension is n+1 * 1

	prev_W = rand(n+1,1);

	%'in case of hinge loss, diagonal matrix D is null matrix as given in the paper'

	%calculating W below
	while prev_W ~= W %convergence condition
		prev_W = W;
		for i = 1:m
			G = y(i,1) * (W' * X(i,:)') - 1;%xi is X(i,:) transpose

			if alpha(i,1) == 0
				PG = min(G,0);
			end
			if alpha(i,1) == U
				PG = max(G,0);
			end
			if alpha(i,1) > 0 & alpha(i,1) < U
				PG = G;
			end

			%updation according to algo
			if PG ~= 0
				alpha_bar = alpha(i,1);

				%matric Q bar is same as Q,because D matrix is NULL in case of hingeloss
				alpha(i,1) = min( max( (alpha(i,1) - G)/(y(i,1)*y(j,1)*( X(i,:) * X(j,:)')) ,0), U );

				%updating W in each iteration
				W = W + (alpha(i,1) - alpha_bar)* y(i,1) * X(i,:)';
			end
		end
	end

	prediction = round(X*W);
	accuracy = (sum(prediction == y)/m) * 100

	 k = y .* (X*W); k = 1-k;
	 k = max( k , 0);
	objective_value = 0.5*( W'*W ) + C * sum(k) %objective_value

end
 