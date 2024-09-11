img = im2double(imread("lena.jpg"));

% Task 1
H = [1, 2, 1; 0, 0, 0; -1, -2, -1];
img_sobel = sobel_filter(img, H);
figure, imshow(img_sobel);
imwrite(img_sobel, 'sobel_h.jpg');

% Task 2
V = [1, 0, -1; 2, 0, -2; 1, 0, -1];
img_sobel = sobel_filter(img, V);
figure, imshow(img_sobel);
imwrite(img_sobel, 'sobel_v.jpg');

% Task 3
hsize = 5; sigma = 2;
img_gaussian = gaussian_filter(img, hsize, sigma);
figure, imshow(img_gaussian);
imwrite(img_gaussian, 'gaussian_5.jpg');

% Task 4
hsize = 9; sigma = 4;
img_gaussian = gaussian_filter(img, hsize, sigma);
figure, imshow(img_gaussian);
imwrite(img_gaussian, 'gaussian_9.jpg');