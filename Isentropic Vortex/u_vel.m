function u = u_vel(x,y)

gamma = 1.4; S = 13.5; R =1.5; f = (1-(x-10).^2-(y-10).^2)/(2*(R^2));

num = S*(y-10).*exp(f); den = 2*pi*R;

u = num/den;
end
