clear;clc;
video_path_0 =  '.\video';
video_path_2 = '.\output';
pic_path = '.\pic';
obj_video = dir(video_path_0);
obj_video_size = size(obj_video);
temp_most = 500;

row = 368;col = 368;single_fix_row = 23;single_fix_col = 23;
row_node_0 = row/single_fix_row;col_node_0 = col/single_fix_col;
pix_change_cout_gate_H = 22;pix_change_cout_gate_L = 15;pix_gate_H = 21;pix_gate_L = 18;pix_gate = 20; %change to catch video feature
pre_frame_cout = 0;
image_r = zeros(row,col,'uint8');data_pre_pix = zeros(row,col);data_ref_pix = zeros(row,col);
data_change_pix = zeros(row,col);level_0 = zeros(row_node_0,col_node_0);
level_1_row = row_node_0/2; level_2_row = level_1_row/2; level_3_row = level_2_row/2; level_4_row = level_3_row/2;
level_1_col = col_node_0/2; level_2_col = level_1_col/2; level_3_col = level_2_col/2; level_4_col = level_3_col/2;

ramdom_cout = 15;temp_all = 0;
ramdom_obj_num = 2;
while(ramdom_cout <= 21)
% ramdom_obj_num = randi([3,obj_video_size(1)]);
% ramdom_obj_num = 12;
ramdom_obj_num = ramdom_cout;
% ramdom_obj_num = 8;
% if(ramdom_obj_num > obj_video_size(1))
%     ramdom_obj_num = 3;
% end
video_name = obj_video(ramdom_obj_num).name;
video_path = strcat(video_path_0,'\',video_name);

obj = VideoReader(video_path);
numframes = obj.Duration * obj.FrameRate; %视频总帧数
begin_frame = 1; end_frame = fix(numframes);
% while hasFrame(obj)
write_level_0_output = cell(end_frame,256);
write_level_1_output = cell(end_frame,64);
write_level_2_output = cell(end_frame,16);
write_level_3_output = cell(end_frame,4);
write_level_4_output = cell(end_frame,1);
% write_level_0_output = cell(end_frame,1024);
% write_level_1_output = cell(end_frame,256);
% write_level_2_output = cell(end_frame,64);
% write_level_3_output = cell(end_frame,16);
% write_level_4_output = cell(end_frame,4);
for temp = begin_frame:1:end_frame
    frame = readFrame(obj);
    [sizea,sizeb,~] = size(frame);
%     frame(row+1:sizea,:,:) = [];
%     frame(:,col+1:sizeb,:) = [];
    frame(1:(sizea-row),:,:) = [];
    frame(:,col+1:sizeb,:) = [];
    
    image_old = image_r;
    image_r = frame(:,:,2);%取绿色值
    data_change_pix = zeros(row,col);
    pre_change_pix = zeros(row,col);
    
    show = frame;
%     show = 255*ones(row,col,3,'uint8');

    level_0_output = strings(row_node_0,col_node_0);
    level_1_output = strings(level_1_row,level_1_col);
    level_2_output = strings(level_2_row,level_2_col);
    level_3_output = strings(level_3_row,level_3_col);
    level_4_output = strings(level_4_row,level_4_col);
    if(temp == begin_frame)     %初始化
        ref_image = image_r;pre_frame_cout = 0;
        data_change_pix = zeros(row,col);level_0 = zeros(row_node_0,col_node_0);
        for i = 1:row_node_0
           for j = 1:col_node_0
               level_0_output(i,j) = string('0');
           end
        end
        for i = 1:level_1_row
           for j = 1:level_1_col
               level_1_output(i,j) = string('0');
           end
        end
        for i = 1:level_2_row
           for j = 1:level_2_col
               level_2_output(i,j) = string('0');
           end
        end
        for i = 1:level_3_row
           for j = 1:level_3_col
               level_3_output(i,j) = string('0');
           end
        end
        for i = 1:level_4_row
           for j = 1:level_4_col
               level_4_output(i,j) = string('0');
           end
        end
%         image_old = image_r;
    else
        for i=1:row
            for j=1:col
                data_pre_pix(i,j) = abs(image_r(i,j) - image_old(i,j));
                data_ref_pix(i,j) = abs(image_r(i,j) - ref_image(i,j));
            end
        end
        for i=1:row
            for j=1:col
                if(data_ref_pix(i,j) >= pix_gate_H)
                    data_change_pix(i,j) = 1;
                else
                    data_change_pix(i,j) = 0;
                end
                if(data_pre_pix(i,j) >= pix_gate)
                    pre_change_pix(i,j) = 1;
                else
                    pre_change_pix(i,j) = 0;
                end
            end
        end
        pre_pix_cout = 0;
        for i = 1:1:row
            for j=1:1:col
                if(pre_change_pix(i,j) ~= 0 || data_change_pix(i,j) ~= 0)
                    pre_pix_cout = pre_pix_cout + 1;
                end
            end
        end
        if(pre_pix_cout < 50)
            pre_frame_cout = pre_frame_cout + 1;
%             fprintf('pre_frame_cout: %d \n',pre_frame_cout);
        else
            pre_frame_cout = 0;
%             fprintf('pre_pix_cout: %d \n',pre_pix_cout);
        end
        if(pre_frame_cout >= 10)
            ref_image = image_r;
            pre_frame_cout = 0;
%             fprintf('%d video %d frame out\n',ramdom_obj_num,temp);
        end
        for i = 1:row_node_0
           for j = 1:col_node_0
               data_pix_change_cout = 0;
               for m = 1:single_fix_row
                  for n = 1:single_fix_col
                      data_pix_change_cout = data_pix_change_cout + data_change_pix(single_fix_row*(i-1)+m,single_fix_col*(j-1)+n);
                  end
               end
               if(level_0(i,j) == 0)
                   if(data_pix_change_cout >= pix_change_cout_gate_H)
                       level_0(i,j) = 1;
                   else
                       level_0(i,j) = 0;
                   end
               else
                   if(data_pix_change_cout < pix_change_cout_gate_L)
                       level_0(i,j) = 0;
                   else
                       level_0(i,j) = 1;
                   end
               end
           end
        end
        for i = 1:row_node_0
           for j = 1:col_node_0
               level_0_output(i,j) = string(num2str(level_0(i,j)));
           end
        end
        for i = 1:1:level_1_row
           for j = 1:1:level_1_col
               if(level_0_output(2*(i-1)+1,2*(j-1)+1) == '0' && level_0_output(2*(i-1)+1,2*j) == '0' && level_0_output(2*i,2*(j-1)+1) == '0' && level_0_output(2*i,2*j) == '0')
                   level_1_output(i,j) = string('0');
               else
                   level_1_output(i,j) = string('1');
               end
           end
        end
        for i = 1:1:level_2_row
           for j = 1:1:level_2_col
               if(level_1_output(2*(i-1)+1,2*(j-1)+1) == '0' && level_1_output(2*(i-1)+1,2*j) == '0' && level_1_output(2*i,2*(j-1)+1) == '0' && level_1_output(2*i,2*j) == '0')
                   level_2_output(i,j) = string('0');
               else
                   level_2_output(i,j) = string('1');
               end
           end
        end
        for i = 1:1:level_3_row
           for j = 1:1:level_3_col
               if(level_2_output(2*(i-1)+1,2*(j-1)+1) == '0' && level_2_output(2*(i-1)+1,2*j) == '0' && level_2_output(2*i,2*(j-1)+1) == '0' && level_2_output(2*i,2*j) == '0')
                   level_3_output(i,j) = string('0');
               else
                   level_3_output(i,j) = string('1');
               end
           end
        end
        for i = 1:1:level_4_row
           for j = 1:1:level_4_col
               if(level_3_output(2*(i-1)+1,2*(j-1)+1) == '0' && level_3_output(2*(i-1)+1,2*j) == '0' && level_3_output(2*i,2*(j-1)+1) == '0' && level_3_output(2*i,2*j) == '0')
                   level_4_output(i,j) = string('0');
               else
                   level_4_output(i,j) = string('1');
               end
           end
        end
    end
%     write_level_0_output(temp,:) = out_0(row_node_0,col_node_0,level_0_output,1024);
    write_level_0_output(temp,:) = out_0(row_node_0,col_node_0,level_0_output,256);
%     write_level_1_output(temp,:) = out_0(level_1_row,level_1_col,level_1_output,64);
%     write_level_2_output(temp,:) = out_0(level_2_row,level_2_col,level_2_output,16);
    write_level_3_output(temp,:) = out_0(level_3_row,level_3_col,level_3_output,4);
    write_level_4_output(temp,:) = out_0(level_4_row,level_4_col,level_4_output,1);
    imwrite(show,strcat('./pic/',sprintf('%05d.jpg',temp_all+temp)),'jpg');% 保存帧
end
% xlswrite('D:\document\Thorium\plan_b_new_matlab_devide\output\input_all.xlsx',write_level_0_output,num2str(ramdom_obj_num),'A1');
% xlswrite('D:\document\Thorium\plan_b_new_matlab_devide\output\input_all_64.xlsx',write_level_1_output,num2str(ramdom_obj_num),'A1');
% xlswrite('D:\document\Thorium\plan_b_new_matlab_devide\output\input_all_16.xlsx',write_level_2_output,num2str(ramdom_obj_num),'A1');
xlswrite('.\output\input_all_4.xlsx',write_level_3_output,num2str(ramdom_obj_num),'A1');
xlswrite('.\output\input_all.xlsx',write_level_0_output,num2str(ramdom_obj_num),'A1');
xlswrite('.\output\input_all_1.xlsx',write_level_4_output,num2str(ramdom_obj_num),'A1');
ramdom_cout = ramdom_cout + 1;
temp_all = temp_all + end_frame;
end


% pic2video(pic_path,video_path_2,strcat('ramdom_',num2str(ramdom_cout)));
delete(strcat(pic_path,'\*.jpg'))
