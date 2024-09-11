img = im2double(imread("lena.jpg"));
img1 = im2double(imread("marilyn.jpg"));
img2 = im2double(imread("einstein.jpg"));

% Task 1
ratio = 0.1;
[low_pass_img, high_pass_img] = separate_frequency(img, ratio);

imwrite(low_pass_img, 'lena_low_0.1.jpg');
imwrite(high_pass_img + 0.5, 'lena_high_0.1.jpg');

% Task 2
ratio = 0.2;
[low_pass_img, high_pass_img] = separate_frequency(img, ratio);

imwrite(low_pass_img, 'lena_low_0.2.jpg');
imwrite(high_pass_img + 0.5, 'lena_high_0.2.jpg');

% Task 3
ratio = 0.15;
img_merged = hybrid_image(img1, img2, ratio);
imwrite(img_merged, 'hybrid_1.jpg')

% Task 4
ratio = 0.15;
img_merged = hybrid_image(img2, img1, ratio);
imwrite(img_merged, 'hybrid_2.jpg')