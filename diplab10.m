clc;
clear all;
close all;
%Red green blue component
image = imread('lionp.png');
red = image;
red(:,:,2) = 0;
red(:,:,3) = 0;
green = image;
green(:,:,1) = 0;
green(:,:,3) = 0;
blue = image;
blue(:,:,1) = 0;
blue(:,:,2) = 0;

imshow(image)
figure(1)
imshow(red)
figure(2)
imshow(green)
figure(3)
imshow(blue)
