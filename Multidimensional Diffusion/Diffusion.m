function x = Diffusion(NY, NX)
Time = 20;
beta = 0.01;

T = zeros(NX,NY);

delta_x = 1/NX;
delta_y = 1/NY;
CFL = 0.25;
delta_t = (CFL * delta_x^2)/beta;
Total_t = Time/delta_t+1;

%B.C.
T(:,NY) = 0;
T(:,1) = 0;
T(1,:) = 0;
T(NX,:) = 1;
%Show B.C.

X = linspace(0,1,NX);
Y = linspace(0,1,NY);

T_pred = T;
 %% Start Figure
figure('units','normalized','outerposition',[0 0 0.4 0.6]);
% figure('units','pixels','position',[0 0 1920 1080])

%% Initialize video
myVideo = VideoWriter('myVideoFile'); %open video file
myVideo.FrameRate = 35; 
open(myVideo)
%%

for a = 1:Total_t
    for j = 2:NY-1 %row 
     for i = 2:NX-1 %column
         T_pred(j,i) = T(j,i) + delta_t * beta *(((T(j-1,i)-2*T(j,i)+T(j+1,i))/delta_x^2))+delta_t * beta *((T(j,i-1)-2*T(j,i)+T(j,i+1))/delta_y^2);
     end
    end
T(:,:) = T_pred(:,:);   
pause(0.01)
% colormap hot
% axis square
h = contourf(X,Y,T(:,:), 'edgecolor','none');

title('Multidimensional Heat Diffusion', 'FontSize',22,'interpreter','latex');
xlabel('x-position','FontSize',20,'interpreter','latex');
ylabel('y-position','FontSize',20,'interpreter','latex');

frame = getframe(gcf); %get frame
writeVideo(myVideo, frame);
end
close(myVideo)

end
% colormap hot
% x = T;
% X = linspace(0,1,NX);
% Y = linspace(0,1,NY);
% contourf(Y,X,T,10);
% 
% %plot design
% xlabel('${n}_{x}$','FontSize',17,'interpreter','latex');
% ylabel('${n}_{y}$','FontSize',17,'interpreter','latex');
% title('Heat Generation in 40 x 40 Gridspace','FontSize',17,'interpreter','latex');

% saveas(figure(1), 'CFD_2_Q4_b80.png')