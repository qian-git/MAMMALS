function [ write_output ] = out_0( row,col,level_output,cell_length )
    write_output = cell(1,cell_length);
    for i = 1:1:row
        for j = 1:1:col
            write_output{1,row*(i-1)+j} = char(level_output{i,j});
        end
    end
end