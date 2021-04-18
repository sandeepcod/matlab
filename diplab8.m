clc;clear;close all;
%Histogram streching
Bmin = 20;
Bmax = 255;

A = imread(’lionp.PNG’);
A_gray = rgb2gray(A);

[row col] = size(A_gray); % Size of gray image
len = row * col; % Total number of pixels
A_vec = A_gray(:); % Vectorinzing the matrix
A_sort = sort(A_vec); % Sorting the values in ascending values

A_unq = unique(A_sort); % Finding unique values
Amin = min(A_unq);
Amax = max(A_unq);

% Slope
Slope = (Bmax-Bmin)./(Amax-Amin);
B_new = Slope.*(A_unq-Amin)+Bmin;

% Stretching
A_stretched = zeros(row,col);
for jj = 1:length(A_unq)
A_stretched(A_gray == A_unq(jj)) = B_new(jj);
end
A_stretched = uint8(A_stretched);

figure;
subplot(2,2,1)
imshow(A_gray)
title(’Original’)
subplot(2,2,2)
imshow(A_stretched)
title(’After Stretching’)
subplot(2,2,3)
histogram(A_gray)
title(’Histogram for Original Image’)
subplot(2,2,4)
histogram(A_stretched)
title(’Histogram after Stretching’)