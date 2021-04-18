clc; close all; clear all;
%contrast enhancement
%% Image input and and Grad operator
Grad = [12 14 23 13; 14 11 21 18; 21 24 23 13; 12 21 20 10];
image = [4 4 3 2; 3 7 6 1; 2 7 6 2; 0 1 0 2];
New_M = zeros(4,4);

%% Algorithm
for i = 1:4
    for j = 1:4
        min_value = Grad(i,j);  
        x = i;
        y = j;
        if(i+1 <= 4 && Grad(i+1,j) < min_value)
            min_value = Grad(i+1,j);
            x = i+1;
            y = j;
        end
        if(i-1 >= 1 && Grad(i-1,j) < min_value)
            min_value = Grad(i-1,j);
            x = i-1;
            y = j;
        end
        if(j-1 >= 1 && Grad(i,j-1) < min_value)
            min_value = Grad(i,j-1);
            y = j - 1;
            x = i;
        end
        if(j+1 <= 4 && Grad(i,j+1) < min_value)
            min_value = Grad(i,j+1);
            y = j + 1;
            x = i;
        end
        if(j+1 <= 4 && i+1 <= 4 && Grad(i+1,j+1) < min_value)
            min_value = Grad(i+1,j+1);
            y = j+1;
            x = i+1;
        end
        if(j-1>= 1 && i+1 <= 4 && Grad(i+1,j-1) <min_value)
            min_value = Grad(i+1,j-1);
            y = j-1;
            x = i+1;
        end
        if(j + 1 <= 4 && i - 1 >= 1 && Grad(i-1,j+1) < min_value)
            min_value = Grad(i-1,j+1);
            y = j + 1;
            x = i - 1;
        end

        New_M(i,j) = image(x,y);
    end
end
