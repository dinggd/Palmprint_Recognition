x = [-5:0.1:5];
sigma = 0.5;
mu = 0;
A=0.8;
y = A/sigma*exp(-(x-mu).^2/(2*(sigma^2)));
plot(x,y)