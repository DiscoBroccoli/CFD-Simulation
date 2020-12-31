function E = rho_energy(p,rho,u,v)

gamma = 1.4;

first = p./(gamma-1); second = rho.*0.5.*(u.^2+v.^2);

E = first + second;
end
