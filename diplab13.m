clc; clear all; close all;
%zig zag dct_coeff.
%% Initialising the variables
image = rgb2gray(imread('Lenna.jpg'));
vmax = size(image, 1);
hmax = size(image, 2);
vmin = 1;
hmin = 1;
v = vmin;
h = hmin;
output = zeros(1, vmax*hmax);

%% Algorithm for zig zag pattern
i = 1;
while ((v <= vmax) && (h <= hmax))
    
    if (mod(h + v, 2) == 0)                 % going up
        if (v == vmin)       
            output(i) = image(v, h);        % if we got to the first line
            if (h == hmax)
                v = v + 1;
            else
              h = h + 1;
            end
            i = i + 1;
        elseif ((h == hmax) && (v < vmax))   % if we got to the last column
            output(i) = image(v, h);
            v = v + 1;
            i = i + 1;
        elseif ((v > vmin) && (h < hmax))    % all other cases
            output(i) = image(v, h);
            v = v - 1;
            h = h + 1;
            i = i + 1;
        end
        
    else                                    % going down
       if ((v == vmax) && (h <= hmax))       % if we got to the last line
            output(i) = image(v, h);
            h = h + 1;
            i = i + 1;
        
       elseif (h == hmin)                   % if we got to the first column
            output(i) = image(v, h);
            if (v == vmax)
	      h = h + 1;
	    else
              v = v + 1;
            end
            i = i + 1;
       elseif ((v < vmax) && (h > hmin))     % all other cases
            output(i) = image(v, h);
            v = v + 1;
            h = h - 1;
            i = i + 1;
       end
    end
    if ((v == vmax) && (h == hmax))          % bottom right element
        output(i) = image(v, h);
        break
    end
end