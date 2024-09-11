img = im2double(imread("lena.jpg"));

sigma = 2.0;
hsize = 7;
scale = 5;

I = img;
for s = 1 : scale

    % Gaussian
    H = fspecial('gaussian', hsize, sigma);
    img_gau = imfilter(I, H);
    imwrite(img_gau, sprintf('Gaussian_scale%d.jpg', s));

    I = imresize(img_gau, 0.5);
end

I2 = img;
for s = 1 : scale

    % Gaussian
    H = fspecial('gaussian', hsize, sigma);
    img_gau = imfilter(I2, H);

    % Laplacian
    I2 = I2 - img_gau;

    imwrite(I2 + 0.5, sprintf('Laplacian_scale%d.jpg', s));

    I2 = imresize(img_gau, 0.5);
end