clc; clear all; close all;
%edge detection
%% Import the Image

A = imread('Lenna.jpg');
A = imresize(A, 0.5);
A = rgb2gray(A);
figure(1); 
imshow(A);

%% Edges using DWT2

[cA, cH, cV, cD] = dwt2(A,'haar');

figure(2);
subplot(221); imshow(uint8(cA)); 
subplot(222); imshow(uint8(cH)); 
subplot(223); imshow(uint8(cV)); 
subplot(224); imshow(uint8(cD)); 

%% Edges using Canny

Canny = edge(A,'canny');
figure(3);
imshow(Canny); 
title("Edges using Canny");

%% Edges using Sobel

Sobel = edge(A,'sobel');
figure(4);
imshow(Sobel); 
title("Edges using Sobel");