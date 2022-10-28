clear;clc
per_flag = [0.65,0.6,0.55,0.5;0.65,0.6,0.55,0.55;0.65,0.6,0.55,0.6;0.65,0.6,0.55,0.65;0.65,0.6,0.55,0.7;0.65,0.6,0.5,0.5;0.65,0.6,0.6,0.5;0.65,0.6,0.65,0.5;0.65,0.6,0.7,0.5;0.65,0.5,0.55,0.5;0.65,0.55,0.55,0.5;0.65,0.65,0.55,0.5;0.65,0.7,0.55,0.5;0.5,0.6,0.55,0.5;0.55,0.6,0.55,0.5;0.6,0.6,0.55,0.5;0.7,0.6,0.55,0.5;];
out_put = {'work91_random','work822 (2)','work822 (3)','work822 (4)','work822 (5)','work822 (6)','work822 (7)','work822 (8)','work822 (9)','work822 (10)','work822 (11)','work822 (12)','work822 (13)','work822 (14)','work822 (15)','work822 (16)','work822 (17)'};

% per_flag = [0.5,0.5,0.5,0.5;0.5,0.5,0.5,0.6;0.5,0.5,0.5,0.7;0.5,0.5,0.6,0.5;0.5,0.5,0.6,0.6;0.5,0.5,0.6,0.7;0.5,0.5,0.7,0.5;0.5,0.5,0.7,0.6;0.5,0.5,0.7,0.7;0.5,0.6,0.5,0.5;0.5,0.6,0.5,0.6;0.5,0.6,0.5,0.7;0.5,0.6,0.6,0.5;0.5,0.6,0.6,0.6;0.5,0.6,0.6,0.7;0.5,0.6,0.7,0.5;0.5,0.6,0.7,0.6;0.5,0.6,0.7,0.7;0.5,0.7,0.5,0.5;0.5,0.7,0.5,0.6;0.5,0.7,0.5,0.7;0.5,0.7,0.6,0.5;0.5,0.7,0.6,0.6;0.5,0.7,0.6,0.7;0.5,0.7,0.7,0.5;0.5,0.7,0.7,0.6;0.5,0.7,0.7,0.7;0.6,0.5,0.5,0.5;0.6,0.5,0.5,0.6;0.6,0.5,0.5,0.7;0.6,0.5,0.6,0.5;0.6,0.5,0.6,0.6;0.6,0.5,0.6,0.7;0.6,0.5,0.7,0.5;0.6,0.5,0.7,0.6;0.6,0.5,0.7,0.7;0.6,0.6,0.5,0.5;0.6,0.6,0.5,0.6;0.6,0.6,0.5,0.7;0.6,0.6,0.6,0.5;0.6,0.6,0.6,0.6;0.6,0.6,0.6,0.7;0.6,0.6,0.7,0.5;0.6,0.6,0.7,0.6;0.6,0.6,0.7,0.7;0.6,0.7,0.5,0.5;0.6,0.7,0.5,0.6;0.6,0.7,0.5,0.7;0.6,0.7,0.6,0.5;0.6,0.7,0.6,0.6;0.6,0.7,0.6,0.7;0.6,0.7,0.7,0.5;0.6,0.7,0.7,0.6;0.6,0.7,0.7,0.7;0.7,0.5,0.5,0.5;0.7,0.5,0.5,0.6;0.7,0.5,0.5,0.7;0.7,0.5,0.6,0.5;0.7,0.5,0.6,0.6;0.7,0.5,0.6,0.7;0.7,0.5,0.7,0.5;0.7,0.5,0.7,0.6;0.7,0.5,0.7,0.7;0.7,0.6,0.5,0.5;0.7,0.6,0.5,0.6;0.7,0.6,0.5,0.7;0.7,0.6,0.6,0.5;0.7,0.6,0.6,0.6;0.7,0.6,0.6,0.7;0.7,0.6,0.7,0.5;0.7,0.6,0.7,0.6;0.7,0.6,0.7,0.7;0.7,0.7,0.5,0.5;0.7,0.7,0.5,0.6;0.7,0.7,0.5,0.7;0.7,0.7,0.6,0.5;0.7,0.7,0.6,0.6;0.7,0.7,0.6,0.7;0.7,0.7,0.7,0.5;0.7,0.7,0.7,0.6;0.7,0.7,0.7,0.7];
% out_put = {'work824 (1)','work824 (2)','work824 (3)','work824 (4)','work824 (5)','work824 (6)','work824 (7)','work824 (8)','work824 (9)','work824 (10)','work824 (11)','work824 (12)','work824 (13)','work824 (14)','work824 (15)','work824 (16)','work824 (17)','work824 (18)','work824 (19)','work824 (20)','work824 (21)','work824 (22)','work824 (23)','work824 (24)','work824 (25)','work824 (26)','work824 (27)','work824 (28)','work824 (29)','work824 (30)','work824 (31)','work824 (32)','work824 (33)','work824 (34)','work824 (35)','work824 (36)','work824 (37)','work824 (38)','work824 (39)','work824 (40)','work824 (41)','work824 (42)','work824 (43)','work824 (44)','work824 (45)','work824 (46)','work824 (47)','work824 (48)','work824 (49)','work824 (50)','work824 (51)','work824 (52)','work824 (53)','work824 (54)','work824 (55)','work824 (56)','work824 (57)','work824 (58)','work824 (59)','work824 (60)','work824 (61)','work824 (62)','work824 (63)','work824 (64)','work824 (65)','work824 (66)','work824 (67)','work824 (68)','work824 (69)','work824 (70)','work824 (71)','work824 (72)','work824 (73)','work824 (74)','work824 (75)','work824 (76)','work824 (77)','work824 (78)','work824 (79)','work824 (80)','work824 (81)'};

