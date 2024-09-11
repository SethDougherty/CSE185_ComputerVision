function output = sobel_filter(img, kernel) 
    % YOUR CODE HERE
    I2 = zeros(size(img));
    shift_u = 1;
    shift_v = 1;
    for u=1+shift_u:size(img,1)-shift_u
        for v=1+shift_v:size(img,2)-shift_v
            x1 = v-1; 
            x2 = v+1;
            y1 = u-1; 
            y2 = u+1;
            patch = img(y1:y2, x1:x2);
            I2(u,v) = sum(dot(patch,kernel),"all");
        end
    end
    output = I2;
end