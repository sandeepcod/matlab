#bit plane slicing

clc;clear;close all;
#we first read the image whose operation is to performed 
a=imread('lionp.PNG');
#image(a);

#[X,cmap]=imread('lionp.PNG')
#imshow(X,cmap);
#conversion of rgb image to gray
I =rgb2gray(a);
[m,n]=size(I);
b=double(I);
c=de2bi(b);
c1=c(:,1);
r1=reshape(c1,m,n);

c2=c(:,2);
r2=reshape(c2,m,n);

c3=c(:,3);
r3=reshape(c3,m,n);

c4=c(:,4);
r4=reshape(c4,m,n);

c5=c(:,5);
r5=reshape(c5,m,n);

c6=c(:,6);
r6=reshape(c6,m,n);

c7=c(:,7);
r7=reshape(c7,m,n);

c8=c(:,8);
r8=reshape(c8,m,n);

subplot(2,4,1);
imshow(r1);
title('1st bit plane');

subplot(2,4,2);
imshow(r2);
title('2nd bit plane');

subplot(2,4,3);
imshow(r3);
title('3rd bit plane');

subplot(2,4,4);
imshow(r4);
title('4th bit plane');

subplot(2,4,5);
imshow(r5);
title('5th bit plane');

subplot(2,4,6);
imshow(r6);
title('6th bit plane');

subplot(2,4,7);
imshow(r7);
title('7th bit plane');

subplot(2,4,8);
imshow(r8);
title('8th bit plane');