for excel_out_cnt = 1:1:1
% clear;clc;

temp_most = 85000;

write_level_1_series = cell(temp_most,73);write_level_1_output = cell(temp_most,73);write_level_1_model = cell(temp_most,357);
write_level_2_series = cell(temp_most,21);write_level_2_output = cell(temp_most,21);write_level_2_model = cell(temp_most,97);
write_level_3_series = cell(temp_most,7);write_level_3_output = cell(temp_most,7);write_level_3_model = cell(temp_most,27);
write_level_4_series = cell(temp_most,3);write_level_4_output = cell(temp_most,3);write_level_4_model = cell(temp_most,7);
% write_level_1_all_model = cell(15,72);write_level_2_all_model = cell(15,20);write_level_3_all_model = cell(15,6);write_level_4_all_model = cell(15,2);
write_level2_1_feed = cell(temp_most,73);write_level3_2_feed = cell(temp_most,21);write_level4_3_feed = cell(temp_most,7);
row = 368;col = 368;single_fix_row = 23;single_fix_col = 23;
% row = 352;col = 352;single_fix_row = 11;single_fix_col = 11;
row_node_0 = row/single_fix_row;col_node_0 = col/single_fix_col;
level_1_row = row_node_0/2; level_2_row = level_1_row/2; level_3_row = level_2_row/2; level_4_row = level_3_row/2;
level_1_col = col_node_0/2; level_2_col = level_1_col/2; level_3_col = level_2_col/2; level_4_col = level_3_col/2;
level_1_model = cell(level_1_row,level_1_col); level_1_series = level_1_model; data_state_1 = level_1_model;
level_2_model = cell(level_2_row,level_2_col); level_2_series = level_2_model; data_state_2 = level_2_model;
level_3_model = cell(level_3_row,level_3_col); level_3_series = level_3_model; data_state_3 = level_3_model;
level_4_model = cell(level_4_row,level_4_col); level_4_series = level_4_model; data_state_4 = level_4_model;
level_1_model_more = level_1_model;
level_2_model_more = level_2_model;
level_3_model_more = level_3_model;
level_4_model_more = level_4_model;
level_1_model_cnt = level_1_model;
level_2_model_cnt = level_2_model;
level_3_model_cnt = level_3_model;
level_4_model_cnt = level_4_model;
level_1_output_buf = strings(level_1_row,level_1_col);
level_2_output_buf = strings(level_2_row,level_2_row);
level_3_output_buf = strings(level_3_row,level_3_row);
level_4_output_buf = strings(level_4_row,level_4_row);

from_2_to_1_feedback = strings(level_1_row,level_1_col);
from_3_to_2_feedback = strings(level_2_row,level_2_row);
from_4_to_3_feedback = strings(level_3_row,level_3_row);
zero_feedback = strings(level_4_row,level_4_row);

