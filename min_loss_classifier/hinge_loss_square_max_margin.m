% Roll number:130050014
% Rawal Khirodkar
%hinge square loss
function [W, b] = hinge_loss_square_max_margin(X, y, C)
	m = size(X,1);
	n = size(X,2);
	k = C/m;
    cvx_begin
		variables W(n) b;
		minimize ( (0.5* sum_square_abs(W)) + k* sum(  square_pos(max(0, 1- y.*(X*W - b) ) ) ) );
	cvx_end
end
 
