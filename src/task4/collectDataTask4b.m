

task4 = "task4";

img1Task4b = "images/FD/2_obj.JPG";
img2Task4b = "images/FD/3_obj.JPG";

[points1Task4b, points2Task4b] = autoCorrespPoints(img1Task4b, img2Task4b, "KAZE");
[FTask4b, usedPoints1Task4b, usedPoints2Task4b, epiPoints1Task4b, epiPoints2Task4b] = fundamentalMatrix(img1Task4b, img2Task4b, points1Task4b.Location, points2Task4b.Location, task4, "out");





