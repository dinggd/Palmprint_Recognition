function [x,y,val] = displacement(iref, igen, m)
[r,c] = size(iref);
iref = double(iref);
igen = double(igen);
%% 2D-DFT and shift
fref = fftshift(fft2(iref));
fgen = fftshift(fft2(igen));
%% band-limited
left = floor(0.5*r*(1-m)+1);
right = floor(0.5*r*(1+m));
%frefbl = zeros(r,c);
%fgenbl = zeros(r,c);
frefbl = fref(left:right,left:right);
fgenbl = fgen(left:right,left:right);
frefbl = ifftshift(frefbl);
fgenbl = ifftshift(fgenbl);
%% cross spectrum normalized
fft0 = conj(fgenbl);
fftr = frefbl.*fft0;
Rfg = fftr./abs(fftr);
%% poc function
rfg = fftshift(ifft2(Rfg));
val = max(max(rfg));
[x, y] = find(rfg == val);
x = floor(0.5 * c * m - x + 1);
y = floor(0.5 * r * m - y + 1);
end