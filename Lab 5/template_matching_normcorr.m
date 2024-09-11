function [output, match] = template_matching_normcorr(img, template, threshold) 
output = zeros(size(img));
shift = floor(size(template,1)/2);

for u=1+shift:size(img,1)-shift
    for v=1+shift:size(img,2)-shift
        x1 = v-shift;
        x2 = v+shift;
        y1 = u-shift; 
        y2 = u+shift;
        patch = img(y1:y2, x1:x2);

        patch_vec = patch(:);
        patch_norm = patch_vec - mean(patch_vec);
        patch_norm = patch_norm/norm(patch_norm);
        template_vec = template(:);
        template_norm = template_vec - mean(template_vec);
        template_norm = template_norm/norm(template_norm);
        value = dot(patch_norm, template_norm);
        output(u,v) = value;
    end
end

match = (output > threshold);