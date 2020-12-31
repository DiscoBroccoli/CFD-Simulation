function E = error2(w, rho, Nx, Ny)

E = sqrt((sum(sum((w - rho).^2)))/(Nx*Ny));