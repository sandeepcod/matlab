clc;clear all;close all

[x,y] = uigetfile('*.jpg*','select the grayscale image'); % here x=filename;y=pathname
filewithpath=strcat(y,x);
img_temp =imread(filewithpath);
original_image=img_temp;
img=original_image;

%checking for colored image
imgr = rgb2gray(original_image);
figure
imshow(img)
title('original image')

imwrite(img,'org.jpg')

data= size(img,2);
samples_divide_eighth =(data /8);

coloumn_8 = [];

for colour=1:3 %color layer
  for i=1:size(img,1)
    rowwise = dct(double(img(i,:,colour)));
    coloumn_8(i,:,colour)= idct(rowwise(1:samples_divide_eighth),data);
  endfor
endfor 
dat_2 =size(img,1);
samplesEighth=floor(dat_2/8);
coloumn_8f=[];

for k=1:3 %all color layer
  for i=1:size(img,2) %all coloumn
    DCT_8 = dct(double(coloumn_8(:,i,k)));
    coloumn_8f(:,i,k)= idct(DCT_8(1:samplesEighth),dat_2);
  endfor
endfor

dct_1 =(uint8(coloumn_8));

%dct_1=rgb2gray(dct_1);
figure
imshow(dct_1)
title('COMPRESSED IMAGE');

imwrite(dct_1,'OUT.jpg')
