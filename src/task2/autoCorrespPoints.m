function [autoMatchedPoints1, autoMatchedPoints2] = autoCorrespPoints(img1, img2, method)

fprintf("Auto Correspondence - %s\n", method);

[features1, validPoints1] = getFeatureData(img1, method);
[features2, validPoints2] = getFeatureData(img2, method);


pairs = matchFeatures(features1, features2, "Unique", true, "Method", 'Approximate');
autoMatchedPoints1 = validPoints1(pairs(:,1));
autoMatchedPoints2 = validPoints2(pairs(:,2));


end




