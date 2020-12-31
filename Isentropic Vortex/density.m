function rho = density(x,y)

gamma = 1.4; S = 13.5; Ma = 0.4; R =1.5; f = (1-(x-10).^2-(y-10).^2)/(2*R^2);

num = S^2*Ma^2*(gamma-1).*exp(2*f); den = 8*pi^2;

rho = (1-num/den)^(1/(gamma-1));
end
