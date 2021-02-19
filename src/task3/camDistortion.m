function [] = camDistortion(cameraParams, name)
A = [100:100:6000];
B = [100:100:4000];
[m,n] = ndgrid(A, B);

points = [m(:),n(:)];
uPoints = undistortPoints(points, cameraParams);
dir = uPoints - points;

X = points(:,1);
Y = points(:,2);
U = dir(:,1);
V = dir(:,2);

% imshow(imread('../Images/DSC_0047.JPG'))
% hold on;

quiver(X,Y,U,V);
axis equal;
saveas(gcf,sprintf('report/task3/distortion/quiver-%s.png', name));
end