faceDetector = vision.CascadeObjectDetector;

img = imread('test.jpg');
disp(size(img));
figure, imshow(img), title('Original Image');

img = rgb2gray(img);
figure, imshow(img), title('Gray Image');

bboxes = step(faceDetector, img);

% disp(bboxes);

IFaces = insertObjectAnnotation(img, 'rectangle', bboxes, 'Face');
figure, imshow(IFaces), title('Detected faces');

img = imcrop(img,bboxes); 
img = imresize(img, [300, 300]);

figure, imshow(img), title('Cropped & Resized Image');

img = im2double(img);

Hist_2nd = LDP_2nd_hist(img); 
Hist_3rd = LDP_3rd_hist(img); 
Hist_4th = LDP_4th_hist(img); 

disp(Hist_2nd);
disp(Hist_3rd);
disp(Hist_4th);

binranges = 0:1023;
figure, bar(binranges,Hist_2nd,'histc'), title('2nd Order LDP');
figure, bar(binranges,Hist_3rd,'histc'), title('3rd Order LDP');
figure, bar(binranges,Hist_4th,'histc'), title('4th Order LDP');



