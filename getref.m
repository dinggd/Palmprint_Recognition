function [r,c] = getref(im,sigma1,sigma2,ksize,num)
im = double(im);
%im = imresize(im,[160,160],'cubic');
A = Process(im,sigma1,sigma2,2*ksize+1);

A(A<0)=0; 

r = zeros(num,1);
c = zeros(num,1);

%myshow(im);
%hold on;
%A=A';
for i = 1:1:num
    maxv = max(max(A));
    [tmpr,tmpc] = find(A==maxv);
    r(i,1)=tmpr(1);
    c(i,1)=tmpc(1);
    A = fill_zero(A,tmpr(1),tmpc(1),8);
end
%plot(r,c,'r.');
end