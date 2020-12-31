%% ========================================================================
%% ................2D N-S Solver, Lid Driven Cavity Flow...................
%% ========================================================================

clear all; clc;
N =129; Nx = N; Ny = N; 
CFL = 0.2;
dx = 1/(Nx-1); dy = 1/(Ny-1);
dt = CFL*dx; n_iter_t = 2/dt; 
 %% Start Figure
figure('units','normalized','outerposition',[0 0 1 1]);
%% Initializing
[X,Y] = meshgrid(0:dx:1,0:dy:1); X1 = linspace(0,1,Nx); Y1 = linspace(0,1,Ny);
[rho0, u, v, E, T0, P0] = IC_NS_Solver(Nx,Ny); u_w =1; gamma =1.4; R=1; nu=0.01;
Cv = 1/(gamma-1); Cp = gamma*Cv; Pr=0.71;
%% Storing w vector 
w(:,:,1) = rho0; w(:,:,2) = rho0.*u; w(:,:,3) = rho0.*v; w(:,:,4) = rho0.*E;

%% Initialize video
myVideo = VideoWriter('Lid'); %open video file
myVideo.FrameRate = 35; 
open(myVideo)
%% RK method
tic
for n=1:n_iter_t    
  [F, G] = flux_FG(w,N,R);
  R1 = RK44_space(F,G,N);
  w1 = Correct_w(w-0.5*dt*R1, N);
    
  [F, G] = flux_FG(w1,N,R);
  R2 = RK44_space(F,G,N);
  w2 = Correct_w(w-0.5*dt*R2, N);
    
  [F, G] = flux_FG(w2,N,R);
  R3 = RK44_space(F,G,N);
  w3 = Correct_w(w-dt*R3, N);
    
  [F, G] = flux_FG(w3,N,R);
  R4 = RK44_space(F,G,N);
    
  w = w - dt/6*(R1+2*R2+2*R3+R4);
  w = Correct_w(w, N);
    
pause(0.01)    
contourf(X,Y,sqrt(w(:,:,3).^2+w(:,:,2).^2),'edgecolor','none');

% title(['Pressure Distribution, N = ',num2str(N),''],'FontSize',18,'interpreter','latex');
title(['Lid Driven Cavity Flow - Velocity Magnitude'],'FontSize',18,'interpreter','latex');
xlabel('x-position','FontSize',20,'interpreter','latex');
ylabel('y-position','FontSize',20,'interpreter','latex');
axis square

colorbar
frame = getframe(gcf); %get frame
writeVideo(myVideo, frame);
end
close(myVideo)
toc

vm = sqrt((w(:,:,2)./w(:,:,1)).^2+(w(:,:,3)./w(:,:,1)).^2);
P = (gamma-1).*(w(:,:,4)-(0.5.*w(:,:,1).*(vm.^2)));
%%
contourf(X,Y,P);
xlabel('x')
ylabel('y')
colorbar
axis square
%% Specify Figure
title(['Pressure using N = ',num2str(N),''],'FontSize',18,'interpreter','latex');
xlabel('x-position','FontSize',20,'interpreter','latex');
ylabel('y-position','FontSize',20,'interpreter','latex');

% fname = '/home/j_bao/Desktop/FDM/Assignment4';
% saveas(gca, fullfile(fname, ['FDM4_Q1_P_',num2str(N),'.png']));
% close

%% Compare Result Ghia(1982)
% ghia_u = [0 0.0547 0.0625 0.0703 0.1016 0.1719 0.2813 0.4531 0.5 0.6172...
%     0.7344 0.8516 0.9531 0.9609 0.9688 0.9766 1;0 -0.03717 -0.04192 -0.04775...
%     -0.06434 -0.1015 -0.15662 -0.2109 -0.20581 -0.13641 0.00332 0.23151...
%     0.68717 0.73722 0.78871 0.84123 1];
% 
% % figure('units','normalized','outerposition',[0 0 0.5 0.5]);
% title(['$u$-Velocity along Vertical Line, $N$ ',num2str(N),''],'FontSize',20,'interpreter','latex');
% xlabel('$u$ velocity','FontSize',20,'interpreter','latex');
% ylabel('y-position','FontSize',20,'interpreter','latex');
% axis square
% 
% hold on
% plot(ghia_u(2,:),ghia_u(1,:),'LineWidth',2);
% if N == 33
% plot(w(:,17,2),linspace(1,33,33)/33,'LineWidth',2);
% elseif N == 65
% plot(w(:,33,2),linspace(1,65,65)/65,'LineWidth',2);
% else
% plot(w(:,65,2),linspace(1,129,129)/129,'LineWidth',2);
% end
% legend('Ghia(1982)',['Grid Points = ',num2str(N),''],'Location','southeast')
% fname = '/home/j_bao/Desktop/FDM/Assignment4';
% saveas(gca, fullfile(fname, ['FEM4_Q1_ghia_u_',num2str(N),'.png']));
% close
% %%
% ghia_u = [0 0.0625 0.0703 0.0781 0.0938 0.1563 0.2266 0.2344 0.5 0.8047...
%     0.8594 0.9063 0.9453 0.9531 0.9609 0.9688 1;0 0.09233 0.10091 0.1089...
%     0.12317 0.16077 0.17507 0.17527 0.05454 -0.24533 -0.22445 -0.16914...
%     -0.10313 -0.08864 -0.07391 -0.05906 0];
% title(['$v$-Velocity along Horizontal Line, $N$ ',num2str(N),''],'FontSize',20,'interpreter','latex');
% xlabel('x-position','FontSize',20,'interpreter','latex');
% ylabel('$v$ velocity','FontSize',20,'interpreter','latex');
% axis square
% 
% hold on
% plot(ghia_u(1,:),ghia_u(2,:),'LineWidth',2);
% if N == 33
% plot(linspace(1,33,33)/33,w(17,:,3),'LineWidth',2);
% elseif N == 65
% plot(linspace(1,65,65)/65,w(33,:,3),'LineWidth',2);
% else
% plot(linspace(1,129,129)/129,w(65,:,3),'LineWidth',2);
% end
% legend('Ghia(1982)',['Grid Points = ',num2str(N),''],'Location','northeast')
% fname = '/home/j_bao/Desktop/FDM/Assignment4';
% saveas(gca, fullfile(fname, ['FEM4_Q1_ghia_v_',num2str(N),'.png']));
% close



