%% some example from VideoWriter doc
Z = peaks;
surf(Z); 
axis tight manual 
set(gca,'nextplot','replacechildren'); 
%% video file
if isunix % for linux
    pathVideoAVI = '~/someVideo.avi'; % filename, used later to generate mp4
elseif ispc % fow windows
    pathVideoAVI = 'someVideo.avi'; % filename, used later to generate mp4
end
writerObj = VideoWriter(pathVideoAVI,'Uncompressed AVI');
open(writerObj);
%% animate and write AVI
for k = 1:200 
   surf(sin(2*pi*k/20)*Z,Z)
   frame = getframe(gcf);
   writeVideo(writerObj,frame);
end
close(writerObj); % Close the movie file
%% convert AVI to MP4
pathVideoMP4 = regexprep(pathVideoAVI,'\.avi','.mp4'); % generate mp4 filename
if isunix % for linux
    [~,~] = system(sprintf('ffmpeg -i %s -y -an -c:v libx264 -crf 0 -preset slow %s',pathVideoAVI,pathVideoMP4)); % for this to work, you should have installed ffmpeg and have it available on PATH
elseif ispc % for windows
    [~,~] = system(sprintf('ffmpeg.exe -i %s -y -an -c:v libx264 -crf 0 -preset slow %s',pathVideoAVI,pathVideoMP4)); % for this to work, you should have installed ffmpeg and have it available on PATH
end