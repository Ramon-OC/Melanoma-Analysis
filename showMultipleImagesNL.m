function showMultipleImagesNL(figure_title, images)
    m = length(images);
    figure;
    for i = 1:m
        subplot(1, m, i);
        imshow(images{i},[]);
    end
    sgtitle(figure_title); 
end