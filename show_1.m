function [show1] = show_1(show,data_out,row,col)
    [size_row,size_col] = size(data_out);
    show1 = show;
    row_pix = row/size_row;col_pix = col/size_col;
    if(size_row == 1)
        level = 0;
    elseif(size_row == 2)
        level = 1;
    elseif(size_row == 4)
        level = 2;
    elseif(size_row == 8)
        level = 3;
    end
    for i = 1:1:size_row
        for j = 1:1:size_col
            if(data_out(i,j) == 'X')
                r = 255;g = 0;b = 102;
            elseif(data_out(i,j) == '0' || data_out(i,j) == '')
                r = 0;g = 0;b = 0;
            else
                r = 51;g = 204;b = 51;
            end
            show1((row_pix*(i-1)+1+level),(col_pix*(j-1)+1+level):(col_pix*j-level),1) = r;
            show1((row_pix*i-level),(col_pix*(j-1)+1+level):(col_pix*j-level),1) = r;
            show1((row_pix*(i-1)+1+level):(row_pix*i-level),(col_pix*(j-1)+1+level),1) = r;
            show1((row_pix*(i-1)+1+level):(row_pix*i-level),(col_pix*j-level),1) = r;
            show1((row_pix*(i-1)+1+level),(col_pix*(j-1)+1+level):(col_pix*j-level),2) = g;
            show1((row_pix*i-level),(col_pix*(j-1)+1+level):(col_pix*j-level),2) = g;
            show1((row_pix*(i-1)+1+level):(row_pix*i-level),(col_pix*(j-1)+1+level),2) = g;
            show1((row_pix*(i-1)+1+level):(row_pix*i-level),(col_pix*j-level),2) = g;
            show1((row_pix*(i-1)+1+level),(col_pix*(j-1)+1+level):(col_pix*j-level),3) = b;
            show1((row_pix*i-level),(col_pix*(j-1)+1+level):(col_pix*j-level),3) = b;
            show1((row_pix*(i-1)+1+level):(row_pix*i-level),(col_pix*(j-1)+1+level),3) = b;
            show1((row_pix*(i-1)+1+level):(row_pix*i-level),(col_pix*j-level),3) = b;
        end
    end
end


