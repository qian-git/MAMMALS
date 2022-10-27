function [ write_model ] = output_all_model( row,col,level_model,cell_length )
    write_model = cell(15,cell_length);
    for m = 1:1:15
        write_model{m,1} = m;
        for i = 1:1:row
            for j = 1:1:col
                [~,size_series] = size(level_model{i,j}{m});data_series = [];
                for k = 1:1:size_series
                    data_series = [data_series,level_model{i,j}{m}{1,k}];
                end
                if(isempty(data_series)) data_series = string('0'); end
                write_model{m,(row+1)*(i-1)+j+1} = char(join(data_series,''));
            end
        end
    end

end

