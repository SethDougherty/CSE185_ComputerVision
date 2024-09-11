function output = median_filter(img, patch_size) 
    % YOUR CODE HERE
    I2 = zeros(size(img));
    if patch_size(1)==3
        shift_u = 1;
        shift_v = 1;
    elseif patch_size(1)==5
        shift_u = 2;
        shift_v = 2;
    end
    for u=1+shift_u:size(img,1)-shift_u
        for v=1+shift_v:size(img,2)-shift_v
            x1 = v-shift_v; 
            x2 = v+shift_v;
            y1 = u-shift_u; 
            y2 = u+shift_u;
            patch = img(y1:y2, x1:x2);
            value = median(median(patch));
            % value = median(patch(:));
            I2(u,v) = value;
        end
    end
    output = I2;
end