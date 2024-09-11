function [corner_x, corner_y] = Harris_corner_detector...
                                    (I, sigma1, sigma2, alpha, R_threshold)
   

	%% Gaussian kernels
    hsize1 = 1 + 2 * ceil(sigma1 * 2);
    hsize2 = 1 + 2 * ceil(sigma2 * 2);

    gaussian_kernel1 = fspecial('gaussian', hsize1, sigma1);
    gaussian_kernel2 = fspecial('gaussian', hsize2, sigma2);

    
    %% derivative filter
    Dx = [1, 0, -1];
    Dy = [1; 0; -1];

    
    %% Use derivative of Gaussian to compute x-gradient (Ix) and y-gradient (Iy)
    Ix = imfilter(imfilter(I, gaussian_kernel1), Dx);
    Iy = imfilter(imfilter(I, gaussian_kernel1), Dy);

    figure, imshow(Ix + 0.5);
    figure, imshow(Iy + 0.5);



    %% compute Ixx, Iyy, Ixy
    Ixx = Ix .* Ix;
    Iyy = Iy .* Iy;
    Ixy = Ix .* Iy;

    
    
    %% compute Sxx, Syy, Sxy
    Sxx = imfilter(Ixx, gaussian_kernel2);
    Syy = imfilter(Iyy, gaussian_kernel2);
    Sxy = imfilter(Ixy, gaussian_kernel2);


    
    
    %% compute corner response from determine and trace
    det = Sxx .* Syy - Sxy .* Sxy;
    trace = Sxx + Syy;
    R = det - alpha * (trace).^2;

    figure, imagesc(R); colormap jet; colorbar; axis image;

    
    
    %% find corner map with R > R_threshold
        corner_map = (R > R_threshold);
    
    %figure, imshow(corner_map);
    
    
    %% find local maxima of R
    local_maxima = imregionalmax(R);
    %local_maxima = zeros(size(R));
    %for u=1:size(R,1)
        %for v=1:size(R,2)
            %if u-1 < 0 || u+1 > size(R,1) || v-1 < 0 || v+1 > size(R,3)
           %     local_maxima(u,v) = 0;
          %  elseif R(u,v) > R(u-1,v-1) && R(u,v) > R(u-1,v) && R(u,v) > R(u-1,v+1) && R(u,v) > R(u,v-1) && R(u,v) > R(u,v+1) && R(u,v) > R(u+1,v-1) && R(u,v) > R(u+1,v) && R(u,v) > R(u+1,v+1)
         %       local_maxima(u,v) = 1;
        %    else
       %         local_maxima(u,v) = 0;
      %      end
     %   end
    %end
    
    %figure, imshow(local_maxima)

    
    
    %% final corner map and corner x, y coordinates
    disp(size(local_maxima))
    disp(size(corner_map))
    final_corner_map = corner_map & local_maxima;

    %figure, imshow(final_corner_map)
    
    [corner_y, corner_x] = find(final_corner_map);

end

