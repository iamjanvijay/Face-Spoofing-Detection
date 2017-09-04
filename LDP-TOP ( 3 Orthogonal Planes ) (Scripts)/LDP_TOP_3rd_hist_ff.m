	
function hist = LDP_TOP_3rd_hist_ff(V, width, height, nframe, Rt, faceloc, from_frame)
    xc = floor(height / 2);
    yc = floor(width / 2);
    
    if nframe == 1
        tc = 1;
    else
        tc = floor(nframe / 2);
    end
    
    XY = zeros(height, width); 
    
    H2 = [];
    H3 = [];
    H1 = [];

    
    for r = 1:length(Rt)%for all Rt 
        
        XT = zeros(height, nframe);
        TY = zeros(nframe, width);
        
        ind = 1;
        
        for t = 1:(nframe*Rt(r) + from_frame - 1)
            if hasFrame(V)
         
                frame = readFrame(V);
                
                if t < from_frame
                    continue;
                end
                
                if Rt(r) ~= 1 && mod(t-1,  Rt(r)) ~= 0
                    continue;
                end
                
                frame = rgb2gray(frame);
                frame = im2double(frame);
                frame = frame(faceloc(1,2):(faceloc(1,2)+faceloc(1,4)), faceloc(1,1):(faceloc(1,1)+faceloc(1,3)));

                % Normalize to [width, height]
                frame = imresize(frame, [height, width]);

                XT(1:height, ind) = frame(1:height, yc);
                TY(ind, 1:width) = frame(xc, 1:width);
             
                if ind == tc
                    XY = frame;
                    H1 = [H1, LDP_3rd_hist(XY)];
                end
                
                ind = ind + 1;
            else
                disp(V.Name);
                disp('The video is too short');
                hist = [];
                return;
            end
        end
        
        if nframe > 1
            H2 = [H2, LDP_3rd_hist(XT)];
            H3 = [H3, LDP_3rd_hist(TY)];
        end
        
        V.CurrentTime = 0; % reset for another value of Rt
    end
    
    hist = [H1, H2, H3];
    
    Mi = max(hist);
    mi = min(hist);
    if Mi-mi ~= 0
        hist = (hist-mi) / (Mi-mi); %scale to [0,1]
    end
      
end

