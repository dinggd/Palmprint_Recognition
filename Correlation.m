close all;
clear all;
%% image path
ref = 'lena.png';
gen = '0002_m_l_01.jpg';
imp = '0001_m_l_01.jpg';
%% image reading and formatting
iref = rgb2gray(imread(ref));
igen = imread(gen);
iimp = imread(imp);
%iref = imresize(iref,[32,32]);
%igen = imresize(igen,[32,32]);
iref = double(iref);
igen = double(igen);
iimp = double(iimp);
[r,c] = size(iref);
%% 2D-DFT and shift
fref = fftshift(fft2(iref));
fgen = fft2(igen);

%% Amplitude spectrum
figure;
imshow(fref);
fref0 = zeros(r,c);
m = 0.45;
left = floor(m*r);
right = floor((1-m)*r);
fref0(left:right,left:right) = fref(left:right,left:right);
myshow(fref0);
%fgen = fgen(left:right,left:right);
figure;
imshow(fref);
rfg = ifft2(double(ifftshift(fref0)));
myshow(rfg);
%figure;
%aref = abs(fref);
%mesh(aref);

%% cross spectrum normalized





fft0 = conj(fgen);
fftr = fref.*fft0;
Rfg = fftr./abs(fftr);
%% poc function
rfg = fftshift(ifft2(double(Rfg)));
figure;
mesh(abs(rfg));
[x, y] = find(rfg == max(max(rfg)));
x = 0.5 * c - left - x + 1;
y = 0.5 * r - left - y + 1;
