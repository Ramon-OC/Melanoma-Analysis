function newImageIntensity = modifyIntensity(originalImage,newIntensity)
    [h1, w1, ~] = size(originalImage);
    newImageIntensity = zeros(h1,w1,'uint8');
    newIntesity = 255/(newIntensity-1);
    for i = 1:length(originalImage)
        for j = 1:length(originalImage)
            newValue = floor(originalImage(i, j)/newIntesity) * newIntesity;
            newImageIntensity(i, j) = newValue;
        end
    end
end