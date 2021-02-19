function [features, validPoints] = getFeatureData(file, method)
img = imread(file);
grayImg = rgb2gray(img);

if method == "KAZE"
    points = detectKAZEFeatures(grayImg);
elseif method == "BRISK"
    points = detectBRISKFeatures(grayImg);
elseif method == "SURF"
    points = detectSURFFeatures(grayImg);
else
    poo;
end

[features, validPoints] = extractFeatures(grayImg, points);
end
