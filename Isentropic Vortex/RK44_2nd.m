function [Rx, Ry] = RK44_2nd(F, G, Nx, Ny, dx, dy) 
Rx = zeros(Nx, Ny, 4); Ry = zeros(Nx, Ny, 4);

for a = 1: Nx
    if( a == 1)
        Rx(:,a, :) = (1/(2*dx)).*(-F(:,(a+1),:) + F(:,(Nx), :));
    else 
        if( a == Nx)
            Rx(:,a,:) = (1/(2*dx)).*(-F(:,(1),:) + F(:,(a-1),:));
        else
            Rx(:,a,:) = (1/(2*dx)).*(-F(:,(a+1),:) + F(:,(a-1),:));
        end
     end
end

for a = 1: Ny
    if( a == 1)
        Ry(a,:,:) = (1/(2*dy)).*(-G((a+1),:,:) + G((Ny),:,:));
    else
        if( a == Ny)
            Ry(a,:,:) = (1/(2*dy)).*(-G((1),:,:) + G((a-1),:,:));
        else
            Ry(a,:,:) = (1/(2*dy)).*(-G((a+1),:,:) + G((a-1),:,:));
        end
     end
end     