function [meanErr, medianErr, variance, skew, dist] = pointsError(points1, points2)
    dist = vecnorm(points1-points2, 2, 2);    
    meanErr = mean(dist);
    medianErr = median(dist);
    variance = var(dist);
    skew = skewness(dist);
end