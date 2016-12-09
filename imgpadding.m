function impad = imgpadding(img,pad)
    %impad = [img(:,1:pad),img,img(:,end-pad+1:end)];
    %impad = [impad(1:pad,:);impad;impad(end-pad+1:end,:)];
    [w,h] = size(img);
    impad = zeros(w+2*pad,h+2*pad);
    impad(pad+1:pad+w,pad+1:pad+h) = img;
end