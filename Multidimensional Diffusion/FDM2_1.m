%% ========================================================================
%% ...................ENGR 6251 Assignment #2......................
%% ========================================================================

%% Question 1 - Creating Finite Difference Schemes
clear all; clc;
%%
digitsOld = digits(15);

syms x
%% Exact Slope and Curvature
slope_e = vpa(subs(diff(sin(2*pi*x),x),0.1));
curvature_e = vpa(subs(diff(sin(2*pi*x),x,2),0.1));

%% Creating the different Grid Spacing
 delta_x = gs(10); n = length(delta_x);
 
%% Slope Calculation 
slope = sl(n,delta_x);

for a = 1:11  
 Es(a) = vpa(slope_e - slope(a));
 Es_f = sprintf('%0.5e',Es(a));
end

figure ('Name','ENGR 6251 Assignment #2');
hold on
title('Slope Error vs Grid Spacing','FontSize',16,'interpreter','latex');
xlabel('$\Delta x$','FontSize',14,'interpreter','latex');
ylabel('Error','FontSize',14,'interpreter','latex');
set(gca,'Yscale', 'log', 'Xscale', 'log','fontsize',14)

loglog (delta_x, Es,'Linewidth',2);

coefficients = polyfit(log(delta_x), log(Es), 1);
%Now get the slope, which is the first coefficient in the array:
slope = coefficients(1);
annotation('textbox', [0.42 0.3 0.15 0.1],'String',{'Slope is: = ' num2str(slope)});

%% Curvature Calculation
curvature = cu(n,delta_x);
%%
for a = 1:11 
Ec(a) = abs(double(curvature_e - curvature(a)));
Ec_f = sprintf('%0.5e',Ec(a))
end
%%
figure ('Name','ENGR 6251 Assignment #2');
hold on
title('Curvature Error vs Grid Spacing','FontSize',16,'interpreter','latex');
xlabel('$\Delta x$','FontSize',14,'interpreter','latex');
ylabel('Error','FontSize',14,'interpreter','latex');
set(gca,'Yscale', 'log', 'Xscale', 'log','fontsize',14)

loglog (delta_x, Ec,'Linewidth',2);

coefficients = polyfit(log(delta_x), log(Ec), 1);
curvature_plot = (coefficients(1));
txt = annotation('textbox',[0.42 0.3 0.15 0.1],'String',{'Slope is: = ' num2str(curvature_plot)});
%%

% saveas(figure(1), 'Q1_slope.png')
% close(1)
% 
% saveas(figure(2), 'Q1_curvature.png')
% close(2)
