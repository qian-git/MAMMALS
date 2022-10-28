function [ LCS_table ] = Dynamic_programming( model,series )
    LCS_table = {};
    [~,size_model_length] = size(model);
    [~,size_series] = size(series);
    compare_table = zeros(size_series+1,size_model_length+1); %Dynamic_programming table
    for i = 1:1:size_series
        for j = 1:1: size_model_length
            if(series{i} == model{1,j})
                compare_table(i+1,j+1) = compare_table(i,j) + 1;
            else
                compare_table(i+1,j+1) = max(compare_table(i+1,j),compare_table(i,j+1));
            end
        end
    end
    LCS_length = compare_table(size_series + 1,size_model_length + 1);
    axis_i = size_series + 1;axis_j = size_model_length + 1;
    while(LCS_length >= 1)
        if(compare_table(axis_i,axis_j) > compare_table(axis_i-1,axis_j) && compare_table(axis_i,axis_j) > compare_table(axis_i,axis_j-1))
            LCS_table{1,LCS_length} = model{1,axis_j - 1};
            LCS_table{2,LCS_length} = axis_j - 1;
            LCS_table{3,LCS_length} = axis_i - 1;
            LCS_length = LCS_length - 1;
            axis_i = axis_i - 1; axis_j = axis_j - 1;
        elseif(compare_table(axis_i,axis_j) > compare_table(axis_i-1,axis_j) && compare_table(axis_i,axis_j) == compare_table(axis_i,axis_j-1))
            axis_j = axis_j - 1;
        elseif(compare_table(axis_i,axis_j) == compare_table(axis_i-1,axis_j) && compare_table(axis_i,axis_j) > compare_table(axis_i,axis_j-1))
            axis_i = axis_i - 1;
        else
            if(compare_table(axis_i,axis_j) == compare_table(axis_i-1,axis_j-1))
                axis_i = axis_i - 1; axis_j = axis_j - 1;
            else
                axis_i = axis_i - 1;
            end
        end
    end
end
