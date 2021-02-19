function [I1Rect, I2Rect] = rectifyStereo(img1, img2, F, usedPoints1, usedPoints2, task, epiPoints1, epiPoints2)

fprintf("Rectifying images\n");

I1 = imread(img1);
I2 = imread(img2);

I1Size = size(I1);
I2Size = size(I2);

[t1,t2] = estimateUncalibratedRectification(F,usedPoints1,usedPoints2,size(I2));
[I1Rect,I2Rect] = rectifyStereoImages(I1,I2,t1,t2);

tform1 = projective2d(t1);
epiNewPoints1 = epiPoints1;
epiNewPoints1(:, [1, 2]) = transformPointsForward(tform1, epiPoints1(:,[1,2]));
epiNewPoints1(:, [3, 4]) = transformPointsForward(tform1, epiPoints1(:,[3,4]));
epiNewPoints1(:,1) = 0;
epiNewPoints1(:,3) = I1Size(2);

tform2 = projective2d(t2);
epiNewPoints2 = epiPoints2;
epiNewPoints2(:, [1, 2]) = transformPointsForward(tform2, epiPoints2(:,[1,2]));
epiNewPoints2(:, [3, 4]) = transformPointsForward(tform2, epiPoints2(:,[3,4]));
epiNewPoints2(:,1) = 0;
epiNewPoints2(:,3) = I2Size(2);

close(gcf);
imshow(I1Rect);
hold on;
line(epiNewPoints1(:,[1,3])',epiNewPoints1(:,[2,4])');
saveas(gcf,sprintf('report/%s/rectified/lines-1.png', task));

close(gcf);
imshow(I2Rect);
hold on;
line(epiNewPoints2(:,[1,3])',epiNewPoints2(:,[2,4])');
saveas(gcf,sprintf('report/%s/rectified/lines-2.png', task));

close(gcf);
I3D = stereoAnaglyph(I1Rect, I2Rect);
imshow(I3D);
saveas(gcf,sprintf('report/%s/rectified/3d.png', task));

end
