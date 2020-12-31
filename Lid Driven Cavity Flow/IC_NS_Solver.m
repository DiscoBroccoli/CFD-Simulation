function [rho0, u, v, E, T0, P0] = IC_NS_Solver(Nx,Ny)
gamma=1.4; Ma=0.1; Cv = 1/(gamma-1); u_w=1;

% R=1 so it is not included in formula
rho0 = ones(Nx,Ny); u = zeros(Ny, Nx); v = zeros(Ny,Nx); u(Ny,:) = 1; 

T0 = (u_w/Ma)^2/(gamma);
P0 = rho0*T0;

E = Cv*T0+0.5.*(u.^2+v.^2); 