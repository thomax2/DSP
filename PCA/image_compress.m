clear;
clc;

% 假设图像文件名为 'image.jpg'，并且它位于当前工作目录中
colorImage = imread('pic2.png');
 
grayImage = rgb2gray(colorImage);
 
% % imshow(grayImage);
grayImage=double(grayImage);