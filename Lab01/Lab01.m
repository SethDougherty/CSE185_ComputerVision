img1 = imread("01.jpg");
img2 = imread("02.jpg");
img3 = imread("03.jpg");
img4 = imread("04.jpg");
img5 = imread("05.jpg");
img6 = imread("06.jpg");

% Task 1
G = img1;
G(:,:,2) = 0;
imwrite(G, "green.jpg")

% Task 2
Y = img1;
R = Y(:, :, 1);
G = Y(:, :, 2);
B = Y(:, :, 3);
Y = zeros(size(Y,1), size(Y,2), 'uint8');
for x=1:size(Y,1)
    for y=1:size(Y,2)
        Y(x,y) = (0.299 * R(x,y)) + (0.587 * G(x,y)) + (0.114 * B(x,y));
    end
end

imwrite(Y, "gray.jpg")

% Task 3
Side = rot90(img1);
imwrite(Side, "rotate.jpg")

% Task 4
C = img1(30:270, 100:300, 1:3);
% C = imcrop(img1, [30, 100, 270, 300])
% for x=1:size(img1,1)
%     for y=1:size(img1,2)
%         if x >= 30 && x <= 270
%             C(x-29,y) = img1(x,y);
%         end
%     end
% end
imwrite(C, "crop.jpg")


% Task 5
Flipped = flip(img1, 2);
imwrite(Flipped, "flip.jpg")

% Task 6
canvas = zeros(300 * 2 + 10, 400 * 2 + 10, 3, 'uint8');
canvas(1:300, 1:400, :) = img1;
canvas(310:609, 1:400, :) = img3;
canvas(1:300, 410:809, :) = img2;
canvas(310:609, 410:809, :) = img4;
imwrite(canvas, "combine.jpg")

% Task 7
I = img5;
I = I(:);
% size(I)
I = reshape(I, 375, 1242, 3);
% size(I)
J = img6;
J = J(:);
% size(J)
J = reshape(J, 375, 1242, 3);
%imshow(J)
%imshow(I)
average = zeros(size(I,1), size(I,2), 3, 'uint8');
for x=1:size(I,1)
    for y=1:size(I,2)
        average(x,y,1) = (I(x,y,1) + J(x,y,1))/2;
        average(x,y,2) = (I(x,y,2) + J(x,y,2))/2;
        average(x,y,3) = (I(x,y,3) + J(x,y,3))/2;
    end
end
imwrite(average, "average.jpg")