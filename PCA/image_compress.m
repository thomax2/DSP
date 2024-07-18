clear;
clc;

% 假设图像文件名为 'image.jpg'，并且它位于当前工作目录中
colorImage = imread('pic2.png');
% 
grayImage = rgb2gray(colorImage);
% 
% % 显示灰度图像
% % imshow(grayImage);
grayImage=double(grayImage);

% [T,Va]=eig(grayImage*grayImage');

[U,S,V]=SVD(grayImage);
[U1,S1,V1]=svd(grayImage);
U11=U-U1;
V11=V-V1;
S11=S-S1;
%  imshow(U*S*V');