function score=DoG_based(im1,im2)

%% parameters
sigma1 = 0.65;
sigma2 = 0.2;
ksize = 5;
num = 100;
pad = 24;
imsize = 160;
blm = 0.33;

%% reading images and create image for each layer
a0 = imread(im1);
a0 = imresize(a0,[imsize,imsize]);
a0pad = imgpadding(a0,pad);
a1 = calc_next(a0);
a1pad = imgpadding(a1,pad);
a2 = calc_next(a1);
[r2, c2] = size(a2);

b0 = imread(im2);
b0 = imresize(b0,[imsize,imsize]);
b0pad = imgpadding(b0,pad);
b1 = calc_next(b0);
b1pad = imgpadding(b1,pad);
b2 = calc_next(b1);
%% getting reference points from ref image
[pr0, pc0]= getref(a0,sigma1,sigma2,ksize,num);
pr1 = floor(pr0/2);
pc1 = floor(pc0/2);
pr2 = floor(pr1/2);
pc2 = floor(pc1/2);

%% displacement & locations
%layer2
[x2, y2, val2] = displacement(a2,b2,blm);
qr2 = pr2 + x2;
qc2 = pc2 + y2;
for i=1:1:num
     if qr2(i) > r2 || qr2(i) < 1
         qr2(i) = nan;
         qc2(i) = nan;
     end
     if qc2(i) > c2 || qc2(i) < 1
         qc2(i) = nan;
         qr2(i) = nan;
     end
end

% layer1
[qr1,qc1,val1] = getqloc(pr1,pc1,qr2,qc2,num,a1pad,b1pad,pad,blm);
% layer0
[qr0,qc0,val0] = getqloc(pr0,pc0,qr1,qc1,num,a0pad,b0pad,pad,blm);
score = nanmean(abs(val0));
%myshow(b0);
%hold on;
%plot(qr0,qc0,'r.');
end



