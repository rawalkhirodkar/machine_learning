 % Roll number:130050014
 % Rawal Khirodkar
 %hinge loss
function [W, b] = hinge_loss(X ,y)
	n = size(X,2);
    cvx_begin
		variables W(n) b
		minimize ( sum(max(0, 1- y .* (X*W - b))) );
	cvx_end
end
 
