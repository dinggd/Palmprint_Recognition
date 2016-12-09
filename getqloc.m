function [ql1,ql2,val] = getqloc(pl1,pl2,qll1,qll2,num,imp,imq,pad,blm)
    [r,c] = size(imp);
    ql1 = 2*qll1;
    ql2 = 2*qll2;
    val = zeros(num,1);
    for i=1:1:num
        if isnan(ql1(i))
            continue;
        end
        imppatch = imp(pl1(i):pl1(i)+2*pad,pl2(i):pl2(i)+2*pad);
        imqpatch = imq(ql1(i):ql1(i)+2*pad,ql2(i):ql2(i)+2*pad);
        [xl,yl,vall] = displacement(imppatch,imqpatch,blm);
        val(i) = vall;
        ql1(i) = ql1(i) + xl;
        if ql1(i) > r - 2 * pad || ql1(i) < 1
           ql1(i) = nan;
           ql2(i) = nan;
           val(i) = nan;
           continue;
        end
        ql2(i) = ql2(i) + yl;
        if ql2(i) > c - 2 * pad || ql2(i) < 1
           ql2(i) = nan;
           ql1(i) = nan;
           val(i) = nan;
           continue;
        end
    end
end