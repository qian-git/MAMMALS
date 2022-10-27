clc;clear;
% excel_name = {'work822','work822 (2)','work822 (3)','work822 (4)','work822 (5)','work822 (6)','work822 (7)','work822 (8)','work822 (9)','work822 (10)','work822 (11)','work822 (12)','work822 (13)','work822 (14)','work822 (15)','work822 (16)','work822 (17)'};
excel_name = {'work825_rand','work824 (2)','work824 (3)','work824 (4)','work824 (5)','work824 (6)','work824 (7)','work824 (8)','work824 (9)','work824 (10)','work824 (11)','work824 (12)','work824 (13)','work824 (14)','work824 (15)','work824 (16)','work824 (17)','work824 (18)','work824 (19)','work824 (20)','work824 (21)','work824 (22)','work824 (23)','work824 (24)','work824 (25)','work824 (26)','work824 (27)','work824 (28)','work824 (29)','work824 (30)','work824 (31)','work824 (32)','work824 (33)','work824 (34)','work824 (35)','work824 (36)','work824 (37)','work824 (38)','work824 (39)','work824 (40)','work824 (41)','work824 (42)','work824 (43)','work824 (44)','work824 (45)','work824 (46)','work824 (47)','work824 (48)','work824 (49)','work824 (50)','work824 (51)','work824 (52)','work824 (53)','work824 (54)','work824 (55)','work824 (56)','work824 (57)','work824 (58)','work824 (59)','work824 (60)','work824 (61)','work824 (62)','work824 (63)','work824 (64)','work824 (65)','work824 (66)','work824 (67)','work824 (68)','work824 (69)','work824 (70)','work824 (71)','work824 (72)','work824 (73)','work824 (74)','work824 (75)','work824 (76)','work824 (77)','work824 (78)','work824 (79)','work824 (80)','work824 (81)'};
% all_video = 17;
all_video = 40;
excel_cnt = 1;
% all_out_count = [];all_out_frame_count = [];
while(excel_cnt <= all_video)

