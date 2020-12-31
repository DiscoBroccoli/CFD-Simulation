function [F, G] = flux_FG(w,N,R)
%% inviscid part
rho = w(:,:,1); u = w(:,:,2)./w(:,:,1); 
v = w(:,:,3)./w(:,:,1); E = w(:,:,4)./w(:,:,1);
gamma=1.4;
P = w(:,:,1).*(gamma-1).*(E-0.5*u.^2+v.^2);

Fi(:,:,1) = rho.*u;
Fi(:,:,2) = (rho.*u.^2)+P; 
Fi(:,:,3) = rho.*u.*v; 
Fi(:,:,4) = u.*(rho.*E+P); 

Gi(:,:,1) = rho.*v; 
Gi(:,:,2) = rho.*u.*v; 
Gi(:,:,3) = (rho.*v.^2)+P; 
Gi(:,:,4) = v.*(E.*rho+P); 
%% viscuous part
T(:,:) = (gamma-1)*(E(:,:)-0.5*(u(:,:).^2+v(:,:).^2))/R;

A(:,:,1) = u; A(:,:,2) = v; A(:,:,3) = T;

Dx(:,:,1) = space_2nd(A(:,:,1),1,N); %du/dx 
Dx(:,:,2) = space_2nd(A(:,:,2),1,N); %dv/dx
Dx(:,:,3) = space_2nd(A(:,:,3),1,N); %dt/dx

Dy(:,:,1) = space_2nd(A(:,:,1),0,N); %du/dy
Dy(:,:,2) = space_2nd(A(:,:,2), 0,N); %dv/dy
Dy(:,:,3) = space_2nd(A(:,:,3),0,N); %dt/dy

gamma = 1.4; R = 1; Pr = 0.71; cp = gamma*R/(gamma-1); 
mu = 0.01; k = mu*cp/Pr;
% coefficient
qx = -k.*Dx(:,:,3); qy = -k.*Dy(:,:,3);

tauxx = 2/3.*mu.*(2.*Dx(:,:,1)-Dy(:,:,2));
tauyy = 2/3.*mu.*(2.*Dy(:,:,2)-Dx(:,:,1));

tauxy = mu.*(Dy(:,:,1)+Dx(:,:,2));

Fv(:,:,1) = zeros(N,N);
Fv(:,:,2) = -1*tauxx;
Fv(:,:,3) = -1*tauxy;
Fv(:,:,4) = qx-u.*tauxx-v.*tauxy;

Gv(:,:,1) = zeros(N,N);
Gv(:,:,2) = -1*tauxy;
Gv(:,:,3) = -1*tauyy;
Gv(:,:,4) = qy-u.*tauxy-v.*tauyy;
%% add flux
F = Fi + Fv; G = Gi + Gv;
end