function [] = evaluateMatchedPoints(name, matchedPoints1, matchedPoints2, img1, img2, task)

fprintf("Evaluating - %s\n", name);

[tform, inlierIdx] = estimateGeometricTransform2D(matchedPoints1, matchedPoints2, 'projective', 'MaxNumTrials',1000000, 'MaxDistance', 10);
close(gcf);
writematrix(tform.T, sprintf('report/%s/matched-points/%s-homography.txt',task, name));

usedPoints1 = matchedPoints1(inlierIdx, :);
usedPoints2 = matchedPoints2(inlierIdx, :);

estimatedMatchedPoints2 = transformPointsForward(tform, matchedPoints1); 
estimatedUsedPoints2 = transformPointsForward(tform, usedPoints1); 

[meanErr, medianErr, variance, skew, dist] = pointsError(estimatedMatchedPoints2, matchedPoints2);
[meanErrUsed, medianErrUsed, varianceUsed, skewUsed, distUsed] = pointsError(estimatedUsedPoints2, usedPoints2);


histogram(distUsed);
saveas(gcf,sprintf('report/%s/matched-points/%s-hist-used.png',task, name));
histogram(dist);
saveas(gcf,sprintf('report/%s/matched-points/%s-hist-matched.png', task, name));

showMatchedFeatures(imread(img1), imread(img2), matchedPoints1, matchedPoints2);
saveas(gcf,sprintf('report/%s/matched-points/%s-matched.png', task, name));

showMatchedFeatures(imread(img1), imread(img2), usedPoints1, usedPoints2);
saveas(gcf,sprintf('report/%s/matched-points/%s-used.png', task, name));


showMatchedFeatures(imread(img2), imread(img2), matchedPoints2, estimatedMatchedPoints2);
saveas(gcf,sprintf('report/%s/matched-points/%s-matched-estimated.png', task, name));

showMatchedFeatures(imread(img2), imread(img2), usedPoints2, estimatedUsedPoints2);
saveas(gcf,sprintf('report/%s/matched-points/%s-used-estimated.png', task, name));

fileID = fopen(sprintf('report/%s/matched-points/%s-errors.txt', task, name), 'w');

fprintf(fileID,'Matched Points: %d\n', length(matchedPoints1));
fprintf(fileID,'mean: %s\n', meanErr);
fprintf(fileID,'median: %s\n', medianErr);
fprintf(fileID,'variance: %s\n', variance);
fprintf(fileID,'skew: %s\n', skew);

fprintf(fileID,'\nUsed Points: %d\n', length(usedPoints1));
fprintf(fileID,'mean: %s\n', meanErrUsed);
fprintf(fileID,'median: %s\n', medianErrUsed);
fprintf(fileID,'variance: %s\n', varianceUsed);
fprintf(fileID,'skew: %s\n', skewUsed);

fclose(fileID);


end