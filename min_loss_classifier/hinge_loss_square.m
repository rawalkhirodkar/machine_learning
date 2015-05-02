% Roll number:130050014
% Rawal Khirodkar
%hinge square loss
function [W, b] = hinge_loss(X ,y)
	n = size(X,2);
    cvx_begin
		variables W(n) b
		minimize ( sum(  square_pos(max(0, 1- y.*(X*W - b) ) ) ) );
	cvx_end
end
 
