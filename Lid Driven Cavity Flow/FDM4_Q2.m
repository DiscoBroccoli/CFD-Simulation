%% ========================================================================
%% ...................ENGR 6251 Assignment #4......................
%% ========================================================================
 
% Question 2 - Shock Tubes using Finite Volume Methods
clear all; clc;

dx = [1/80 1/160 1/320 1/640]; 
delta_x_v = [80 160 320 640];
gam = 1.4; 

figure('Name','ENGR 6251 Assignment #4','units','normalized','outerposition',[0 0 0.55 0.55]);
hold on;
title(' Shock Tubes using Finite Volume Methods$','interpreter','latex');
xlabel('x-position','interpreter','latex');
ylabel('u-position','interpreter','latex');

%%
wL = [1 0 1]; %[density, velocity, pressure]
wR = [0.125 0 0.1]; %[density, velocity, pressure]

EL = wL(3)/((gam-1)*wL(1)) + 0.5*wL(2)^2;
ER = wR(3)/((gam-1)*wR(1)) + 0.5*wR(2)^2;

wL = [wL(1)  wL(1)*wL(2) wL(1)*EL]; 
wR = [wR(1)  wR(1)*wR(2) wR(1)*ER]; 
%%
for a=4
   dt=0.1*dx(a); nt=0.2/dt; 
    
    for i=1:delta_x_v(a)/2
        w(:,i) = wL;
    end
    for i= delta_x_v(a)/2+1:delta_x_v(a)
        w(:,i) = wR;
    end

for c=1:nt
%% Left Interface Flux
       for i = 1:delta_x_v(a)  
          if i == 1
          lf(i,:) = roe_flux(w(:,i)',w(:,i)',gam);
          else
          lf(i,:) = roe_flux(w(:,i-1)',w(:,i)',gam);
          end 
       end
%% Right Interface Flux
       for i = 1:delta_x_v(a) 
          if i == delta_x_v(a) 
          rf(i,:) = roe_flux(w(:,i)',w(:,i)',gam);
          else
          rf(i,:) = roe_flux(w(:,i)',w(:,i+1)',gam);
          end 
       end
       
    for i = 1:delta_x_v(a) 
        w(:,i) = w(:,i)' - (dt/dx(a)) * (rf(i,:)-lf(i,:)); 
    end
end

title(['Sod''s Shock Tube Profil, $N$ = ',num2str(delta_x_v(a)),''],'FontSize',20,'interpreter','latex');
xlabel('x-position','FontSize',20,'interpreter','latex');
ylabel('y-value','FontSize',20,'interpreter','latex');
plot(linspace(1,delta_x_v(a),delta_x_v(a)), w(1,:), 'Linewidth',2)
plot(linspace(1,delta_x_v(a),delta_x_v(a)), w(2,:)./w(1,:), 'Linewidth',2)
plot(linspace(1,delta_x_v(a),delta_x_v(a)), (gam-1).*(w(3,:)-0.5.*w(1,:).*w(2,:)), 'Linewidth',2)
legend('Density, $\rho$','Velocity, $u$','Pressure, $P$','Location','northeast','FontSize',20,'interpreter','latex')

fname = '/home/j_bao/Desktop/FDM/Assignment4';
saveas(gca, fullfile(fname, ['FEM4_Q2_N_',num2str(delta_x_v(a)),'.png']));
close
end