input_path = strcat('.\output\825\',excel_name{excel_cnt},'.xlsx');
output_path1 = strcat('.\output\origin_data\825\run_excel_data_',excel_name{excel_cnt},'.xlsx');
output_path2 = strcat('.\output\origin_data\825\run_excel_frame_',excel_name{excel_cnt},'.xlsx');
output_path3 = '.\output\origin_data\825\run_excel_data_all.xlsx';
output_path4 = '.\output\origin_data\825\run_excel_frame_all.xlsx';
excel_cnt = excel_cnt + 1;
[out1_frame,out1_data,~] = xlsread(input_path,'level_1_output');
[~,out2_data,~] = xlsread(input_path,'level_2_output');
[~,out3_data,~] = xlsread(input_path,'level_3_output');
[~,out4_data,~] = xlsread(input_path,'level_4_output');
% excel_data = importdata('.\output\work811 (4).xlsx','level_1_output');
[max_line,~] = size(out1_frame);
max_frame = out1_frame(max_line,2);
[~,out1_col] = size(out1_data);
[~,out2_col] = size(out2_data);
[~,out3_col] = size(out3_data);
out4_col = 1;
out_count = zeros(max_line,23);
if(excel_cnt == 2)
    all_out_count = zeros(max_line,all_video+2);
    all_out_frame_count = zeros(max_frame,all_video+2);
end
out1_x = 0;out1_normal = 0;out1_zero = 64;
out2_x = 0;out2_normal = 0;out2_zero = 16;
out3_x = 0;out3_normal = 0;out3_zero = 4;
out4_x = 0;out4_normal = 0;out4_zero = 1;
out1_state_cnt = strings(1,out1_col);out1_state = zeros(1,out1_col);
out2_state_cnt = strings(1,out2_col);out2_state = zeros(1,out2_col);
out3_state_cnt = strings(1,out3_col);out3_state = zeros(1,out3_col);
out4_state_cnt = strings(1,1);out4_state = 0;


out_frame_count = zeros(max_frame,23);
out1_frame_x = 0;out1_frame_normal = 0;out1_frame_zero = 64;
out2_frame_x = 0;out2_frame_normal = 0;out2_frame_zero = 16;
out3_frame_x = 0;out3_frame_normal = 0;out3_frame_zero = 4;
out4_frame_x = 0;out4_frame_normal = 0;out4_frame_zero = 1;
out1_frame_state_cnt = strings(1,out1_col);out1_frame_state = zeros(1,out1_col);
out2_frame_state_cnt = strings(1,out2_col);out2_frame_state = zeros(1,out2_col);
out3_frame_state_cnt = strings(1,out3_col);out3_frame_state = zeros(1,out3_col);
out4_frame_state_cnt = strings(1,1);out4_frame_state = 0;
% max_frame
for i = 1:1:max_line
    now_video = out1_frame(i,2);
    if(i == max_line)
        next_video = 999;
    else
        next_video = out1_frame(i+1,2);
    end
    for j = 1:1:out1_col
        if(j ~= 9 && j ~= 18 && j ~= 27 && j ~= 36 && j ~= 45 && j ~= 54 && j ~= 63)
            if(out1_frame_state_cnt(1,j) ~= 'X')
                if(out1_frame_state_cnt(1,j) == '0' || out1_frame_state_cnt(1,j) == '')
                    out1_frame_state_cnt(1,j) = out1_data{i,j};
                else
                    if(out1_data{i,j} ~= '0')
                        out1_frame_state_cnt(1,j) = out1_data{i,j};
%                     else
                    end
                end
%             else
            end
        end
    end
    for j = 1:1:out2_col
        if(j ~= 5 && j ~= 10 && j ~= 15)
            if(out2_frame_state_cnt(1,j) ~= 'X')
                if(out2_frame_state_cnt(1,j) == '0' || out2_frame_state_cnt(1,j) == '')
                    out2_frame_state_cnt(1,j) = out2_data{i,j};
                else
                    if(out2_data{i,j} ~= '0')
                        out2_frame_state_cnt(1,j) = out2_data{i,j};
%                     else
                    end
                end
%             else
            end
        end
    end
    for j = 1:1:out3_col
        if(j ~= 3)
            if(out3_frame_state_cnt(1,j) ~= 'X')
                if(out3_frame_state_cnt(1,j) == '0' || out3_frame_state_cnt(1,j) == '')
                    out3_frame_state_cnt(1,j) = out3_data{i,j};
                else
                    if(out3_data{i,j} ~= '0')
                        out3_frame_state_cnt(1,j) = out3_data{i,j};
%                     else
                    end
                end
%             else
            end
        end
    end
    if(out4_frame_state_cnt ~= 'X')
        if(out4_frame_state_cnt == '0' || out4_frame_state_cnt == string(''))
            out4_frame_state_cnt = out4_data{i,1};
        else
            if(out4_data{i,1} ~= '0')
                out4_frame_state_cnt = out4_data{i,1};
%                     else
            end
        end
%             else
    end
    
    if(now_video ~= next_video)
        for j = 1:1:out1_col
            if(j ~= 9 && j ~= 18 && j ~= 27 && j ~= 36 && j ~= 45 && j ~= 54 && j ~= 63)
                if(out1_frame_state_cnt(1,j) ~= '0' && out1_frame_state_cnt(1,j) ~= '')
                    if(out1_frame_state_cnt(1,j) == 'X')
                        out1_frame_x = out1_frame_x + 1;
                    else
                        out1_frame_normal = out1_frame_normal + 1;
                    end
                    if(out1_frame_state(1,j) == 0)
                        out1_frame_state(1,j) = 1;
                        out1_frame_zero = out1_frame_zero - 1;
                    end
                end
            end
        end
        out1_frame_state_cnt = strings(1,out1_col);
        out_frame_count(out1_frame(i,2),(3:5)) = [out1_frame_zero,out1_frame_normal,out1_frame_x];
        out_frame_count(out1_frame(i,2),(15:16)) = [(out1_frame_normal+out1_frame_x),out1_frame_normal/(out1_frame_normal+out1_frame_x)];
        for j = 1:1:out2_col
            if(j ~= 5 && j ~= 10 && j ~= 15)
                if(out2_frame_state_cnt(1,j) ~= '0' && out2_frame_state_cnt(1,j) ~= '')
                    if(out2_frame_state_cnt(1,j) == 'X')
                        out2_frame_x = out2_frame_x + 1;
                    else
                        out2_frame_normal = out2_frame_normal + 1;
                    end
                    if(out2_frame_state(1,j) == 0)
                        out2_frame_state(1,j) = 1;
                        out2_frame_zero = out2_frame_zero - 1;
                    end
                end
            end
        end
        out2_frame_state_cnt = strings(1,out2_col);
        out_frame_count(out1_frame(i,2),(6:8)) = [out2_frame_zero,out2_frame_normal,out2_frame_x];
        out_frame_count(out1_frame(i,2),(17:18)) = [(out2_frame_normal+out2_frame_x),out2_frame_normal/(out2_frame_normal+out2_frame_x)];
        for j = 1:1:out3_col
            if(j ~= 3)
                if(out3_frame_state_cnt(1,j) ~= '0' && out3_frame_state_cnt(1,j) ~= '')
                    if(out3_frame_state_cnt(1,j) == 'X')
                        out3_frame_x = out3_frame_x + 1;
                    else
                        out3_frame_normal = out3_frame_normal + 1;
                    end
                    if(out3_frame_state(1,j) == 0)
                        out3_frame_state(1,j) = 1;
                        out3_frame_zero = out3_frame_zero - 1;
                    end
                end
            end
        end
        out3_frame_state_cnt = strings(1,out3_col);
        out_frame_count(out1_frame(i,2),(9:11)) = [out3_frame_zero,out3_frame_normal,out3_frame_x];
        out_frame_count(out1_frame(i,2),(19:20)) = [(out3_frame_normal+out3_frame_x),out3_frame_normal/(out3_frame_normal+out3_frame_x)];
        if(out4_frame_state_cnt ~= '0' && out4_frame_state_cnt ~= string(''))
            if(out4_frame_state_cnt == 'X')
                out4_frame_x = 1;
            else
                out4_frame_normal = 1;
            end
            if(out4_frame_state == 0)
                out4_frame_state = 1;
                out4_frame_zero = out4_frame_zero - 1;
            end
        end
        out4_frame_state_cnt = strings(1,out4_col);
        out_frame_count(out1_frame(i,2),(12:14)) = [out4_frame_zero,out4_frame_normal,out4_frame_x];
        all_frame_normal = out1_frame_normal + out2_frame_normal + out3_frame_normal + out4_frame_normal;
        all_frame_zero = out4_frame_zero + out3_frame_zero + out2_frame_zero + out1_frame_zero;
        all_frame_x = out1_frame_x + out2_frame_x + out3_frame_x + out4_frame_x;
%         out_frame_count(out1_frame(i,2),(21:23)) = [all_frame_normal,all_frame_x,(85-all_frame_zero-all_frame_x)/(85-all_frame_zero)];
        out_frame_count(out1_frame(i,2),(21:23)) = [all_frame_normal,all_frame_x,all_frame_normal/(all_frame_normal+all_frame_x)];
        out1_frame_x = 0;out1_frame_normal = 0;
        out2_frame_x = 0;out2_frame_normal = 0;
        out3_frame_x = 0;out3_frame_normal = 0;
        out4_frame_x = 0;out4_frame_normal = 0;
        out_frame_count(out1_frame(i,2),1) = out1_frame(i,2);out_frame_count(out1_frame(i,2),2) = out1_frame(i,1);
    end
    
    
    
    
    
    
    for j = 1:1:out1_col
        if(j ~= 9 && j ~= 18 && j ~= 27 && j ~= 36 && j ~= 45 && j ~= 54 && j ~= 63)
            if(out1_state_cnt(1,j) == '0' || out1_state_cnt(1,j) == '')
                if(out1_data{i,j} ~= '0')
                    out1_state_cnt(1,j) = out1_data{i,j};
                end
            else
                if(out1_data{i,j} == '0')
                    if(out1_state_cnt(1,j) == 'X')
                        if(out1_state(1,j) == 1)
                            out1_normal = out1_normal - 1;out1_x = out1_x + 1;
%                         elseif(out1_state(1,j) == -1)
%                             out1_normal = out1_normal;out1_x = out1_x;
                        elseif(out1_state(1,j) == 0)
                            out1_x = out1_x + 1;out1_zero = out1_zero - 1;
                        end
                        out1_state(1,j) = -1;
                        out1_state_cnt(1,j) = '0';
%                     elseif(out1_state_cnt(1,j) == '0')
                    elseif(out1_state_cnt(1,j) ~= '0' && out1_state_cnt(1,j) ~= '')
                        if(out1_state(1,j) == -1)
                            out1_normal = out1_normal + 1;out1_x = out1_x - 1;
%                         elseif(out1_state(1,j) == 1)
%                             out1_normal = out1_normal;out1_x = out1_x;
                        elseif(out1_state(1,j) == 0)
                            out1_normal = out1_normal + 1;out1_zero = out1_zero - 1;
                        end
                        out1_state(1,j) = 1;
                        out1_state_cnt(1,j) = '0';
                    end
                else
                    if(out1_state_cnt(1,j) ~= 'X')
                        out1_state_cnt(1,j) = out1_data{i,j};
                    end
                end
            end
        end
        out_count(i,(3:5)) = [out1_zero,out1_normal,out1_x];
        out_count(i,(15:16)) = [(out1_normal+out1_x),out1_normal/(out1_normal+out1_x)];
    end
    
    for j = 1:1:out2_col
        if(j ~= 5 && j ~= 10 && j ~= 15)
            if(out2_state_cnt(1,j) == '0' || out2_state_cnt(1,j) == '')
                if(out2_data{i,j} ~= '0')
                    out2_state_cnt(1,j) = out2_data{i,j};
                end
            else
                if(out2_data{i,j} == '0')
                    if(out2_state_cnt(1,j) == 'X')
                        if(out2_state(1,j) == 1)
                            out2_normal = out2_normal - 1;out2_x = out2_x + 1;
%                         elseif(out1_state(1,j) == -1)
%                             out1_normal = out1_normal;out1_x = out1_x;
                        elseif(out2_state(1,j) == 0)
                            out2_x = out2_x + 1;out2_zero = out2_zero - 1;
                        end
                        out2_state(1,j) = -1;
                        out2_state_cnt(1,j) = '0';
%                     elseif(out1_state_cnt(1,j) == '0')
                    elseif(out2_state_cnt(1,j) ~= '0' && out2_state_cnt(1,j) ~= '')
                        if(out2_state(1,j) == -1)
                            out2_normal = out2_normal + 1;out2_x = out2_x - 1;
%                         elseif(out1_state(1,j) == 1)
%                             out1_normal = out1_normal;out1_x = out1_x;
                        elseif(out2_state(1,j) == 0)
                            out2_normal = out2_normal + 1;out2_zero = out2_zero - 1;
                        end
                        out2_state(1,j) = 1;
                        out2_state_cnt(1,j) = '0';
                    end
                else
                    if(out2_state_cnt(1,j) ~= 'X')
                        out2_state_cnt(1,j) = out2_data{i,j};
                    end
                end
            end
        end
        out_count(i,(6:8)) = [out2_zero,out2_normal,out2_x];
        out_count(i,(17:18)) = [(out2_normal+out2_x),out2_normal/(out2_normal+out2_x)];
    end
    
    for j = 1:1:out3_col
        if(j ~= 3)
            if(out3_state_cnt(1,j) == '0' || out3_state_cnt(1,j) == '')
                if(out3_data{i,j} ~= '0')
                    out3_state_cnt(1,j) = out3_data{i,j};
                end
            else
                if(out3_data{i,j} == '0')
                    if(out3_state_cnt(1,j) == 'X')
                        if(out3_state(1,j) == 1)
                            out3_normal = out3_normal - 1;out3_x = out3_x + 1;
%                         elseif(out1_state(1,j) == -1)
%                             out1_normal = out1_normal;out1_x = out1_x;
                        elseif(out3_state(1,j) == 0)
                            out3_x = out3_x + 1;out3_zero = out3_zero - 1;
                        end
                        out3_state(1,j) = -1;
                        out3_state_cnt(1,j) = '0';
%                     elseif(out1_state_cnt(1,j) == '0')
                    elseif(out3_state_cnt(1,j) ~= '0' && out3_state_cnt(1,j) ~= '')
                        if(out3_state(1,j) == -1)
                            out3_normal = out3_normal + 1;out3_x = out3_x - 1;
%                         elseif(out1_state(1,j) == 1)
%                             out1_normal = out1_normal;out1_x = out1_x;
                        elseif(out3_state(1,j) == 0)
                            out3_normal = out3_normal + 1;out3_zero = out3_zero - 1;
                        end
                        out3_state(1,j) = 1;
                        out3_state_cnt(1,j) = '0';
                    end
                else
                    if(out3_state_cnt(1,j) ~= 'X')
                        out3_state_cnt(1,j) = out3_data{i,j};
                    end
                end
            end
        end
        out_count(i,(9:11)) = [out3_zero,out3_normal,out3_x];
        out_count(i,(19:20)) = [(out3_normal+out3_x),out3_normal/(out3_normal+out3_x)];
    end
    
    if(out4_state_cnt == '0' || out4_state_cnt == string(''))
        if(out4_data{i,1} ~= '0')
            out4_state_cnt = out4_data{i,1};
        end
    else
        if(out4_data{i,1} == '0')
            if(out4_state_cnt == 'X')
                if(out4_state == 1)
                    out4_normal = 0;out4_x = 1;
%                         elseif(out1_state(1,j) == -1)
%                             out1_normal = out1_normal;out1_x = out1_x;
                elseif(out4_state == 0)
                    out4_x = 1;out4_zero = 0;
                end
                out4_state = -1;
                out4_state_cnt = '0';
%                     elseif(out1_state_cnt(1,j) == '0')
            elseif(out4_state_cnt ~= '0' && out4_state_cnt ~= string(''))
                if(out4_state == -1)
                    out4_normal = 1;out4_x = 0;
%                         elseif(out1_state(1,j) == 1)
%                             out1_normal = out1_normal;out1_x = out1_x;
                elseif(out4_state == 0)
                    out4_normal = 1;out4_zero = 0;
                end
                out4_state = 1;
                out4_state_cnt = '0';
            end
        else
            if(out4_state_cnt ~= 'X')
                out4_state_cnt = out4_data{i,1};
            end
        end
    end
    out_count(i,(12:14)) = [out4_zero,out4_normal,out4_x];
        
    all_normal = out_count(i,4)+out_count(i,7)+out_count(i,10)+out_count(i,13);
    all_zero = out4_frame_zero + out3_frame_zero + out2_frame_zero + out1_frame_zero;
    all_x = out_count(i,5)+out_count(i,8)+out_count(i,11)+out_count(i,14);
    out_count(i,(21:23)) = [all_normal,all_x,(85-all_zero-all_x)/(85-all_zero)];
    out_count(i,1) = i;out_count(i,2) = out1_frame(i,1);
end
xlswrite(output_path1,out_count,'sheet1','A1');
xlswrite(output_path2,out_frame_count,'sheet1','A1');
all_out_count(:,excel_cnt+1) = out_count(:,23);all_out_frame_count(:,excel_cnt+1) = out_frame_count(:,23);
end
all_out_count(:,(1:2)) = out_count(:,(1:2));all_out_frame_count(:,(1:2)) = out_frame_count(:,(1:2));
xlswrite(output_path3,all_out_count,'sheet1','A1');
xlswrite(output_path4,all_out_frame_count,'sheet1','A1');


