function [scores,blvals] = matching(file,mode)

%% reading pairs to be tested from file
f= fopen(file);
data = textscan(f,'%s %s');
fclose(f);
a = data{1,1};
b = data{1,2};
len = length(a);
scores = zeros(len);
blvals = zeros(len); 
%  i = 12313;
%  score = Loc_based(a{i},b{i});
for i = 1:1:len
    if mode == 0 % using location based method
        [score, blval]= Loc_based(a{i},b{i});
    else
        score = DoG_based(a{i},b{i}); %using DoG based method
    end
    scores(i) = score;
    blvals(i) = blval;
end
end
