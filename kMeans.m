function segmentedImage = kMeans(originalImage, clusterNo, maxIter)
    % Creamos una matriz de tres columnas para cada color, el número de
    % filas será el total de elementos en originalImage.
    im2 = reshape(originalImage,[size(originalImage,1)*size(originalImage,2) 3]);
     
    [pixelNo,~] = size(im2);

    % De forma aleatoria, se seleccionan ''clusterNo'' índices de la matriz.
    randIndices = randperm(pixelNo,clusterNo);

    centers = double(im2(randIndices,:));
    
    for iter=1:maxIter
        % Calcula la distancia euclidiana entre los centros y cada píxel
        D = pdist2(centers,double(im2));
        % Asignar cada píxel al cluster con la distancia mínima
        [~,min_indices] = min(D); 
     
        for j=1:clusterNo
            centers(j,:) = mean(im2(min_indices == j,:));
        end
    end
    
    cmap = min_indices';
    cmap2 = reshape(cmap, [size(originalImage,1) size(originalImage,2)]);
    
    colors = centers / 255;
    segmentedImage = zeros(size(originalImage,1), size(originalImage,2), 3, 'double');

    for fila = 1:size(originalImage,1)
        for columna = 1:size(originalImage,2)
            segmentedImage(fila,columna, 1) = colors(cmap2(fila,columna),1);
            segmentedImage(fila,columna, 2) = colors(cmap2(fila,columna),2);
            segmentedImage(fila,columna, 3) = colors(cmap2(fila,columna),3);
        end
    end
end