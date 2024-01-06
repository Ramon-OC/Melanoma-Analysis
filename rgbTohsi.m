function hsi = rgbTohsi(rgb)
    rgb = double(rgb) / 255;
    
    % Separala imagen en tres canales
    r = rgb(:,:,1);
    g = rgb(:,:,2);
    b = rgb(:,:,3);
    
    num = 0.5 * ((r - g) + (r - b));
    den = sqrt((r - g).^2 + (r - b).*(g - b));
    theta = acos(num ./ (den + eps));

    h = theta;
    h(b > g) = 2*pi - h(b > g); 
    h = h / (2*pi);
 
    % Se calcula el componente de saturación
    s = 1 - 3 * min(rgb, [], 3) ./ sum(rgb, 3);
    
    % Componente de intensidad
    i = (r + g + b) / 3;

    hsi = cat(3, h, s, i);
end