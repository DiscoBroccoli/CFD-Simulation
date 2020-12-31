%% ========================================================================
%% ...................2D Euler Solver......................
%% ========================================================================

N =70; Nx = N; Ny = N;
dx = 20/Nx; dy = 20/Ny;
dt = (dx)/6; n_iter_t = 20/dt;
 %% Start Figure
figure('units','normalized','outerposition',[0 0 1 1]);
%% Storing w vector
[rho, u, v, X1, Y1] = IC_Euler_Solver(dx,dy,Nx,Ny); p = (rho.^1.5)./(1.4*(0.4^2));
w(:,:,1) = rho; w(:,:,2) = rho.*u; w(:,:,3) = rho.*v; w(:,:,4) = rho_energy(p, rho, u, v);
[F, G] = flux_FG(w); [X,Y] = meshgrid(0:dx:20-dx,0:dy:20-dy);
% F = flux_F(w, p); G = flux_G(w, p); 

%% Initialize video
myVideo = VideoWriter('Isentropic Vortex,',num2str(N),'x',num2str(N)); %open video file
myVideo.FrameRate = 35; 
open(myVideo)

%% RK method
tic
for c = 1:n_iter_t
[R1x, R1y] = RK44_4th(F, G, Nx, Ny, dx, dy);
[new_F, new_G] = flux_FG(w + (dt/2) .* (R1x+R1y));

[R2x, R2y] = RK44_4th(new_F, new_G, Nx, Ny, dx, dy);  
[new_F, new_G] = flux_FG(w + (dt/2) .* (R2x+R2y));

[R3x, R3y] = RK44_4th(new_F, new_G, Nx, Ny, dx, dy);
[new_F, new_G] = flux_FG(w + (dt) .* (R3x+R3y));

[R4x, R4y] = RK44_4th(new_F, new_G, Nx, Ny, dx, dy);  

w = w + (dt/6) .* ((R1x+R1y) + 2.*(R2x+R2y) + 2.*(R3x+R3y) + (R4x+R4y));   
[F, G] = flux_FG(w);

pause(0.01)
h = surf(X1,Y1,w(:,:,1));

title('Isentropic Vortex - Density [$\rho$]', 'FontSize',22,'interpreter','latex');
xlabel('x-position','FontSize',20,'interpreter','latex');
ylabel('y-position','FontSize',20,'interpreter','latex');

z = zlabel('[$\rho$]','FontSize',20,'Rotation', 0, 'interpreter','latex');
set(z, 'position', get(z,'position')-[0.5,0,0]);

frame = getframe(gcf); %get frame
writeVideo(myVideo, frame);
end
close(myVideo)
toc
%%
% contourf(X1,Y1,w(:,:,1));
% colorbar
% axis square
%% Specify Figure
% title('Solution of the Density in an Isentropic Vortex using N = 480', 'FontSize',22,'interpreter','latex');
% xlabel('x-position','FontSize',20,'interpreter','latex');
% ylabel('u-position','FontSize',20,'interpreter','latex');
% saveas(figure(1), ''Isentropic Vortex,',num2str(N),'x',num2str(N).png')
% close(1)
%%
E = error2(w(:,:,1), rho, Nx, Ny);
%%
% set(gca,'Yscale', 'log', 'Xscale', 'log','fontsize',14)
% box on
% grid on
% % E = [1.1773e-02  2.9611e-03 7.4387e-04 1.8597e-04];
% E = [6.6806e-04 3.5751e-05 2.2438e-06 1.4032e-07];
% N = [60 120 240 480];
% 
% loglog (N,E,'Linewidth',2);
% title('$L_2$ vs $N$ Size with $4^{th}$ Order Accuracy','FontSize',18,'interpreter','latex');
% ylabel('Error, $L_2$','FontSize',16,'interpreter','latex');
% xlabel('Grid Size, $N$','FontSize',16,'interpreter','latex');
% 
% coefficients = polyfit(log(N), log(E), 1);
% % Now get the slope, which is the first coefficient in the array:
% slope = coefficients(1);
% 
% annotation('textbox', [.4 .3 .1 .1], 'String', ...
%          ['slope = ',num2str(slope)]);
%      
% saveas(figure(1), 'error.png')
% close(1)
