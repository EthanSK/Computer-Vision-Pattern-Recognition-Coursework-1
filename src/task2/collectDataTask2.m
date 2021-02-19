
img1Task2 = "images/FD/1_obj.JPG";
img2Task2 = "images/FD/8_obj.JPG";
task2 = "task2";

[autoMatchedPoints1KAZE, autoMatchedPoints2KAZE] = autoCorrespPoints(img1Task2, img2Task2, "KAZE");
[autoMatchedPoints1SURF, autoMatchedPoints2SURF] = autoCorrespPoints(img1Task2, img2Task2, "SURF");
[autoMatchedPoints1BRISK, autoMatchedPoints2BRISK] = autoCorrespPoints(img1Task2, img2Task2, "BRISK");

evaluateMatchedPoints('KAZE', autoMatchedPoints1KAZE.Location, autoMatchedPoints2KAZE.Location, img1Task2, img2Task2, task2)
evaluateMatchedPoints('SURF', autoMatchedPoints1SURF.Location, autoMatchedPoints2SURF.Location, img1Task2, img2Task2, task2)
evaluateMatchedPoints('BRISK', autoMatchedPoints1BRISK.Location, autoMatchedPoints2BRISK.Location, img1Task2, img2Task2, task2)
evaluateMatchedPoints('Manual', hotDick, hotPussy, img1Task2, img2Task2, task2)

disp("Saving workspace")
save("src/task2/matchedPoints.mat")