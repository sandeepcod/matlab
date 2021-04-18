clc;clear;close all;

%designing filter

%% Import the Image

image = imread('Lenna.jpg');
image = imresize(image, 0.5);
image = rgb2gray(image);
figure(1); 
imshow(image);

%% Filter Designing

hpf = [-1,-1,-1;-1,8,-1;-1,-1,-1];
%This is a simple Laplacian Mask (Ref : Sridhar, Chapter : Image Enhancement)

lpf = [1,1,1;1,1,1;1,1,1] .* (1/9);
%This is a averaging filter mask (Ref : Sridhar, Chapter : Image Enhancement)

%% Applying the Filters

I_hpf = conv2(image,hpf);
I_lpf = conv2(image,lpf);
figure(2);
subplot(121); imshow(uint8(I_hpf));
subplot(122); imshow(uint8(I_lpf));