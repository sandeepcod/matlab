clc;clear;close all;
#we first formed the image with a pixel value given below
a=[52	55	61	59	79	61	76	61;
62	59	55	104	94	85	59	71;
63	65	66	113	144	104	63	72;
64	70	70	126	154	109	71	69;
67	73	68	106	122	88	68	68;
68	79	60	70	77	66	58	75;
69	85	64	58	55	61	65	83;
70	87	69	68	65	73	78	90];
b=size(a);
a=double(a);
% Loop for Getting the Histogram of the image
hist1 = zeros(1,256);
for i=1:b(1)
    for j=1:b(2)
        for k=0:255
            if a(i,j)==k
                hist1(k+1)=hist1(k+1)+1;
            end
        end
    end
end

%Generating PDF out of histogram by diving by total no. of pixels
pdf=(1/(b(1)*b(2)))*hist1;

%Generating CDF out of PDF
cdf = zeros(1,256);
cdf(1)=pdf(1);
for i=2:256
    
    cdf(i)=cdf(i-1)+pdf(i);
end
cdf = round(255*cdf);

ep = zeros(b);
for i=1:b(1)                                        %loop tracing the rows of image
    for j=1:b(2)                                    %loop tracing thes columns of image
        t=(a(i,j)+1);                               %pixel values in image
        ep(i,j)=cdf(t);                             %Making the ouput image using cdf as the transformation function
    end                                             
end

% Loop for Getting the Histogram of the image
hist2 = zeros(1,256);
for i=1:b(1)
    for j=1:b(2)
        for k=0:255
            if ep(i,j)==k
                hist2(k+1)=hist2(k+1)+1;
            end
        end
    end
end

subplot(2,2,1);
imshow(uint8(a));
subplot(2,2,3);
imshow(uint8(ep));
subplot(2,2,2);
stem(hist1);
subplot(2,2,4);
stem(hist2);




