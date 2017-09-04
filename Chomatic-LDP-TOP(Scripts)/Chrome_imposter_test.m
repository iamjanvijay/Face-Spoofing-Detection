faceDetector = vision.CascadeObjectDetector;

fileID = fopen('/media/janvijay/587A4D997A4D74B2/Code/imposter_test_face.txt');
C = textscan(fileID,'%s %f %f %f %f %f %f');
fclose(fileID);

fNames = C{1};
cnt = 0;
% img = imread('/media/janvijay/224A23DA4A23AA0D/Documents and Settings/Janvijay/Downloads/Compressed/Detectedface/Detectedface/ClientFace/0001/0001_00_00_01_0.jpg');
% imshow(img);

fileID = fopen('imposter_test_face_features64.txt','w');

for i=1:length(fNames) 
fName = fNames(i);
fPath = strcat('/media/janvijay/224A23DA4A23AA0D/Documents and Settings/Janvijay/Downloads/Compressed/Detectedface/Detectedface/ImposterFace/',strrep(fName,'\','/') );    
% disp(fPath);
% class(fPath{1})

if exist(fPath{1}, 'file') == 0
continue
end

disp('Reading : '); disp( fPath{1} );
img = imread( fPath{1} );

% disp(size(img));
% figure, imshow(img), title('Original Image');

bboxes = step(faceDetector, img);

if bboxes
    disp('Doing !');
else
    continue
end    

% disp(bboxes);

IFaces = insertObjectAnnotation(img, 'rectangle', bboxes, 'Face');
% figure, imshow(IFaces), title('Detected faces');

try
    img = imcrop(img,bboxes); 
    img = imresize(img, [64, 64]);
catch
    continue
end  


% figure, imshow(img), title('Cropped & Resized Image');

% img = rgb2gray(img);
% figure, imshow(img), title('Gray Image');

img = rgb2ycbcr(img);
% figure, imshow(img), title('Image in YCbCr space');

imgY = img(:,:,1);
imgCb = img(:,:,2);
imgCr = img(:,:,3);

% figure, imshow(imgY), title('Image Y-component');
% figure, imshow(imgCb), title('Image Cb-component');
% figure, imshow(imgCr), title('Image Cr-component');

imgY = im2double(imgY);
imgCb = im2double(imgCb);
imgCr = im2double(imgCr);

HistY_3rd = LDP_3rd_hist(imgY); 
HistCb_3rd = LDP_3rd_hist(imgCb); 
HistCr_3rd = LDP_3rd_hist(imgCr); 

% disp(HistY_3rd);

% Concat_Hist = horzcat( HistY_3rd, HistCb_3rd, HistCr_3rd);

% disp(Concat_Hist);

% binranges = 0:1023;
% figure, bar(binranges,HistY_3rd,'histc'), title('3rd Order Y-LDP');
% figure, bar(binranges,HistCb_3rd,'histc'), title('3rd Order Cb-LDP');
% figure, bar(binranges,HistCr_3rd,'histc'), title('3rd Order Cr-LDP');

% binranges = 0:3071;
Concat_Hist = horzcat( HistY_3rd, HistCb_3rd, HistCr_3rd);
fprintf(fileID,'%d ',Concat_Hist);
fprintf(fileID,'\n');
cnt = cnt + 1;
disp('DONE '); disp(cnt);
% figure, bar(binranges,Concat_Hist,'histc'), title('3rd Order YCbCr-LDP');
end