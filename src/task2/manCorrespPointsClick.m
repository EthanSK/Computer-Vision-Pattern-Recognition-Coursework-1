function [points] = manCorrespPointsClick(image_path)
close(gcf);
imshow(imread(image_path))
[x, y] = getpts;
points = [x, y];
end

% call like so: manMatchedPoints1 = manCorrespPointsClick('images/FD/1_obj.JPG')