output_path = strcat('.\output\91\',out_put{excel_out_cnt},'.xlsx');
% per_flag_1 = 0.65;per_flag_2 = 0.6;per_flag_3 = 0.55;per_flag_4 = 0.55;
per_flag_1 = per_flag(excel_out_cnt,1);per_flag_2 = per_flag(excel_out_cnt,2);per_flag_3 = per_flag(excel_out_cnt,3);per_flag_4 = per_flag(excel_out_cnt,4);
%model: level_1_model{i,j}{1}{1,2}:
%{i.j}means different area，{1}means which model，{1,2}means counter
for i = 1:1:level_1_row     %level_1 initial
    for j = 1:1:level_1_col
        level_1_model{i,j} = {};
        level_1_model_more{i,j} = {};
        level_1_model_cnt{i,j} = zeros(1,15);
        for k = 1:1:15
            level_1_model{i,j}{k} = {};
            level_1_model_more{i,j}{k} = {};
            for l = 1:1:30
                level_1_model_more{i,j}{k}{l} = {};
            end
        end
        level_1_series{i,j} = {};
        data_state_1{i,j} = {};
        for k = 1:1:4
            data_state_1{i,j}{k} = string('0');
        end
    end
end
for i = 1:1:level_2_row     %level_2 initial
    for j = 1:1:level_2_col
        level_2_model{i,j} = {};
        level_2_model_more{i,j} = {};
        level_2_model_cnt{i,j} = zeros(1,15);
        for k = 1:1:15
            level_2_model{i,j}{k} = {};
            level_2_model_more{i,j}{k} = {};
            for l = 1:1:30
                level_2_model_more{i,j}{k}{l} = {};
            end
        end
        level_2_series{i,j} = {};
        data_state_2{i,j} = {};
        for k = 1:1:4
            data_state_2{i,j}{k} = string('0');
        end
    end
end
for i = 1:1:level_3_row     %level_3 initial
    for j = 1:1:level_3_col
        level_3_model{i,j} = {};
        level_3_model_more{i,j} = {};
        level_3_model_cnt{i,j} = zeros(1,15);
        for k = 1:1:15
            level_3_model{i,j}{k} = {};
            level_3_model_more{i,j}{k} = {};
            for l = 1:1:30
                level_3_model_more{i,j}{k}{l} = {};
            end
        end
        level_3_series{i,j} = {};
        data_state_3{i,j} = {};
        for k = 1:1:4
            data_state_3{i,j}{k} = string('0');
        end
    end
end
for i = 1:1:level_4_row     %level_4 initial
    for j = 1:1:level_4_col
        level_4_model{i,j} = {};
        level_4_model_more{i,j} = {};
        level_4_model_cnt{i,j} = zeros(1,15);
        for k = 1:1:15
            level_4_model{i,j}{k} = {};
            level_4_model_more{i,j}{k} = {};
            for l = 1:1:30
                level_4_model_more{i,j}{k}{l} = {};
            end
        end
        level_4_series{i,j} = {};
        data_state_4{i,j} = {};
        for k = 1:1:4
            data_state_4{i,j}{k} = string('0');
        end
    end
end
all_data_a_video = cell(1,14);
for i = 3:1:22
    [~,all_data_a_video{i},~] = xlsread('.\output\input_all.xlsx',num2str(i));
end
ramdom_cout = 1;temp_all = 0;temp_0 = 1;
% order_input_num = [5,8,10,13,5,8,10,13,5,8,10,13,5,8,10,13,5,8,10,13,5,8,10,13,4,6,12,4,6,12,3,7,9,11,14,14,4,6,12,4,6,12,3,7,9,11,14,14,4,6,12,4,6,12,3,7,9,11,14,14,5,4,3,14,8,6,7,10,9,13,12,11];
% order_input_num = [5,8,10,13,5,8,10,13,5,8,10,13,5,8,10,13,5,8,10,13,5,8,10,13,8,5,10,13,13,13,10,8,8,5,10];
% order_input_num = [5,8,10,13,5,8,10,13,5,8,10,13,5,8,10,13,4,6,12,4,6,12,4,6,12,4,6,12,3,7,9,11,3,7,9,11,3,7,9,11,3,7,9,11,14,14,14,14,5,8,10,13,4,6,12,3,7,9,11,14,5,8,10,13,4,6,12,3,7,9,11,14,5,8,10,13,4,6,12,3,7,9,11,14,5,8,10,13,4,6,12,3,7,9,11,14,5,8,10,13,4,6,12,3,7,9,11,14,5,8,10,13,4,6,12,3,7,9,11,14,5,8,10,13,4,6,12,3,7,9,11,14,5,8,10,13,4,6,12,3,7,9,11,14,5,8,10,13,4,6,12,3,7,9,11,14,5,8,10,13,4,6,12,3,7,9,11,14,5,8,10,13,4,6,12,3,7,9,11,14,5,8,10,13,4,6,12,3,7,9,11,14,5,8,10,13,4,6,12,3,7,9,11,14,5,8,10,13,4,6,12,3,7,9,11,14,5,8,10,13,4,6,12,3,7,9,11,14,5,8,10,13,4,6,12,3,7,9,11,14,5,8,10,13,4,6,12,3,7,9,11,14];
% order_input_num = [7,8,9,10,7,8,9,10,7,8,9,10,7,8,9,10,11,12,13,11,12,13,11,12,13,11,12,13,3,4,5,6,3,4,5,6,3,4,5,6,3,4,5,6,14,14,14,14,7,8,9,10,11,12,13,3,4,5,6,14,7,8,9,10,11,12,13,3,4,5,6,14,7,8,9,10,11,12,13,3,4,5,6,14,7,8,9,10,11,12,13,3,4,5,6,14,7,8,9,10,11,12,13,3,4,5,6,14,7,8,9,10,11,12,13,3,4,5,6,14,7,8,9,10,11,12,13,3,4,5,6,14,7,8,9,10,11,12,13,3,4,5,6,14,7,8,9,10,11,12,13,3,4,5,6,14,7,8,9,10,11,12,13,3,4,5,6,14,7,8,9,10,11,12,13,3,4,5,6,14,7,8,9,10,11,12,13,3,4,5,6,14,7,8,9,10,11,12,13,3,4,5,6,14,7,8,9,10,11,12,13,3,4,5,6,14,7,8,9,10,11,12,13,3,4,5,6,14,7,8,9,10,11,12,13,3,4,5,6,14,7,8,9,10,11,12,13,3,4,5,6,14];
% order_input_num = [7,8,9,10,7,8,9,10,7,8,9,10,7,8,9,10,11,12,13,11,12,13,11,12,13,11,12,13,3,4,5,6,3,4,5,6,3,4,5,6,3,4,5,6,14,14,14,14,13,10,5,3,12,9,4,8,6,11,14,7,13,10,5,3,12,9,4,8,6,11,14,7,13,10,5,3,12,9,4,8,6,11,14,7,13,10,5,3,12,9,4,8,6,11,14,7,13,10,5,3,12,9,4,8,6,11,14,7,13,10,5,3,12,9,4,8,6,11,14,7,13,10,5,3,12,9,4,8,6,11,14,7,13,10,5,3,12,9,4,8,6,11,14,7,13,10,5,3,12,9,4,8,6,11,14,7,13,10,5,3,12,9,4,8,6,11,14,7,13,10,5,3,12,9,4,8,6,11,14,7,13,10,5,3,12,9,4,8,6,11,14,7,13,10,5,3,12,9,4,8,6,11,14,7,13,10,5,3,12,9,4,8,6,11,14,7,13,10,5,3,12,9,4,8,6,11,14,7,13,10,5,3,12,9,4,8,6,11,14,17,16,19,15,20,18,21,22];


% order_input_num = [7,8,9,10,7,8,9,10,7,8,9,10,7,8,9,10,11,12,13,11,12,13,11,12,13,11,12,13,3,4,5,6,3,4,5,6,3,4,5,6,3,4,5,6,14,14,14,14,8,6,9,9,12,12,10,7,12,9,7,14,13,9,10,10,5,6,8,5,13,5,5,5,5,8,6,14,8,5,13,14,8,4,6,7,10,6,10,11,5,4,6,6,8,9,4,6,12,3,14,11,8,9,5,8,14,9,9,5,8,10,11,7,7,14,3,13,13,12,4,6,7,11,4,11,4,10,8,12,11,13,13,7,11,5,3,11,9,8,13,10,10,13,12,9,5,5,13,3,8,5,14,11,9,8,3,11,3,3,9,4,12,12,11,4,10,9,14,10,12,8,8,12,4,4,5,7,12,12,3,7,9,8,10,10,6,8,3,14,5,4,7,5,8,7,14,14,3,11,6,8,9,14,8,14,6,11,10,9,11,10,5,4,14,5,3,9,13,11,5,7,8,14,4,13,10,7,5,8,8,4,10,5,7,9,6,6,10,6,17,16,19,15,20,18,21,22];
% order_input_num = [7,8,9,10,7,8,9,10,7,8,9,10,7,8,9,10,11,12,13,11,12,13,11,12,13,11,12,13,8,10,8,9,11,7,13,13,7,8,7,11,11,12,8,13,10,7,8,9,13,7,9,11,12,7,12,7,9,3,8,13,11,10,3,6,12,7,13,10,5,7,8,8,7,3,11,7,4,10,3,10,8,5,11,6,9,13,7,5,4,7,7,4,6,3,13,9,12,7,7,9,9,8,9,4,11,10,6,6,6,4,6,12,5,3,8,4,7,4,10,6,9,10,10,10,6,3,9,5,12,6,10,6,7,9,12,5,13,11,3,12,10,9,6,6,3,8,10,9,7,13,6,13,3,7,10,10,8,9,11,11,6,9,12,9,8,12,10,4,8,3,7,12,3,13,4,7,5,4,7,6,4,8,5,6,9,9,7,7,7,6,4,4,3,11,8,10,11,5,5,3];   

% order_input_num = [10,13,9,3,9,6,8,7,4,7,11,13,10,13,4,10,7,9,5,7,6,6,7,4,8,11,6,8,4,9,8,6,12,6,8,5,11,6,8,8,12,13,3,13,9,3,5,6,7,11,13,9,13,11,8,12,11,4,11,9,7,12,3,4,13,7,8,12,6,10,11,5,9,8,9,8,8,6,12,13,11,13,8,4,10,5,12,13,4,6,11,7,8,3,9,9,11,3,11,5,8,13,13,13,6,11,5,12,10,4,9,13,12,11,10,5,3,8,4,4,7,10,13,6,8,13,4,11,4,12,8,13,11,10,3,5,5,3,11,12,6,4,10,12,10,4,7,10,8,13,5,12,7,4,3,11,7,7,6,6,5,8,13,7,13,4,13,11,12,9,4,8,10,3,3,6,13,8,12,7,12,8,12,4,5,10,6,3,7,6,7,4,5,9,9,4,13,3,5,8,11,4,13,7,3,10,6,11,13,10,8,4,6,8,3,6,9,4,4,10,9,9,13,9,6,8,12,13,12,6,11,13,10,8,6,9,6,13,7,13,10,10,13,13,12,4,12,8,6,8,12,8,5,6,5,6,5,12,7,3,6,12,6,11,8,4,8,6,10,11,7,5,4,6,9,11,10,6,4,5,10,3,8,13,12,9,11,11,10,10,6,9,9,11,3,5,13,11,9,10,11,6,10,3,8,8,12,5,13,13,6,9,8,8,6,6,3,7,5,8,10,4,12,13,12,8,10,8,7,3,13,3,8,7,8,13,12,3,11,8,7,12,12,13,5,12,6,7,11,7,7,4,10,11,6,6,11,13,10,3,8,9,8,4,6,13,11,13,6,5,10,6,7,12,12,7,11,6,6,6,3,13,10,5,8,11,7,5,10,11,10,9,11,8,6,3,9,4,5,4,8,3,8,3,7,4,9,12,3,5,5,6,7,4,7,10,8,6,10,10,4,7,13,9,9,11,5,10,6,9,9,7,5,13,7,8,9,10,7,4,10,13,7,10,12,8,9,8,4,4,4,7,13,9,13,3,6,13,3,4,11,12,9,8,13,11,10,11,12,13,13,13,6,3,12,4,3,11,8,6,9,12,10,7,9,5,5,5,5,13,10,12,7,4,11,12,6,4,13];

%830_f2l1
% order_input_num = [7,8,9,10,7,8,9,10,7,8,9,10,7,8,9,10,11,12,13,14,11,12,13,11,12,13,14,11,12,13,14,10,14,8,9,8,8,13,11,11,8,13,11,9,11,10,7,8,7,8,8,10,7,14,14,10,10,9,14,9,7,13,10,8,10,7,8,14,14,11,7,8,9,13,7,7,8,12,12,12,10,11,9,12,8,12,8,9,12,13,7,14,13,10,10,10,9,11,11,13,13,12,10,13,11,9,14,14,11,11,11,8,9,10,8,13,8,8,8,8,10,9,14,10,8,14,14,10,7,9,10,11,9,11,12,8,7,9,9,10,11,7,9,13,7,14,12,10,11,8,10,14,11,11,8,10,11,12,10,9,14,7,14,14,13,7,9,9,12,8,12,7,12,10,13,12,14,14,9,12,8,7,12,11,10,14,11,11,13,13,11,8,8,14,7,10,8,14,12,11,3,7,12,7,7,11,7,4,13,13,12,8,6,12,11,14,5,12,13,10,3,10,13,7,4,8,6,5,3,4,6,5,12,6,9,4,4,4,11,8,5,8,4,3,13,9,14,11,9,12,13,14,3,13,10,14,9,8,12,5,8,13,9,13,11,10,5,10,4,10,10,11,13,14,12,9,14,9,3,4,13,8,13,5,9,10,3,10,7,3,8,5,4,5,4,5,3,10,6,9,11,8,9,8,4,8,13,13,6,5,9,10,8,5,14,3,4,4,4,10,9,3,14,11,11,3,13,14,14,13,12,9,5,7,4,3,14,6,6,6,8,10,3,13,9,13,7,8,3,5,10,6,13,4,14,9,11,14,6,7,8,12,12,4,5,7,3,9,7,5,5,13,11,8,13,4,11,11,9,5,10,6,4,5,13,3,5,3,8,3,13,5,4,6,8,4,14,6,6,3,6,3,9,12,10,4,3,12,13,9,4,12,7,6,11,3,3,11,10,9,11,11,12,6,11,9,7,3,12,7,10,11,4,4,9,8,13,12,11,3,3,4,12,14,11,4,11,4,4,10,6,10,11,9,11,5,11,14,13,4,7,7,11,10,12,7,5,4,12,5,7,9,5,10,8,4,12,4,6,5,9,4,7,4,4,12,6,10,14,8,11,12,8,10,4,14,5,6,12,8];
%all_ramdom
order_input_num = [8,10,13,7,14,14,3,4,11,6,9,12,13,5,10,4,6,9,14,14,4,14,14,8,12,4,8,13,12,14,10,3,13,14,11,12,11,7,10,5,11,3,6,3,4,12,11,6,14,3,8,7,12,12,5,8,8,10,11,12,6,11,10,4,4,8,14,7,10,5,12,6,9,11,13,14,9,4,4,6,13,6,12,5,14,7,5,6,10,8,7,12,10,9,14,6,12,12,7,9,3,3,9,12,14,4,9,8,3,7,4,12,6,9,4,10,6,10,11,11,8,4,5,13,4,12,9,14,3,8,4,14,3,12,12,13,4,7,6,12,8,13,5,6,4,4,13,9,9,4,13,10,7,9,7,3,5,4,5,5,8,3,13,14,8,8,7,13,7,4,12,7,5,7,4,4,14,14,9,3,5,7,12,3,3,5,10,11,10,8,9,6,11,5,11,5,7,10,12,3,14,12,8,8,8,6,9,9,12,12,10,7,12,9,7,14,13,9,10,10,5,6,8,5,13,5,5,5,5,8,6,14,8,5,13,14,8,4,6,7,10,6,10,11,5,4,6,6,8,9,4,6,12,3,14,11,8,9,5,8,14,9,9,5,8,10,11,7,7,14,3,13,13,12,4,6,7,11,4,11,4,10,8,12,11,13,13,7,11,5,3,11,9,8,13,10,10,13,12,9,5,5,13,3,8,5,14,11,9,8,3,11,3,3,9,4,12,12,11,4,10,9,14,10,12,8,8,12,4,4,5,7,12,12,3,7,9,8,10,10,6,8,3,14,5,4,7,5,8,7,14,14,3,11,6,8,9,14,8,14,6,11,10,9,11,10,5,4,14,5,3,9,13,11,5,7,8,14,4,13,10,7,5,8,8,4,10,5,7,9,6,6,10,6,12,14,11,7,10,4,13,13,12,6,10,3,8,6,4,5,8,4,10,8,11,11,10,3,3,6,9,10,7,12,11,14,9,6,4,10,12,8,4,6,4,6,8,9,8,13,9,14,10,14,5,11,6,11,11,3,6,5,11,13,7,12,11,3,10,7,13,3,8,8,8,12,6,12,8,3,5,11,8,4,7,10,5,11,5,14,6,12,5,6,4,9,11,9,8,10,10,11,10,14,5,11,5,4,10,8];

[~,size_order] = size(order_input_num);
% ramdom_obj_num = 12;
while(ramdom_cout <= size_order)
% ramdom_obj_num = randi([3,obj_video_size(1)]);
ramdom_obj_num = order_input_num(ramdom_cout);

begin_frame = 1; [end_frame,~] = size(all_data_a_video{ramdom_obj_num});
for temp = begin_frame:1:end_frame
    level_0_output = strings(row_node_0,col_node_0);
%     level_000_output = strings(level_0_row,level_0_col);
%     level_1_output = strings(level_1_row,level_1_col);
%     level_2_output = strings(level_2_row,level_2_row);
%     level_3_output = strings(level_3_row,level_3_row);
%     level_4_output = strings(level_4_row,level_4_row);
    for i = 1:1:row_node_0
        for j = 1:1:col_node_0
            level_0_output(i,j) = all_data_a_video{ramdom_obj_num}{temp,row_node_0*(i-1)+j};
        end
    end
%     [ level_000_output,level_0_model,level_0_model_more,buffer_level0,level_0_series,data_state_0,~,series_full_0 ] = node_function( level_0_output,level_0_model,level_0_model_more,level_0_series,data_state_0,from_1_to_0_feedback,level_0_output_buf,per_flag_0 );%d第一层 8*8
    [ level_1_output,level_1_model,level_1_model_more,buffer_level1,level_1_series,data_state_1,~,series_full_1 ] = node_function( level_0_output,level_1_model,level_1_model_more,level_1_series,data_state_1,from_2_to_1_feedback,level_1_output_buf,per_flag_1 );%d第一层 8*8
%     [ level_1_output,level_1_model,level_1_model_more,buffer_level1,level_1_series,data_state_1,from_1_to_0_feedback,series_full_1 ] = node_function( level_000_output,level_1_model,level_1_model_more,level_1_series,data_state_1,from_2_to_1_feedback,level_1_output_buf,per_flag_1 );%d第一层 8*8
    [ level_2_output,level_2_model,level_2_model_more,buffer_level2,level_2_series,data_state_2,from_2_to_1_feedback,series_full_2 ] = node_function( level_1_output,level_2_model,level_2_model_more,level_2_series,data_state_2,from_3_to_2_feedback,level_2_output_buf,per_flag_2);%d第二层 4*4
    [ level_3_output,level_3_model,level_3_model_more,buffer_level3,level_3_series,data_state_3,from_3_to_2_feedback,series_full_3 ] = node_function( level_2_output,level_3_model,level_3_model_more,level_3_series,data_state_3,from_4_to_3_feedback,level_3_output_buf,per_flag_3 );%d第三层 2*2
    [ level_4_output,level_4_model,level_4_model_more,buffer_level4,level_4_series,data_state_4,from_4_to_3_feedback,series_full_4 ] = node_function( level_3_output,level_4_model,level_4_model_more,level_4_series,data_state_4,zero_feedback,level_4_output_buf,per_flag_4 );%d第四层 1个

    level_1_output_buf = level_1_output;
    level_2_output_buf = level_2_output;
    level_3_output_buf = level_3_output;
    level_4_output_buf = level_4_output;

    
    write_level_1_series(temp_0,:) = output_series(ramdom_obj_num,level_1_row,level_1_col,level_1_series,72,ramdom_cout);
    write_level_1_output(temp_0,:) = output_output(ramdom_obj_num,level_1_row,level_1_col,level_1_output,72,ramdom_cout);
    write_level_1_model(temp_0,:) = output_model(ramdom_obj_num,level_1_row,level_1_col,level_1_model,356,ramdom_cout);
    write_level2_1_feed(temp_0,:) = write_feed(ramdom_obj_num,level_1_row,level_1_col,from_2_to_1_feedback,72,ramdom_cout);
    
    write_level_2_series(temp_0,:) = output_series(ramdom_obj_num,level_2_row,level_2_col,level_2_series,20,ramdom_cout);
    write_level_2_output(temp_0,:) = output_output(ramdom_obj_num,level_2_row,level_2_col,level_2_output,20,ramdom_cout);
    write_level_2_model(temp_0,:) = output_model(ramdom_obj_num,level_2_row,level_2_col,level_2_model,96,ramdom_cout);
    write_level3_2_feed(temp_0,:) = write_feed(ramdom_obj_num,level_2_row,level_2_col,from_3_to_2_feedback,20,ramdom_cout);
    
    write_level_3_series(temp_0,:) = output_series(ramdom_obj_num,level_3_row,level_3_col,level_3_series,6,ramdom_cout);
    write_level_3_output(temp_0,:) = output_output(ramdom_obj_num,level_3_row,level_3_col,level_3_output,6,ramdom_cout);
    write_level_3_model(temp_0,:) = output_model(ramdom_obj_num,level_3_row,level_3_col,level_3_model,26,ramdom_cout);
    write_level4_3_feed(temp_0,:) = write_feed(ramdom_obj_num,level_3_row,level_3_col,from_4_to_3_feedback,6,ramdom_cout);
    
    write_level_4_series(temp_0,:) = output_series(ramdom_obj_num,level_4_row,level_4_col,level_4_series,2,ramdom_cout);
    write_level_4_output(temp_0,:) = output_output(ramdom_obj_num,level_4_row,level_4_col,level_4_output,2,ramdom_cout);
    write_level_4_model(temp_0,:) = output_model(ramdom_obj_num,level_4_row,level_4_col,level_4_model,6,ramdom_cout);

  
    
%     show = show_1(show,level_1_output,row,col);
%     show = show_1(show,level_2_output,row,col);
%     show = show_1(show,level_3_output,row,col);
%     show = show_1(show,level_4_output,row,col);
    
% 	imwrite(show,strcat('./pic/',sprintf('%05d.jpg',temp_all+temp)),'jpg');
    temp_0 = temp_0 + 1;
end
ramdom_cout = ramdom_cout + 1;
temp_all = temp_all + end_frame;

end


write_level_1_all_model = output_all_model(level_1_row,level_1_col,level_1_model,72);
write_level_2_all_model = output_all_model(level_2_row,level_2_col,level_2_model,20);
write_level_3_all_model = output_all_model(level_3_row,level_3_col,level_3_model,6);
write_level_4_all_model = output_all_model(level_4_row,level_4_col,level_4_model,2);
% xlswrite(output_path,write_level_1_series,'level_1_series','A1');
xlswrite(output_path,write_level_1_output,'level_1_output','A1');
% xlswrite(output_path,write_level_1_model,'level_1_model','A1');
xlswrite(output_path,write_level_1_all_model,'level_all_model','A1');
% xlswrite(output_path,write_level2_1_feed,'level2_1_feed','A1');
% xlswrite(output_path,write_level_2_series,'level_2_series','A1');
xlswrite(output_path,write_level_2_output,'level_2_output','A1');
% xlswrite(output_path,write_level_2_model,'level_2_model','A1');
xlswrite(output_path,write_level_2_all_model,'level_all_model','A17');
% xlswrite(output_path,write_level3_2_feed,'level3_2_feed','A1');
% xlswrite(output_path,write_level_3_series,'level_3_series','A1');
xlswrite(output_path,write_level_3_output,'level_3_output','A1');
% xlswrite(output_path,write_level_3_model,'level_3_model','A1');
xlswrite(output_path,write_level_3_all_model,'level_all_model','A33');
% xlswrite(output_path,write_level4_3_feed,'level4_3_feed','A1');
xlswrite(output_path,write_level_4_series,'level_4_series','A1');
xlswrite(output_path,write_level_4_output,'level_4_output','A1');
xlswrite(output_path,write_level_4_model,'level_4_model','A1');
xlswrite(output_path,write_level_4_all_model,'level_all_model','A49');

% pic2video(pic_path,video_path_2,strcat('ramdom_',num2str(ramdom_cout)));
% delete(strcat(pic_path,'\*.jpg'))
end