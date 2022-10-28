function pic2video(input_path,input_video_path,video_name)
fps = 30;
obj_pic = dir(input_path);
pic_size = size(obj_pic);
if(exist('videoName','file'))
    delete videoName.avi
end

videoName2 = strcat(input_video_path,'\',video_name);
aviobj=VideoWriter(videoName2);  
aviobj.FrameRate=fps;

open(aviobj);%Open file for writing video data
%read pic

for i = 3:pic_size(1)
    fileName = obj_pic(i).name;
    frames=imread([input_path,'\',fileName]);
    writeVideo(aviobj,frames);
end
close(aviobj);
end

