function [ write_feed ] = write_feed( ramdom_obj_num,row,col,level_feed,cell_length,ramdom_cout )
    write_feed_1 = cell(1,cell_length-1);
    for i = 1:1:row
        for j = 1:1:col
            write_feed_1{1,(row+1)*(i-1)+j} = char(level_feed{i,j});
        end
    end
    write_feed = [ramdom_obj_num,ramdom_cout,write_feed_1];

end
