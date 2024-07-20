clear;
clc;

% % 假设图像文件名为 'image.jpg'，并且它位于当前工作目录中
% colorImage = imread('pic2.png');
%  
% grayImage = rgb2gray(colorImage);
%  
% % % imshow(grayImage);
% grayImage=double(grayImage);


A = [1,2,3,4,5;6,7,8,9,10;11,12,13,14,14];

Y = PCA(A,2);

[coeff,score,latent,tsquared,explained,mu] = pca(A);
