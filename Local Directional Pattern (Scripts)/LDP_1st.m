function F = LDP_1st(I) 
    [h, w] = size(I);

    h1 = [0 0 0; 0 1 -1; 0 0 0];
    h2 = [0 0 -1; 0 1 0; 0 0 0];
    h3 = [0 -1 0; 0 1 0; 0 0 0];
    h4 = [-1 0 0; 0 1 0; 0 0 0];
    F = [imfilter(I,h1), imfilter(I, h2), imfilter(I,h3), imfilter(I, h4)];
end