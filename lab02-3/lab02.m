img1 = imread("01.jpg");
img2 = im2double(imread("lena_noisy.jpg"));

% Task 1
I1 = img1;
I2 = zeros(300,400, 3, 'uint8');
for y1=1:300
    for x1=1:400
        x2 = cosd(45)*(x1-(200))+sind(45)*(y1-(150));
        y2 = -sind(45)*(x1-(200))+cosd(45)*(y1-(150));
        x2=round(x2)+200;
        y2=round(y2)+150;
        if ((x2 > 0) && (x2 <= 400)) && ((y2 > 0) && (y2 <= 300))
            I2(y2,x2,:) = I1(y1,x1,:);
        end
    end
end
imwrite(I2, "rotate_0.jpg")

% Task 2
I1 = img1;
I2 = zeros(300,400, 3, 'uint8');
for y2=1:300
    for x2=1:400
        x1 = cosd(-45)*(x2-(200))+sind(-45)*(y2-(150));
        y1 = -sind(-45)*(x2-(200))+cosd(-45)*(y2-(150));
        x1=round(x1)+200;
        y1=round(y1)+150;
        if ((x1 > 0) && (x1 <= 400)) && ((y1 > 0) && (y1 <= 300))
            I2(y1,x1,:) = I1(y2,x2,:);
        end
    end
end
imwrite(I2, "rotate_1.jpg")

% Task 3
patch_size = [3, 3];
img_median = median_filter(img2, patch_size); 
imwrite(img_median, 'median_0.jpg');

% Task 4
patch_size = [5, 5];
img_median = median_filter(img2, patch_size); 
imwrite(img_median, 'median_1.jpg');
