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
end

