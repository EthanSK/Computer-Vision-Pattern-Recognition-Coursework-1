function [F, usedPoints1, usedPoints2, epiPoints1, epiPoints2] = fundamentalMatrix(img1, img2, matchedPoints1, matchedPoints2, task, name)

fprintf("Calculating fundemental matrix - %s\n", name)

[F, inliers] = estimateFundamentalMatrix(matchedPoints1, matchedPoints2, 'NumTrials', 10000, 'Method', 'RANSAC', 'DistanceThreshold', 0.01);

writematrix(F, sprintf('report/%s/epipolar/%s-fundemental.txt',task, name));
usedPoints1 = matchedPoints1(inliers, :);
usedPoints2 = matchedPoints2(inliers, :);

function [epiPoints] = epiStuff(img, matchedPoints, inliers, F, innerName, usedPointsOther)
    I = imread(img);

    close(gcf);
    imshow(I); 
    hold on;
    plot(matchedPoints(inliers,1), matchedPoints(inliers,2),'go')

    [isIn, epipole] = isEpipoleInImage(F, size(I));

    epiLines = epipolarLine(F', usedPointsOther);
    epiPoints = lineToBorderPoints(epiLines,size(I));
    line(epiPoints(:,[1,3])',epiPoints(:,[2,4])');

    if isIn
        title('Contains Epipole');
    else
        title('Does Not Contain Epipole');
    end

    saveas(gcf,sprintf('report/%s/epipolar/%s-lines-%s.png', task, name, innerName));
end

[epiPoints1] = epiStuff(img1, matchedPoints1, inliers, F, '1', usedPoints2);
[epiPoints2] = epiStuff(img2, matchedPoints2, inliers, F', '2', usedPoints1);

end