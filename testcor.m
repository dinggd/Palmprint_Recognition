clear all;
close all;
name = '0002_m_l_01.jpg';
im = imread(name);
size = size(im);
off = 80;
a = zeros(size);
b = zeros(size);

myshow(im);
a(1+off:end,2:end) = im(1:end-off,1:end-1);
myshow(a);
b(1:end-1,1:end-1) = im(2:end,2:end);
myshow(b);

[x,y] = displacement(im,a);
