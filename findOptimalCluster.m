function optimalCluster = findOptimalCluster(originalImage, maxClusters, maxIter)
    % Convertir la imagen a una matriz 2D y normalizar
    im2 = double(originalImage(:)) / 255;

    % Obtener el número de píxeles
    pixelNo = numel(im2);

    distortions = zeros(1, maxClusters);

    for k = 1:maxClusters
        randIndices = randperm(pixelNo, k);
        centers = im2(randIndices);

        for iter = 1:maxIter
            D = pdist2(centers, im2);
            [~, min_indices] = min(D);

            for j = 1:k
                centers(j) = mean(im2(min_indices == j));
            end
        end

        distortions(k) = sum(min(D).^2) / pixelNo;
    end

    % Plot the elbow curve
    figure;
    plot(1:maxClusters, distortions, 'o-');
    title('Método del Codo para encontrar el número óptimo de clústers');
    xlabel('Número de clústers');
    ylabel('Distorsión');

    % 
    disp(distortions);
    [~, optimalCluster] = knee_pt_alternative(distortions(2:end));

    fprintf('El número óptimo de clústers es: %d\n', optimalCluster);
    optimalCluster = round(optimalCluster * 1000); % Multiplicar y dividir por 1000 para mostrar 3 decimales
    disp(optimalCluster);
end

% Encuentra el codo de los resultados con la primera derivada
function [x, y] = knee_pt_alternative(x_vals)

    dx = x_vals(2:end) - x_vals(1:end-1);
    dy = diff(dx);

    % Punto con la mayor pendiente
    [~, idx] = max(dy); 

    x = idx + 1;  % Ajustar el índice para obtener el valor correcto en x_vals
    y = x_vals(x);
end
