function [F] = roe_flux(wL,wR,gam)
% SLOW... Example of Roe's Riemann solver

% Get the densities
rhoL = wL(1);
rhoR = wR(1);

% Get the velocities
uL   = wL(2)/wL(1);
uR   = wR(2)/wR(1);

% Get the internal energies
eL   = wL(3)/wL(1)-1/2*uL^2;
eR   = wR(3)/wR(1)-1/2*uR^2;

% Get the specific energy
EL   = wL(3)/wL(1);
ER   = wR(3)/wR(1);

% Get the pressures
pL   = (gam-1)*rhoL*eL;
pR   = (gam-1)*rhoR*eR;

% Get the enthalpies
hL   = (wL(3)+pL)/rhoL;
hR   = (wR(3)+pR)/rhoR;

% Get the LHS flux
FL(1)  = rhoL*uL;
FL(2)  = rhoL*uL^2 + pL;
FL(3)  = uL*(rhoL*EL+pL);

% Get the RHS flux
FR(1)  = rhoR*uR;
FR(2)  = rhoR*uR^2 + pR;
FR(3)  = uR*(rhoR*ER+pR);

% Get the Roe average velocity and enthalpy
ub  = (rhoL^0.5*uL+rhoR^0.5*uR)/(rhoL^0.5+rhoR^0.5);
hb  = (rhoL^0.5*hL+rhoR^0.5*hR)/(rhoL^0.5+rhoR^0.5);

% Get the Jacobian
Ab = [0 1 0;(gam-3)/2*ub^2 (3-gam)*ub gam-1;-hb*ub+(gam-1)/2*ub^3 hb-(gam-1)*ub^2 gam*ub];

% Get the eigenvalues and L/R eigenvectors (Should really be pre-tabulated...)
[R,D] = eig(Ab);
L = inv(R);

%Apply Haartens entropy fix
del   = 0.001;
for j=1:3
    if(j==1 || j==3)
      if abs(D(j,j)) < del
        D(j,j) = 0.5*(D(j,j)^2/del+del);
      end
    end
end

% Get the Roe Flux
F   = 0.5*(FL' + FR' + R*abs(D)*L*(wL'-wR'));