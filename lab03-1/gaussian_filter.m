function output = gaussian_filter(img, hsize, sigma) 
    H = fspecial('gaussian', hsize, sigma);
    % YOUR CODE HERE
    if hsize(1)==5
        shift_u = floor(hsize(1) / 2);
        shift_v = floor(hsize(1) / 2);
    elseif hsize(1)==9
        shift_u = floor(hsize(1) / 2);
        shift_v = floor(hsize(1) / 2);
    end
    I2 = img;
    for u=1+shift_u:size(img,1)-shift_u
        for v=1+shift_v:size(img,2)-shift_v
            x1 = v-shift_v; 
            x2 = v+shift_v;
            y1 = u-shift_u; 
            y2 = u+shift_u;
            patch = img(y1:y2, x1:x2);
            I2(u,v) = sum(dot(patch,H),"all");
        end
    end
    output = I2;
end