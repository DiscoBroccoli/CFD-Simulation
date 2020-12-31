function slope = sl(n, delta_x)
syms x
for a = 1:n 
 uplus = sin(2*pi*(x+delta_x(a)));
 uminus = sin(2*pi*(x-delta_x(a)));
 
 uplus2 = sin(2*pi*(x+2*delta_x(a)));
 uminus2 = sin(2*pi*(x-2*delta_x(a)));
 
 e_num = (8*(uplus-uminus) + uminus2 - uplus2);
 
 slope(a) = vpa(subs(e_num/(12*delta_x(a)),x,0.1));
end