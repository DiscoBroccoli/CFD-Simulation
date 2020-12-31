function [rho, u, v, X1, Y1] = IC_Euler_Solver(dx,dy,Nx,Ny)

rho = zeros(Nx,Ny); u = zeros(Ny, Nx); v = zeros(Ny,Nx);
X1 = linspace(0,20-dx,Nx); Y1 = linspace(0,20-dy,Ny);
% [X,Y] = meshgrid(0:Nx:20,0:Ny:20);

for a = 1:Ny
        for b = 1:Nx
                rho(a,b) = (density(X1(b),Y1(a)));
                u(a,b) = u_vel(X1(b),Y1(a));
                v(a,b) = v_vel(X1(b),Y1(a));
        end
end