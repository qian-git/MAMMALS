function [ write_series ] = output_series( ramdom_obj_num,row,col,level_series,cell_length,ramdom_cout )
    write_series_1 = cell(1,cell_length-1);
    for i = 1:1:row
        for j = 1:1:col
            [~,size_level_series] = size(level_series{i,j});data_series = [];
            for k = 1:1:size_level_series
                data_series = [data_series,level_series{i,j}{k}];
            end
            if(isempty(data_series)) data_series = string('0'); end
            write_series_1{1,(row+1)*(i-1)+j} = char(join(data_series,''));
        end
    end
    write_series = [ramdom_obj_num,ramdom_cout,write_series_1];
end

%     write_level_1_series{temp_0,1} = ramdom_obj_num;
%     [~,size_level_4_series] = size(level_4_series{1});data_series = [];
%     for k = 1:1:size_level_4_series
%         data_series = [data_series,level_4_series{1}{k}];
%     end
%     if(isempty(data_series)) data_series = string('0'); end
%     write_level_1_series{temp_0,2} = char(join(data_series,''));
%     for i = 1:1:8
%         for j = 1:1:8
%             [~,size_level_1_series] = size(level_1_series{i,j});data_series = [];
%             for k = 1:1:size_level_1_series
%                 data_series = [data_series,level_1_series{i,j}{k}];
%             end
%             if(isempty(data_series)) data_series = string('0'); end
%             write_excel_frame_series{temp_0,8*(i-1)+j+1} = char(join(data_series,''));
%         end
%     end