function [] = depthMap(I1, I2, task, scale)

name = sprintf("%s%%", num2str(100 * scale));
fprintf("Computing depth map %s\n", name);

range = [-64, 64];
I1G = rgb2gray(imresize(I1, scale, 'bilinear'));
I2G = rgb2gray(imresize(I2, scale, 'bilinear'));
    
disparityMap = disparitySGM(I1G, I2G, 'DisparityRange', range);

close(gcf);
imshow(disparityMap, range);
title('Disparity Map');
colormap jet
colorbar
saveas(gcf,sprintf('report/%s/depth/map-%s.png', task, name));

end
