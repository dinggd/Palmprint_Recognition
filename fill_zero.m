function A = fill_zero(A,r,c,radius)
    [w,h] = size(A);
    if r <= radius
        leftr = 1;
    else
        leftr = r - radius;
    end
    if c <= radius
        leftc = 1;
    else
        leftc = c-radius;
    end
    if r + radius >= h
        rightr = h;
    else
        rightr = r + radius;
    end
    if c + radius >= w
        rightc = w;
    else
        rightc = c + radius;
    end
    [x, y] = meshgrid(leftr:1:rightr,leftc:1:rightc);
    A(x,y) = 0;

end
