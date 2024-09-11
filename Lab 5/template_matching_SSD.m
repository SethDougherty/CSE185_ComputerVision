function [output, match] = template_matching_SSD(img, template, threshold) 
output = zeros(size(img));
shift = floor(size(template,1)/2);

for u=1+shift:size(img,1)-shift
    for v=1+shift:size(img,2)-shift
        x1 = v-shift;
        x2 = v+shift;
        y1 = u-shift; 
        y2 = u+shift;
        % disp(x2)
        patch = img(y1:y2, x1:x2);
        % disp(size(patch))
        % disp(size(template, 1))

        diff = patch - template;
        value = sum(diff(:).^2);
        output(u,v) = value;
    end
end


match = (output < threshold);