function curvature = cu(n, delta_x)
syms x
for a = 1:n 
 u= sin(2*pi*(x));
 uminus = sin(2*pi*(x-delta_x(a)));
 uminus2 = sin(2*pi*(x-2*delta_x(a)));
 uminus3 = sin(2*pi*(x-3*delta_x(a)));
 uminus4 = sin(2*pi*(x-4*delta_x(a)));
 uminus5 = sin(2*pi*(x-5*delta_x(a)));
 
 e_num = (15/4*u - 77/6*uminus + 107/6*uminus2 -13*uminus3 + 61/12*uminus4 - 5/6*uminus5);
 
 curvature(a) = vpa(subs(e_num/delta_x(a)^2,x,0.1));
end