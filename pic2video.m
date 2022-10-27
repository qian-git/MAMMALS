function pic2video(input_path,input_video_path,video_name)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明

% framesPath = input_path;%图像序列所在路径，同时要保证图像大小相同
% videoName1 = input_video_path;
% videoName = strcat(video_name,'.avi');%表示将要创建的视频文件的名字
fps = 30; %帧率
obj_pic = dir(input_path);
pic_size = size(obj_pic);
if(exist('videoName','file'))
    delete videoName.avi
end

%生成视频的参数设定
videoName2 = strcat(input_video_path,'\',video_name);
aviobj=VideoWriter(videoName2);  %创建一个avi视频文件对象，开始时其为空
aviobj.FrameRate=fps;

open(aviobj);%Open file for writing video data
%读入图片

for i = 3:pic_size(1)
    fileName = obj_pic(i).name;
    frames=imread([input_path,'\',fileName]);
    writeVideo(aviobj,frames);
end
close(aviobj);% 关闭创建视频
end

