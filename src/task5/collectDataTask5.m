

img1Task5 = img1Task4b;
img2Task5 = img2Task4b;
task5 = "task5";

[I1RectTask5, I2RectTask5] = rectifyStereo(img1Task5, img2Task5, FTask4b, usedPoints1Task4b, usedPoints2Task4b, task5, epiPoints1Task4b, epiPoints2Task4b);
depthMap(I1RectTask5, I2RectTask5, task5, 1/1);
depthMap(I1RectTask5, I2RectTask5, task5, 1/2);
depthMap(I1RectTask5, I2RectTask5, task5, 1/4);
depthMap(I1RectTask5, I2RectTask5, task5, 1/8);
depthMap(I1RectTask5, I2RectTask5, task5, 1/16);