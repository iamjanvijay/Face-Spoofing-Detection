function hist = LDP_3rd_hist(I)

    [h, w] = size(I);    
    
    hist = zeros(1, 1024); 
    
    F = LDP_2nd(I);
    
    bin_pattern = [1 2 4; 128 0 8; 64 32 16];
    
    for k = 1:4 
        for i = 2:h-1 
            for j = 2:w-1 
                blk_j = (k-1)*w + j;
                              
                pattern = (F(i-1:i+1, (blk_j-1):(blk_j+1)) * F(i, blk_j)) <= 0;           
                
                pattern = sum(sum(pattern .* bin_pattern));

                index = (k-1)*256 + pattern + 1;
                hist(index) = hist(index) + 1;
            end
        end
    end
    
end


