load('att_face.mat');

k = 50; % number of eigenfaces

h = size(face_training, 1);
w = size(face_training, 2);
n_train = size(face_training, 3);
n_test = size(face_testing, 3);

fprintf('Compute eigenface...\n');
%% reshape face_training from h x w x num_train to (h*w) x num_train
X = reshape(face_training, [(h*w), n_train]);

%% compute mean face
x_bar = mean(X,2);

%% substract mean from X
Y = X - x_bar;

%% compute covariance matrix C
C = Y * Y.';

%% singular value decomposition
[U, S, D] = svd(C);

%% select the first k column from U
U = U(:,1:k);

%% encode face image as coefficients of eigenface
fprintf('Face reconstruction...\n');
x = face_training(:, :, 1);
figure(1), 
subplot(1, 2, 1); imshow(imresize(x, 4)); title('input');

% TODO: compute coef
x = x(:);
%x = x - x_bar;
coef = dot(repmat((x - x_bar),1,k),U);


%% reconstruct face image from coefficients
x_rec =  x_bar + sum(coef .* U,2);

x_rec = reshape(x_rec, h, w);
subplot(1, 2, 2); imshow(imresize(x_rec, 4)); title('reconstruction');
imwrite(imresize(x_rec, 4), sprintf('reconstruct_k%d.png', k));


%% encode all training data
fprintf('Convert training data to coef...\n');
coef_train = zeros(k, n_train);
% TODO: compute coef_train for all training images
for i = 1:n_train
    img_train = face_training(:, :, i);
    coef_train(:,i) = (dot(repmat(img_train(:),1,k),U)).';
end


%% Face recognition with eigenface coefficients
fprintf('Testing...\n');
id_predict = zeros(size(id_testing));

for i = 1:n_test
    
    %% extract testing image
    img_test = face_testing(:, :, i);
    
    %% convert testing image to feature vector
    coef_test = (dot(repmat(img_test(:),1,k),U)).'; % TODO: replace this line
    
    error = zeros(n_train, 1);
    for j = 1:n_train
        
        %% compute the square error between feature vectors
        diff = coef_train(:, j) - coef_test;
        error(j) = sum( diff .^2 );
        
    end
    
    %% find the image id with minimal error
    [~, min_id] = min(error);
    id_predict(i) = min_id;
    
end

%% compute accuracy
accuracy = sum(id_testing == id_predict)/n_test;
fprintf('Accuracy = %f\n', accuracy);

%---------------------------------------%
%---------- Fill in this table ---------%
%---------------------------------------%
%   k   |  Accuracy
%---------------------------------------%
%  10   |  0.675000
%---------------------------------------%
%  20   |  0.687500
%---------------------------------------%
%  30   |  0.718750
%---------------------------------------%
%  40   |  0.737500
%---------------------------------------%
%  50   |  0.737500
%---------------------------------------%

