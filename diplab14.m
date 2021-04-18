clc; clear;close all;
%run length encoding
%Get input vector
vector = randi([0 1],1,100);
stm = sprintf('%d', vector);
fprintf("Original Input String: %s\n",stm);
d = my_RLE(vector);
fprintf('Run length encoded output:\n');
d'
len_output = length(d);
len_input = length(vector);
%Check for compression ratio
if (len_output / len_input) <1
    fprintf('Positive Compression with ratio = %.2d\n', len_output / len_input)
else
    fprintf('Negative compression.')
end