
img1Task4a1 = "images/HG/35mm_rotB_3_obj.JPG";
img2Task4a2 = "images/HG/50mm_rotA_1_obj.JPG";
task4 = "task4";


[points1Task4a, points2Task4a] = autoCorrespPoints(img1Task4a1, img2Task4a2, "BRISK");

evaluateMatchedPoints('BRISK', points1Task4a.Location, points2Task4a.Location, img1Task4a1, img2Task4a2, task4);

