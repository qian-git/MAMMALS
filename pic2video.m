function pic2video(input_path,input_video_path,video_name)
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

% framesPath = input_path;%ͼ����������·����ͬʱҪ��֤ͼ���С��ͬ
% videoName1 = input_video_path;
% videoName = strcat(video_name,'.avi');%��ʾ��Ҫ��������Ƶ�ļ�������
fps = 30; %֡��
obj_pic = dir(input_path);
pic_size = size(obj_pic);
if(exist('videoName','file'))
    delete videoName.avi
end

%������Ƶ�Ĳ����趨
videoName2 = strcat(input_video_path,'\',video_name);
aviobj=VideoWriter(videoName2);  %����һ��avi��Ƶ�ļ����󣬿�ʼʱ��Ϊ��
aviobj.FrameRate=fps;

open(aviobj);%Open file for writing video data
%����ͼƬ

for i = 3:pic_size(1)
    fileName = obj_pic(i).name;
    frames=imread([input_path,'\',fileName]);
    writeVideo(aviobj,frames);
end
close(aviobj);% �رմ�����Ƶ
end

