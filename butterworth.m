function smothImage = butterworth(image, order, cf)
    [m, n] = size(image);
    cx = round(m/2);
    cy = round(n/2);
    [x, y] = meshgrid(1:n, 1:m);
    d = (x - cx).^2 + (y - cy).^2;
    imf = fftshift(fft2(image));
    lowPassFilter = 1 ./ (1 + ((d / cf / cf).^(2 * order)));
    convLP = imf.*lowPassFilter;
    smothImage = abs(ifft2(convLP));
end