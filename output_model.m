function [ write_model ] = output_model( ramdom_obj_num,row,col,level_model,cell_length,ramdom_cout )
    write_model_1 = cell(1,cell_length-1);
    for i = 1:1:row
        for j = 1:1:col
            for m = 1:1:5
                [~,size_series] = size(level_model{i,j}{m});data_series = [];
                for k = 1:1:size_series
                    data_series = [data_series,level_model{i,j}{m}{1,k}];
                end
                if(isempty(data_series)) data_series = string('0'); end
                write_model_1{1,((row+1)*(i-1)+j-1)*5+m} = char(join(data_series,''));
            end
        end
    end
    write_model = [ramdom_obj_num,ramdom_cout,write_model_1];
%     for m = 1:1:15
%         write_model{m,1} = m;
%         for i = 1:1:row
%             for j = 1:1:col
%                 [~,size_series] = size(level_model{i,j}{m});data_series = [];
%                 for k = 1:1:size_series
%                     data_series = [data_series,level_model{i,j}{m}{1,k}];
%                 end
%                 if(isempty(data_series)) data_series = string('0'); end
%                 write_model{m,(row+1)*(i-1)+j+1} = char(join(data_series,''));
%             end
%         end
%     end
end

% for m = 1:1:15
%     write_level_1_model{m,1} = m;
%     [~,size_level_4_series] = size(level_4_model{1}{m});data_series = [];
%     for k = 1:1:size_level_4_series
%         data_series = [data_series,level_4_model{1}{m}{1,k}];
%     end
%     if(isempty(data_series)) data_series = string('0'); end
%     write_level_1_model{m,2} = char(join(data_series,''));
% %     for i = 1:1:8
% %         for j = 1:1:8
% %             [~,size_level_1_series] = size(level_1_model{i,j}{m});data_series = [];
% %             for k = 1:1:size_level_1_series
% %                 data_series = [data_series,level_1_model{i,j}{m}{1,k}];
% %             end
% %             if(isempty(data_series)) data_series = string('0'); end
% %             write_excel_frame_model{m,8*(i-1)+j+1} = char(join(data_series,''));
% %         end
% %     end
% end