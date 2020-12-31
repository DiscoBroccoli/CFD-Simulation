function [F, G] = flux_FG(w)

gamma = 1.4; 

rho = w(:,:,1);
u = w(:,:,2)./w(:,:,1); %u
v = w(:,:,3)./w(:,:,1); %v
p4 = w(:,:,4) - 0.5.*rho.* (u.^2 + v.^2);
p  = (gamma-1) .* p4; % pressure
rho_E = w(:,:,4);

F(:,:,1) = w(:,:,2); %rho*u
F(:,:,2) = (w(:,:,2) .* u) + p; %rho*u^2+p
F(:,:,3) = w(:,:,2) .* v; %rho*u*v
F(:,:,4) = u .* (rho_E+p); %u*(rho*E+p)

G(:,:,1) = w(:,:,3); %rho*v
G(:,:,2) = w(:,:,3) .* u; %rho*u*v
G(:,:,3) = w(:,:,3) .* v +p; %rho*v^2+p
G(:,:,4) = v .* (rho_E+p); %v*(rho*E+p)
end