function F = LDP_3rd(I)

    [h,w] = size(I);

    h1 = [0 0 0; 0 1 -1; 0 0 0];
    h2 = [0 0 -1; 0 1 0; 0 0 0];
    h3 = [0 -1 0; 0 1 0; 0 0 0];
    h4 = [-1 0 0; 0 1 0; 0 0 0];
    
    F_2nd = LDP_2nd(I);
    F = [imfilter(F_2nd(:,1:w), h1), imfilter(F_2nd(:,w+1:2*w), h2), imfilter(F_2nd(:,2*w+1:3*w), h3), imfilter(F_2nd(:, 3*w+1:4*w), h4)];
end
