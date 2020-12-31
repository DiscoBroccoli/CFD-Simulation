%% ========================================================================
%% ...................AERO 455 Assignment #2......................
%% ========================================================================

%Question 2 - Consistency, Stability, and Convergence
clear all; clc;

CFL = 0.5:0.1:1;
dw = linspace (0, pi, 100);
j = sqrt(-1);
af = zeros(6,100);%amplification factor

for a = 1:6

for i = 1:100
     af(a,i) =sqrt(1 +CFL(a)^2*(cos(dw(i))-1)^2*(CFL(a)^2-1));
    
num(i) = log(1 - CFL(a)^2*(1-cos(dw(i)))-j*CFL(a)*sin(dw(i)));
den(i) = (-j*dw(i)*CFL(a));  
pe(a,i) = num(i)/den(i);   

     af_c(a,i) = abs(sqrt((1 - (j*CFL(a))*sin(dw(i)))^2));
     
num_c(i) = log((1 - (j*CFL(a))*sin(dw(i))));
den_c(i) = (-j*dw(i)*CFL(a));  
pe_c(a,i) = num_c(i)/den_c(i);
end

end

figure('Name','ENGR 6251 Assignment #2 a)','units','normalized','outerposition',[0 0 1 1]);
hold on;
title('Amplification Factor vs CFL Number','Fontsize', 20,'interpreter','latex');
xlabel('Wave Number - $\beta$', 'Fontsize', 18,'interpreter','latex');
ylabel('Amplification Factor - $e^{a\Delta t}$ ', 'Fontsize', 18,'interpreter','latex');
box on
for a = 1:6
txt =  ['CFL, \sigma =',num2str(CFL(a))];
plot(dw, af(a,:), 'DisplayName', txt, 'LineWidth', 2);
xticks([0 pi])
xticklabels({'0','\pi'})
end
legend show
legend ('location','Northwest')

figure('Name','ENGR 6251 Assignment #2 a)','units','normalized','outerposition',[0 0 1 1]);
hold on;
title('Relative Phase Error vs CFL Number','Fontsize', 20,'interpreter','latex');
xlabel('Wave Number - $\beta$', 'Fontsize', 18,'interpreter','latex');
ylabel('$\phi/ \phi_{E}$', 'Fontsize', 18,'interpreter','latex');
box on
for a = 1:6
txt =  ['CFL, \sigma =',num2str(CFL(a))];
plot(dw, pe(a,:), 'DisplayName', txt, 'LineWidth', 2);
xticks([0 pi])
xticklabels({'0','\pi'})
end
legend show
legend ('location','Northwest')

figure('Name','ENGR 6251 Assignment #2 a)','units','normalized','outerposition',[0 0 1 1]);
hold on;
title('Amplification Factor vs CFL Number','Fontsize', 20,'interpreter','latex');
xlabel('Wave Number - $\beta$', 'Fontsize', 18,'interpreter','latex');
ylabel('Amplification Factor - $e^{a\Delta t}$ ', 'Fontsize', 18,'interpreter','latex');
box on
for a = 1:6
txt =  ['CFL, \sigma =',num2str(CFL(a))];
plot(dw, af_c(a,:), 'DisplayName', txt, 'LineWidth', 2);
xticks([0 pi])
xticklabels({'0','\pi'})
end
legend show
legend ('location','Northwest')

figure('Name','ENGR 6251 Assignment #2 a)','units','normalized','outerposition',[0 0 1 1]);
colormap('bone')
hold on;
title('Relative Phase Error vs CFL Number','Fontsize', 20,'interpreter','latex');
xlabel('Wave Number - $\beta$', 'Fontsize', 18,'interpreter','latex');
ylabel('$\phi/ \phi_{E}$', 'Fontsize', 18,'interpreter','latex');
box on
for a = 1:6
txt =  ['CFL, \sigma =',num2str(CFL(a))];
plot(dw, pe_c(a,:), 'DisplayName', txt, 'LineWidth', 2);
xticks([0 pi])
xticklabels({'0','\pi'})
end

% hold off
% legend show
% legend ('location','Northeast')
% 
% saveas(figure(1), 'FDM2_Q2_b)af.png')
% close(1)
% 
% saveas(figure(2), 'FDM2_Q2_b)pe.png')
% close(2)
% 
% saveas(figure(3), 'FDM2_Q2_c)af.png')
% close(3)
% 
% saveas(figure(4), 'FDM2_Q2_c)pe.png')
% close(4)
