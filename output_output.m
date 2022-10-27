function [ write_output ] = output_output( ramdom_obj_num,row,col,level_output,cell_length,ramdom_cout )
    write_output_1 = cell(1,cell_length-1);
    for i = 1:1:row
        for j = 1:1:col
            write_output_1{1,(row+1)*(i-1)+j} = char(level_output{i,j});
        end
    end
    write_output = [ramdom_obj_num,ramdom_cout,write_output_1];
end
%     write_level_1_output{temp_0,1} = ramdom_obj_num;
%     write_level_1_output{temp_0,2} = char(level_4_output{1});
%     for i = 1:1:8
%         for j = 1:1:8
%             write_excel_frame_level2{temp_0,8*(i-1)+j+1} = char(level_1_output{i,j});
%         end
%     end
    