function plottrainingdata(labels, features)
    % Plot the training data on top of the boundary
    pos = find(labels == 1);
    neg = find(labels == -1);
    plot(features(pos,1), features(pos,2), 'ko', 'MarkerFaceColor', 'r'); hold on;
    plot(features(neg,1), features(neg,2), 'ko', 'MarkerFaceColor', 'g')

