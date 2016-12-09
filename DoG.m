% Difference of Gaussians Test

close all;
clear all;
num = 16;
k = 5;
img = '0002_m_l_06.jpg';
Im0 = imread(img);
%Im0 = rgb2gray(Im0);
Im = double(Im0);
%Im = imresize(Im,[160,160],'cubic');
A = Process(Im,0.65,0.2,2*k+1);

A(A<0)=0; 
figure;
pcolor(A);
%caxis([0,0.2]);
drawr = zeros(num,1);
drawc = zeros(num,1);
figure;
imshow(Im/max(max(Im)));
%imshow(A);
hold on;
A=A';
for i = 1:1:num
    maxv = max(max(A));
    [r,c] = find(A==maxv);
    drawr(i,1)=r;
    drawc(i,1)=c;
    A = fill_zero(A,r,c,8);
end



plot(drawr,drawc,'r.');

