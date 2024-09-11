name = 'einstein1'; 
name2 = 'einstein2';

img = im2double(imread(sprintf('%s.jpg', name)));
img2 = im2double(imread(sprintf('%s.jpg', name2)));
template = im2double(imread('template.jpg'));

threshold = 25;
[output, match] = template_matching_SSD(img, template, threshold);

figure, imshow(output ./ max(output(:))); title('SSD output');
figure, imshow(match); title('SSD match');

imwrite(output ./ max(output(:)), sprintf('%s_ssd_output.jpg', name)); 
imwrite(match, sprintf('%s_ssd_match.jpg', name));



threshold = 30;
[output, match] = template_matching_SSD(img2, template, threshold);

figure, imshow(output ./ max(output(:))); title('SSD output');
figure, imshow(match); title('SSD match');

imwrite(output ./ max(output(:)), sprintf('%s_ssd_output.jpg', name2)); 
imwrite(match, sprintf('%s_ssd_match.jpg', name2));




threshold = 0.5;
[output, match] = template_matching_normcorr(img, template, threshold);
figure, imshow(output ./ max(output(:))); title('NormCorr output');
figure, imshow(match); title('NormCorr match');
imwrite(output ./ max(output(:)), sprintf('%s_normcorr_output.jpg', name));
imwrite(match, sprintf('%s_normcorr_match.jpg', name) );


threshold = 0.5;
[output, match] = template_matching_normcorr(img2, template, threshold);
figure, imshow(output ./ max(output(:))); title('NormCorr output');
figure, imshow(match); title('NormCorr match');
imwrite(output ./ max(output(:)), sprintf('%s_normcorr_output.jpg', name2));
imwrite(match, sprintf('%s_normcorr_match.jpg', name2) );