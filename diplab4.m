clc;clear;close all;
#we first read the image whose operation is to performed 
a=imread('lionp.PNG');
figure
subplot(2,4,1);
image(a);
title('orignal image');

#we perform a addition operation;
A = a+60;
subplot(2,4,2);
image(A);
title('addition');
#we perform a subtraction operation;
B = a-100;
subplot(2,4,3);
image(B);
title('subtraction');


#we perform a multiply operation;
C = a.*2;
subplot(2,4,4);
image(C);
title('multiply');

#we perform a divide operation;
D = a./2;
subplot(2,4,5);
image(D);
title('divide');

# load another image whose operation is to be performed


I = imread('crying.jpg');
subplot(2,4,6);
image(I);
title('second image');
#resizing the image
[r,c,z]=size(I);
I1 = imresize(D,[r c]);
subplot(2,4,7);
image(I1);
title('resized image');

#perform a addition operation;
figure
Ir = I+I1;
subplot(2,4,1);
image(Ir);
#perform a subtraction operation;
Im =I1-I;
subplot(2,4,2);
image(Im);

#perform a multiply operation;
It = I.*I1;
subplot(2,4,3);
image(It);

#perform a divide operation;
Id = I.*I1;
subplot(2,4,4);
image(Id);zd