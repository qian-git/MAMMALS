clc;clear;
data_time = '830';
outpath = strcat('.\output\origin_data\',data_time,'\run_pernode_work',data_time,'_without_zero.xlsx');
input_path = strcat('.\output\',data_time,'\work',data_time,'_f2l1.xlsx');
% outpath = '.\output\origin_data\830\run_pernode_work830_without_zero.xlsx';
% input_path = '.\output\830\work830_f2l1.xlsx';
% all_out_count = [];all_out_frame_count = [];
% model_choose1 = [0,0,0,3,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,2,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,3,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,2,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,3,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,2,1,0,0,0,0,0,0,2,1,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,3,1,0,0,0,0,0,0,1,2,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,1,1,1,0,0,0,0,0,3,1,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,2,1,1,0,0,0,0,0,3,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,0,0,1,2,1,1,5,2,5,0,1,2,1,1,2,5,2,1,0,3,1,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,1,2,2,0,0,0,0,0,2,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,2,2,2,0,1,2,2,2,3,3,3,4,0,3,2,2,3,2,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,2,0,0,0,1,1,1,2,2,1,0,1,1,1,3,5,5,5,3,0,3,4,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,0,0,0,1,1,1,2,2,1,0,1,2,1,3,4,3,5,3,0,2,3,2,4,1,0,0,0,0,0,0,0,0,0,0,0,0];
% model_choose2 = [0,2,2,0,0,2,2,0,0,0,4,0,0,0,0,0,0,0,0;0,2,1,0,0,2,2,0,0,0,4,0,0,0,0,0,0,0,0;0,2,1,0,0,3,1,0,0,0,4,0,0,0,0,0,0,0,0;0,2,1,0,0,2,1,0,0,0,4,0,0,0,0,0,0,0,0;4,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0;4,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,1,1,0,1,2,5,2,0,1,2,0,0;3,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0;2,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,1,1,0,1,3,4,2,0,3,3,1,0;0,0,0,0,0,0,0,1,1,0,1,2,2,1,0,1,2,0,0;0,0,0,0,0,0,0,1,1,0,1,2,2,1,0,2,2,1,0];
% model_choose3 = [2,3,0,3,0;2,2,0,2,0;2,2,0,3,0;2,2,0,3,0;1,0,0,0,0;1,0,0,0,0;0,1,0,5,2;1,0,0,0,0;1,0,0,0,0;0,1,0,5,2;0,1,0,5,3;0,1,0,5,3];
% model_choose4 = [3;3;3;3;1;1;2;1;1;2;2;2];    

% model_choose1 = [0,0,0,2,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,2,0,0,0,0,0,1,1,2,0,0,0,0,0,0,2,2,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,2,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,2,2,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,2,1,0,0,0,0,0,0,1,2,0,0,0,0,0,0,2,1,0,0,0,0,0,0,2,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,2,1,0,0,0,0,0,0,1,2,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,1,1,1,0,0,0,0,0,3,1,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,2,1,0,0,0,0,0,0,3,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,0,0,1,2,1,1,4,1,3,0,1,1,1,2,3,2,2,1,0,2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,1,1,0,0,0,0,0,2,1,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,1,1,3,0,0,0,0,0,2,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,2,3,4,0,1,1,1,2,4,4,2,6,0,2,2,1,1,2,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,2,0,0,0,1,1,1,2,2,1,0,1,1,1,2,4,6,1,6,0,2,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,0,0,0,1,1,1,2,2,1,0,1,1,1,2,4,5,2,5,0,2,2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0];
% model_choose2 = [0,2,2,0,0,4,4,0,0,0,3,0,0,0,0,0,0,0,0;0,2,1,0,0,4,3,0,0,0,3,0,0,0,0,0,0,0,0;0,2,1,0,0,4,2,0,0,0,2,0,0,0,0,0,0,0,0;0,2,1,0,0,3,2,0,0,0,3,0,0,0,0,0,0,0,0;2,1,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0;2,1,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,1,1,0,1,2,1,3,0,1,2,0,0;3,1,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0;3,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,1,1,0,1,2,2,2,0,1,3,1,0;0,0,0,0,0,0,0,1,1,0,1,2,2,2,0,1,2,0,0;0,0,0,0,0,0,0,1,1,0,1,1,2,2,0,1,2,1,0];
% model_choose3 = [3,3,0,2,0;3,2,0,2,0;3,2,0,4,0;3,2,0,2,0;1,0,0,0,0;1,0,0,0,0;0,1,0,3,1;1,0,0,0,0;1,0,0,0,0;0,1,0,3,2;0,1,0,3,1;0,1,0,3,2];
% model_choose4 = [3;3;3;3;1;1;2;1;1;2;2;2];

%work_825_f2l1
% model_choose1 = [0,0,0,3,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,2,0,0,0,0,0,1,1,2,0,0,0,0,0,0,2,2,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,3,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,2,2,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,3,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,2,1,0,0,0,0,0,0,2,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,3,1,0,0,0,0,0,0,1,2,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,1,1,1,0,0,0,0,0,2,1,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,2,1,0,0,0,0,0,0,2,1,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,0,0,1,2,1,1,2,1,3,0,1,1,1,2,2,2,1,1,0,2,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,1,1,2,0,0,0,0,0,2,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,2,1,2,0,1,1,1,1,5,2,3,4,0,2,1,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,2,0,0,0,1,1,1,2,1,1,0,1,1,1,2,6,4,3,4,0,2,3,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,0,0,0,1,1,1,2,1,1,0,1,1,1,2,4,4,3,2,0,2,1,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0];
% model_choose2 = [0,2,2,0,0,2,2,0,0,0,4,0,0,0,0,0,0,0,0;0,2,1,0,0,2,2,0,0,0,4,0,0,0,0,0,0,0,0;0,2,1,0,0,2,1,0,0,0,3,0,0,0,0,0,0,0,0;0,2,1,0,0,2,1,0,0,0,3,0,0,0,0,0,0,0,0;2,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0;2,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,1,1,0,1,3,2,1,0,1,2,0,0;2,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0;2,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,1,1,0,1,2,2,1,0,1,3,1,0;0,0,0,0,0,0,0,1,1,0,1,2,2,1,0,1,2,0,0;0,0,0,0,0,0,0,1,1,0,1,3,2,1,0,1,2,0,0];
% model_choose3 = [2,3,0,3,0;2,2,0,3,0;2,2,0,4,0;2,2,0,4,0;1,0,0,0,0;1,0,0,0,0;0,1,0,2,2;1,0,0,0,0;1,0,0,0,0;0,1,0,2,2;0,1,0,2,2;0,1,0,2,2];
% model_choose4 = [3;3;3;3;1;1;2;1;1;2;2;2];

%work830_f2l1
model_choose1 =[0,0,0,3,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,2,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,3,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,2,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,3,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,2,1,0,0,0,0,0,0,2,1,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,3,1,0,0,0,0,0,0,1,2,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,1,1,1,0,0,0,0,0,2,1,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,2,1,0,0,0,0,0,0,2,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,1,1,2,0,0,0,0,0,2,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,2,2,2,4,0,1,2,2,3,2,2,2,3,0,1,2,1,2,2,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,2,0,0,0,1,1,1,2,2,1,0,1,2,3,5,2,5,3,3,0,1,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,0,0,0,1,1,2,2,2,1,0,1,3,3,4,2,2,2,2,0,1,3,1,3,1,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,0,0,1,2,1,2,3,2,3,0,1,3,3,3,2,2,1,1,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0];
model_choose2 = [0,2,2,0,0,2,1,0,0,0,4,0,0,0,0,0,0,0,0;0,2,1,0,0,2,1,0,0,0,4,0,0,0,0,0,0,0,0;0,2,1,0,0,2,1,0,0,0,3,0,0,0,0,0,0,0,0;0,2,1,0,0,2,1,0,0,0,3,0,0,0,0,0,0,0,0;2,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0;2,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0;2,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0;2,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,1,1,0,2,3,3,2,0,3,2,1,0;0,0,0,0,0,0,0,1,1,0,2,1,3,2,0,3,1,0,0;0,0,0,0,0,0,0,1,1,0,2,1,3,1,0,3,1,1,0;0,0,0,0,0,0,0,1,1,0,5,2,3,2,0,3,1,0,0];
model_choose3 = [2,3,0,3,0;2,2,0,3,0;2,2,0,2,0;2,2,0,2,0;1,0,0,0,0;1,0,0,0,0;1,0,0,0,0;1,0,0,0,0;0,1,0,1,1;0,1,0,1,1;0,1,0,1,1;0,1,0,1,1];
model_choose4 = [3;3;3;3;1;1;1;1;2;2;2;2];

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


out_frame_count = zeros(max_frame,31);
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
    whitch_line = out1_frame(i,1) - 2;
%     if(out1_frame(i,1) <= 9)
%     %对于第9号视频之前是组合，现在拆分为9和14，就不需要两组数据和为1个视频编号来源了，统一减2
%         whitch_line = out1_frame(i,1) - 2;
%     elseif(out1_frame(i,1) >= 10)
%         whitch_line = out1_frame(i,1) - 1;
%     end
    for j = 1:1:out1_col
        if(j ~= 9 && j ~= 18 && j ~= 27 && j ~= 36 && j ~= 45 && j ~= 54 && j ~= 63)
            if(out1_frame_state_cnt(1,j) == '0' || out1_frame_state_cnt(1,j) == '')
                out1_frame_state_cnt(1,j) = out1_data{i,j};
            else
                if(out1_data{i,j} ~= '0')
                    out1_frame_state_cnt(1,j) = out1_data{i,j};
                end
            end
        end
    end
    for j = 1:1:out2_col
        if(j ~= 5 && j ~= 10 && j ~= 15)
            if(out2_frame_state_cnt(1,j) == '0' || out2_frame_state_cnt(1,j) == '')
                out2_frame_state_cnt(1,j) = out2_data{i,j};
            else
                if(out2_data{i,j} ~= '0')
                    out2_frame_state_cnt(1,j) = out2_data{i,j};
                end
            end
        end
    end
    for j = 1:1:out3_col
        if(j ~= 3)
            if(out3_frame_state_cnt(1,j) == '0' || out3_frame_state_cnt(1,j) == '')
                out3_frame_state_cnt(1,j) = out3_data{i,j};
            else
                if(out3_data{i,j} ~= '0')
                    out3_frame_state_cnt(1,j) = out3_data{i,j};
                end
            end
        end
    end
    if(out4_frame_state_cnt == '0' || out4_frame_state_cnt == string(''))
        out4_frame_state_cnt = out4_data{i,1};
    else
        if(out4_data{i,1} ~= '0')
            out4_frame_state_cnt = out4_data{i,1};
        end
    end
    
    if(now_video ~= next_video)
        for j = 1:1:out1_col
            if(j ~= 9 && j ~= 18 && j ~= 27 && j ~= 36 && j ~= 45 && j ~= 54 && j ~= 63)
                if(out1_frame_state_cnt(1,j) ~= '0' && out1_frame_state_cnt(1,j) ~= '')
                    if(out1_frame_state_cnt(1,j) == num2str(model_choose1((whitch_line),j)))
                        out1_frame_normal = out1_frame_normal + 1;
                    else
                        out1_frame_x = out1_frame_x + 1;
                    end
                    if(out1_frame_state(1,j) == 0)
                        out1_frame_state(1,j) = 1;
                        out1_frame_zero = out1_frame_zero - 1;
                    end
%                     if(out1_frame(i,1) == 9)
%                         if(out1_frame_state_cnt(1,j) == num2str(model_choose1((whitch_line),j)) || out1_frame_state_cnt(1,j) == num2str(model_choose1((whitch_line + 1),j)))
%                             out1_frame_normal = out1_frame_normal + 1;
%                         else
%                             out1_frame_x = out1_frame_x + 1;
%                         end
%                         if(out1_frame_state(1,j) == 0)
%                             out1_frame_state(1,j) = 1;
%                             out1_frame_zero = out1_frame_zero - 1;
%                         end
%                     else
%                         if(out1_frame_state_cnt(1,j) == num2str(model_choose1((whitch_line),j)))
%                             out1_frame_normal = out1_frame_normal + 1;
%                         else
%                             out1_frame_x = out1_frame_x + 1;
%                         end
%                         if(out1_frame_state(1,j) == 0)
%                             out1_frame_state(1,j) = 1;
%                             out1_frame_zero = out1_frame_zero - 1;
%                         end
%                     end
                end
            end
        end
        out1_frame_state_cnt = strings(1,out1_col);
        out_frame_count(out1_frame(i,2),(3:5)) = [out1_frame_zero,out1_frame_normal,out1_frame_x];
        out_frame_count(out1_frame(i,2),(15:16)) = [(out1_frame_normal+out1_frame_x),out1_frame_normal/(out1_frame_normal+out1_frame_x)];
%         out_frame_count(out1_frame(i,2),(15:16)) = [(64-out1_frame_zero),(64-out1_frame_zero-out1_frame_x)/(64-out1_frame_zero)];
        out_frame_count(out1_frame(i,2),27) = 64-out1_frame_zero-out1_frame_x - out1_frame_normal;
        if(out1_frame(i,1) == 7 || out1_frame(i,1) == 8 || out1_frame(i,1) == 9 || out1_frame(i,1) == 10)
            out_frame_count(out1_frame(i,2),24) = out1_frame_normal/(out1_frame_normal+out1_frame_x);
            out_frame_count(out1_frame(i,2),25) = nan;
            out_frame_count(out1_frame(i,2),26) = nan;
        elseif(out1_frame(i,1) == 11 || out1_frame(i,1) == 12 || out1_frame(i,1) == 13 || out1_frame(i,1) == 14)
            out_frame_count(out1_frame(i,2),24) = nan;
            out_frame_count(out1_frame(i,2),25) = out1_frame_normal/(out1_frame_normal+out1_frame_x);
            out_frame_count(out1_frame(i,2),26) = nan;
        elseif(out1_frame(i,1) == 3 || out1_frame(i,1) == 4 || out1_frame(i,1) == 5 || out1_frame(i,1) == 6)
            out_frame_count(out1_frame(i,2),24) = nan;
            out_frame_count(out1_frame(i,2),25) = nan;
            out_frame_count(out1_frame(i,2),26) = out1_frame_normal/(out1_frame_normal+out1_frame_x);
        end

        for j = 1:1:out2_col
            if(j ~= 5 && j ~= 10 && j ~= 15)
                if(out2_frame_state_cnt(1,j) ~= '0' && out2_frame_state_cnt(1,j) ~= '')
                    if(out2_frame_state_cnt(1,j) == num2str(model_choose2((whitch_line),j)))
                        out2_frame_normal = out2_frame_normal + 1;
                    else
                        out2_frame_x = out2_frame_x + 1;
                    end
                    if(out2_frame_state(1,j) == 0)
                        out2_frame_state(1,j) = 1;
                        out2_frame_zero = out2_frame_zero - 1;
                    end
%                     if(out1_frame(i,1) == 9)
%                         if(out2_frame_state_cnt(1,j) == num2str(model_choose2((whitch_line),j)) || out2_frame_state_cnt(1,j) == num2str(model_choose2((whitch_line + 1),j)))
%                             out2_frame_normal = out2_frame_normal + 1;
%                         else
%                             out2_frame_x = out2_frame_x + 1;
%                         end
%                         if(out2_frame_state(1,j) == 0)
%                             out2_frame_state(1,j) = 1;
%                             out2_frame_zero = out2_frame_zero - 1;
%                         end
%                     else
%                         if(out2_frame_state_cnt(1,j) == num2str(model_choose2((whitch_line),j)))
%                             out2_frame_normal = out2_frame_normal + 1;
%                         else
%                             out2_frame_x = out2_frame_x + 1;
%                         end
%                         if(out2_frame_state(1,j) == 0)
%                             out2_frame_state(1,j) = 1;
%                             out2_frame_zero = out2_frame_zero - 1;
%                         end
%                     end
                end
            end
        end
        out2_frame_state_cnt = strings(1,out2_col);
        out_frame_count(out1_frame(i,2),(6:8)) = [out2_frame_zero,out2_frame_normal,out2_frame_x];
        out_frame_count(out1_frame(i,2),(17:18)) = [(out2_frame_normal+out2_frame_x),out2_frame_normal/(out2_frame_normal+out2_frame_x)];
%         out_frame_count(out1_frame(i,2),(17:18)) = [(16-out2_frame_zero),(16-out2_frame_zero-out2_frame_x)/(16-out2_frame_zero)];
        out_frame_count(out1_frame(i,2),31) = 16-out2_frame_zero-out2_frame_x - out2_frame_normal;
        if(out1_frame(i,1) == 7 || out1_frame(i,1) == 8 || out1_frame(i,1) == 9 || out1_frame(i,1) == 10)
            out_frame_count(out1_frame(i,2),28) = out2_frame_normal/(out2_frame_normal+out2_frame_x);
            out_frame_count(out1_frame(i,2),29) = nan;
            out_frame_count(out1_frame(i,2),30) = nan;
        elseif(out1_frame(i,1) == 11 || out1_frame(i,1) == 12 || out1_frame(i,1) == 13 || out1_frame(i,1) == 14)
            out_frame_count(out1_frame(i,2),28) = nan;
            out_frame_count(out1_frame(i,2),29) = out2_frame_normal/(out2_frame_normal+out2_frame_x);
            out_frame_count(out1_frame(i,2),30) = nan;
        elseif(out1_frame(i,1) == 3 || out1_frame(i,1) == 4 || out1_frame(i,1) == 5 || out1_frame(i,1) == 6)
            out_frame_count(out1_frame(i,2),28) = nan;
            out_frame_count(out1_frame(i,2),29) = nan;
            out_frame_count(out1_frame(i,2),30) = out2_frame_normal/(out2_frame_normal+out2_frame_x);
        end
        for j = 1:1:out3_col
            if(j ~= 3)
                if(out3_frame_state_cnt(1,j) ~= '0' && out3_frame_state_cnt(1,j) ~= '')
                    if(out3_frame_state_cnt(1,j) == num2str(model_choose3((whitch_line),j)))
                        out3_frame_normal = out3_frame_normal + 1;
                    else
                        out3_frame_x = out3_frame_x + 1;
                    end
                    if(out3_frame_state(1,j) == 0)
                        out3_frame_state(1,j) = 1;
                        out3_frame_zero = out3_frame_zero - 1;
                    end
%                     if(out1_frame(i,1) == 9)
%                         if(out3_frame_state_cnt(1,j) == num2str(model_choose3((whitch_line),j)) || out3_frame_state_cnt(1,j) == num2str(model_choose3((whitch_line + 1),j)))
%                             out3_frame_normal = out3_frame_normal + 1;
%                         else
%                             out3_frame_x = out3_frame_x + 1;
%                         end
%                         if(out3_frame_state(1,j) == 0)
%                             out3_frame_state(1,j) = 1;
%                             out3_frame_zero = out3_frame_zero - 1;
%                         end
%                     else
%                         if(out3_frame_state_cnt(1,j) == num2str(model_choose3((whitch_line),j)))
%                             out3_frame_normal = out3_frame_normal + 1;
%                         else
%                             out3_frame_x = out3_frame_x + 1;
%                         end
%                         if(out3_frame_state(1,j) == 0)
%                             out3_frame_state(1,j) = 1;
%                             out3_frame_zero = out3_frame_zero - 1;
%                         end
%                     end
                end
            end
        end
        out3_frame_state_cnt = strings(1,out3_col);
        out_frame_count(out1_frame(i,2),(9:11)) = [out3_frame_zero,out3_frame_normal,out3_frame_x];
        out_frame_count(out1_frame(i,2),(19:20)) = [(out3_frame_normal+out3_frame_x),out3_frame_normal/(out3_frame_normal+out3_frame_x)];
%         out_frame_count(out1_frame(i,2),(19:20)) = [(4-out3_frame_zero),(4-out3_frame_zero-out3_frame_x)/(4-out3_frame_zero)];
        if(out4_frame_state_cnt ~= '0' && out4_frame_state_cnt ~= string(''))
            if(out4_frame_state_cnt == num2str(model_choose4((whitch_line),1)))
                out4_frame_normal = 1;
            else
                out4_frame_x = 1;
            end
            if(out4_frame_state == 0)
                out4_frame_state = 1;
                out4_frame_zero = out4_frame_zero - 1;
            end
%             if(out1_frame(i,1) == 9)
%                 if(out4_frame_state_cnt == num2str(model_choose4((whitch_line),1)) || out4_frame_state_cnt == num2str(model_choose4((whitch_line + 1),1)))
%                     out4_frame_normal = 1;
%                 else
%                     out4_frame_x = 1;
%                 end
%                 if(out4_frame_state == 0)
%                     out4_frame_state = 1;
%                     out4_frame_zero = out4_frame_zero - 1;
%                 end
%             else
%                 if(out4_frame_state_cnt == num2str(model_choose4((whitch_line),1)))
%                     out4_frame_normal = 1;
%                 else
%                     out4_frame_x = 1;
%                 end
%                 if(out4_frame_state == 0)
%                     out4_frame_state = 1;
%                     out4_frame_zero = out4_frame_zero - 1;
%                 end
%             end
        end
        out4_frame_state_cnt = strings(1,out4_col);
        out_frame_count(out1_frame(i,2),(12:14)) = [out4_frame_zero,out4_frame_normal,out4_frame_x];
        all_frame_normal = out1_frame_normal + out2_frame_normal + out3_frame_normal + out4_frame_normal;
        all_frame_x = out1_frame_x + out2_frame_x + out3_frame_x + out4_frame_x;
        all_zero = out4_frame_zero + out3_frame_zero + out2_frame_zero + out1_frame_zero;
        out_frame_count(out1_frame(i,2),(21:23)) = [all_frame_normal,all_frame_x,all_frame_normal/(all_frame_normal + all_frame_x)];
%         out_frame_count(out1_frame(i,2),(21:23)) = [all_frame_normal,all_frame_x,(85-all_zero-all_frame_x)/(85-all_zero)];
        out1_frame_x = 0;out1_frame_normal = 0;
        out2_frame_x = 0;out2_frame_normal = 0;
        out3_frame_x = 0;out3_frame_normal = 0;
        out4_frame_x = 0;out4_frame_normal = 0;
        out_frame_count(out1_frame(i,2),1) = out1_frame(i,2);out_frame_count(out1_frame(i,2),2) = out1_frame(i,1);
    end

end
xlswrite(outpath,out_frame_count,'sheet1','A1');



