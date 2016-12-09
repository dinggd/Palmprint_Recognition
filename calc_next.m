function output = calc_next(input)
[rin, cin] = size(input);
rout = floor(rin/2);
cout = floor(cin/2);
L = rout*cout;
win = 2;
X = zeros(L,win*win,'double');

if mod(rin,2)==1
    r = 2:2:rin;
else
    r = 1:2:rin;
end

if mod(cin,2)==1;
    c = 2:2:cin;
else
    c = 1:2:cin;
end

k = 0;
for i = 1:length(r)
    for j = 1:length(c)
        k = k + 1;
        blk = input(r(i):(r(i)+win-1),c(j):(c(j)+win-1));
        X(k,:) = blk(:)';
    end
end

meanval = mean(X,2);

output = reshape(meanval,cout,rout)';

end
