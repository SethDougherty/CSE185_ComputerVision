function [low_pass_img, high_pass_img] = separate_frequency(img, ratio)
    % apply FFT
    frequency_map = fft2(img);
    frequency_map_shifted = fftshift(frequency_map);
    x1 = floor(size(img, 2)/2) - floor((size(img, 2)*ratio)/2); 
    x2 = floor(size(img, 2)/2) + floor((size(img, 2)*ratio)/2);
    y1 = floor(size(img, 1)/2) - floor((size(img, 1)*ratio)/2);
    y2 = floor(size(img, 1)/2) + floor((size(img, 1)*ratio)/2);
    mask = zeros(size(img));
    mask(y1:y2, x1:x2, :) = 1;
    low_frequency_map_shifted = frequency_map_shifted .* mask;
    high_frequency_map_shifted = frequency_map_shifted .* (1 - mask);
    low_frequency_map = ifftshift(low_frequency_map_shifted);
    high_frequency_map = ifftshift(high_frequency_map_shifted);
    low_pass_img = real(ifft2(low_frequency_map));
    high_pass_img = real(ifft2(high_frequency_map));
end