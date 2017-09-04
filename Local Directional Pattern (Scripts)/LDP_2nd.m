function F = LDP_2nd(I)
    [h,w] = size(I);

    h1 = [0 0 0; 0 1 -1; 0 0 0];
    h2 = [0 0 -1; 0 1 0; 0 0 0];
    h3 = [0 -1 0; 0 1 0; 0 0 0];
    h4 = [-1 0 0; 0 1 0; 0 0 0];
    
    F_1st = LDP_1st(I);
    
    F = [imfilter(F_1st(:,1:w), h1), imfilter(F_1st(:,w+1:2*w), h2), imfilter(F_1st(:,2*w+1:3*w), h3), imfilter(F_1st(:, 3*w+1:4*w), h4)];
end
