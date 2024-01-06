function showMultipleImages(figure_title, images, image_labels)
    m = length(images);
    figure;
    for i = 1:m
        subplot(1, m, i);
        imshow(images{i},[]);
        title(image_labels(i));
    end
    sgtitle(figure_title); 
end