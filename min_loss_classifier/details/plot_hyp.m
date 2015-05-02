%Plots the given hyperplane
%function[] = plot_hyp(W, b, color)

%Author: Aman Madaan, amanmadaan@cse.iitb.ac.in
%---Begin code ---

function[] = plot_hyp(W, b, color)
        [x, y] = meshgrid(-15:5:15); 
        Zv = @(x,y) (-W(1) * x -W(2) * y + b) / W(3);
        mesh(x,y,Zv(x,y), 'FaceColor', color);
end
