function score = dis_score(p,q)
r_hor = p(:,2:end);
r_hor_diff = p(:,1:end-1) - r_hor;
c_hor = q(:,2:end);
c_hor_diff = q(:,1:end-1) - c_hor;

hor_dis = sqrt(r_hor_diff.^2 + c_hor_diff.^2);

r_ver = p(2:end,:);
r_ver_diff = p(1:end-1,:) - r_ver;
c_ver = q(2:end,:);
c_ver_diff = q(1:end-1,:) - c_ver;

ver_dis = sqrt(r_ver_diff.^2 + c_ver_diff.^2);

all_dis = [hor_dis(:);ver_dis(:)];
[a,b] = hist(all_dis,[0:1:30]);
a = a/sum(a);
opt = fitoptions('Method','NonlinearLeastSquares');
opt.Lower = [0,2,0];
opt.Upper = [+Inf,14,+Inf];
opt.Startpoint = [0.5,8,0.5];
fun=fittype('a1/c1*exp(-(x-b1)^2/(2*c1^2))');
f = fit(b',a',fun,opt);
%figure;
%plot(f,b,a);
score = f.a1/f.c1;
end