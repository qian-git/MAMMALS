function [ level_next_data,model_level,level_model_more,level_model_cnt,series_level,data_state,feedback_out,series_full ] = node_function( lastlevel_output,model_level,level_model_more,series_level,data_state,feedback_in,data_out_buf,per_flag )
    [size_i,size_j] = size(series_level);
    level_model_cnt = zeros(size_i,size_j);
    for i = 1:1:size_i
       for j = 1:1:size_j
           if(data_state{i,j}{1} == '0' && data_state{i,j}{2} == '0' && data_state{i,j}{3} == '0' && data_state{i,j}{4} == '0')
               series_level{i,j} = {};
           end

           [~,size_series_level] = size(series_level{i,j});
           
%            if(lastlevel_output(2*(i-1)+1,2*(j-1)+1) ~= data_state{i,j}{1})
%                series_level{i,j}{size_series_level + 1} = strcat(num2str(1),lastlevel_output(2*(i-1)+1,2*(j-1)+1));
%                size_series_level = size_series_level + 1;
%                data_state{i,j}{1} = lastlevel_output(2*(i-1)+1,2*(j-1)+1);
%            end
%            if(lastlevel_output(2*(i-1)+1,2*j) ~= data_state{i,j}{2})
%                series_level{i,j}{size_series_level + 1} = strcat(num2str(2),lastlevel_output(2*(i-1)+1,2*j));
%                size_series_level = size_series_level + 1;
%                data_state{i,j}{2} = lastlevel_output(2*(i-1)+1,2*j);
%            end
%            if(lastlevel_output(2*i,2*(j-1)+1) ~= data_state{i,j}{3})
%                series_level{i,j}{size_series_level + 1} = strcat(num2str(3),lastlevel_output(2*i,2*(j-1)+1));
%                size_series_level = size_series_level + 1;
%                data_state{i,j}{3} = lastlevel_output(2*i,2*(j-1)+1);
%            end
%            if(lastlevel_output(2*i,2*j) ~= data_state{i,j}{4})
%                series_level{i,j}{size_series_level + 1} = strcat(num2str(4),lastlevel_output(2*i,2*j));
% %                    size_series_level = size_series_level + 1;
%                data_state{i,j}{4} = lastlevel_output(2*i,2*j);


           if(size_series_level >= 2)
               if(lastlevel_output(2*(i-1)+1,2*(j-1)+1) ~= data_state{i,j}{1})
                   new_data = 1;
                   if(data_state{i,j}{1} == 'X')
                       for a = 2:1:size_series_level
                           if(extractBefore(series_level{i,j}{a},2) == num2str(1) && extractAfter(series_level{i,j}{a},1) == 'X')
                               series_level{i,j}{a} = strcat(num2str(1),lastlevel_output(2*(i-1)+1,2*(j-1)+1));
                               data_state{i,j}{1} = lastlevel_output(2*(i-1)+1,2*(j-1)+1);
                               new_data = 0;
                               for aa = 1:1:(a-1)
                                   if(series_level{i,j}{a} == series_level{i,j}{aa})
                                       series_level{i,j}(a) = [];
                                       size_series_level = size_series_level - 1;
                                       break;
                                   end
                               end
                               break;
                           end
                       end
                   end

                   if(new_data == 1)
                       series_level{i,j}{size_series_level + 1} = strcat(num2str(1),lastlevel_output(2*(i-1)+1,2*(j-1)+1));
                       size_series_level = size_series_level + 1;
                       data_state{i,j}{1} = lastlevel_output(2*(i-1)+1,2*(j-1)+1);
                   end
                   
%                    if(lastlevel_output(2*(i-1)+1,2*(j-1)+1) ~= '0' && extractBefore(series_level{i,j}{size_series_level},2) == num2str(1) && data_state{i,j}{1} ~= '0')
%                        series_level{i,j}{size_series_level} = strcat(num2str(1),lastlevel_output(2*(i-1)+1,2*(j-1)+1));
%                        data_state{i,j}{1} = lastlevel_output(2*(i-1)+1,2*(j-1)+1);
%                    else
%                        series_level{i,j}{size_series_level + 1} = strcat(num2str(1),lastlevel_output(2*(i-1)+1,2*(j-1)+1));
%                        size_series_level = size_series_level + 1;
%                        data_state{i,j}{1} = lastlevel_output(2*(i-1)+1,2*(j-1)+1);
%                    end
%                    if(size_series_level >= 2 && series_level{i,j}{size_series_level} == series_level{i,j}{size_series_level-1})
%                        series_level{i,j}(size_series_level) = [];
%                        size_series_level = size_series_level - 1;
%                    end
               end
               if(lastlevel_output(2*(i-1)+1,2*j) ~= data_state{i,j}{2})
                   new_data = 1;
                   if(data_state{i,j}{2} == 'X')
                       for a = 2:1:size_series_level
                           if(extractBefore(series_level{i,j}{a},2) == num2str(2) && extractAfter(series_level{i,j}{a},1) == 'X')
                               series_level{i,j}{a} = strcat(num2str(2),lastlevel_output(2*(i-1)+1,2*j));
                               new_data = 0;
                               data_state{i,j}{2} = lastlevel_output(2*(i-1)+1,2*j);
                               for aa = 1:1:(a-1)
                                   if(series_level{i,j}{a} == series_level{i,j}{aa})
                                       series_level{i,j}(a) = [];
                                       size_series_level = size_series_level - 1;
                                       break;
                                   end
                               end
                               break;
                           end
                       end
                   end

                   if(new_data == 1)
                       series_level{i,j}{size_series_level + 1} = strcat(num2str(2),lastlevel_output(2*(i-1)+1,2*j));
                       size_series_level = size_series_level + 1;
                       data_state{i,j}{2} = lastlevel_output(2*(i-1)+1,2*j);
                   end
%                    if(lastlevel_output(2*(i-1)+1,2*j) ~= '0' && extractBefore(series_level{i,j}{size_series_level},2) == num2str(2) && data_state{i,j}{2} ~= '0')
%                        series_level{i,j}{size_series_level} = strcat(num2str(2),lastlevel_output(2*(i-1)+1,2*j));
%                        data_state{i,j}{2} = lastlevel_output(2*(i-1)+1,2*j);
%                    else
%                        series_level{i,j}{size_series_level + 1} = strcat(num2str(2),lastlevel_output(2*(i-1)+1,2*j));
%                        size_series_level = size_series_level + 1;
%                        data_state{i,j}{2} = lastlevel_output(2*(i-1)+1,2*j);
%                    end
%                    if(size_series_level >= 2 && series_level{i,j}{size_series_level} == series_level{i,j}{size_series_level-1})
%                        series_level{i,j}(size_series_level) = [];
%                        size_series_level = size_series_level - 1;
%                    end
               end
               if(lastlevel_output(2*i,2*(j-1)+1) ~= data_state{i,j}{3})
                   new_data = 1;
                   if(data_state{i,j}{3} == 'X')
                       for a = 2:1:size_series_level
                           if(extractBefore(series_level{i,j}{a},2) == num2str(3) && extractAfter(series_level{i,j}{a},1) == 'X')
                               series_level{i,j}{a} = strcat(num2str(3),lastlevel_output(2*i,2*(j-1)+1));
                               new_data = 0;
                               data_state{i,j}{3} = lastlevel_output(2*i,2*(j-1)+1);
                               for aa = 1:1:(a-1)
                                   if(series_level{i,j}{a} == series_level{i,j}{aa})
                                       series_level{i,j}(a) = [];
                                       size_series_level = size_series_level - 1;
                                       break;
                                   end
                               end
                               break;
                           end
                       end
                   end
                   if(new_data == 1)
                       series_level{i,j}{size_series_level + 1} = strcat(num2str(3),lastlevel_output(2*i,2*(j-1)+1));
                       size_series_level = size_series_level + 1;
                       data_state{i,j}{3} = lastlevel_output(2*i,2*(j-1)+1);
                   end
%                    if(lastlevel_output(2*i,2*(j-1)+1) ~= '0' && extractBefore(series_level{i,j}{size_series_level},2) == num2str(3) && data_state{i,j}{3} ~= '0')
%                        series_level{i,j}{size_series_level} = strcat(num2str(3),lastlevel_output(2*i,2*(j-1)+1));
%                        data_state{i,j}{3} = lastlevel_output(2*i,2*(j-1)+1);
%                    else
%                        series_level{i,j}{size_series_level + 1} = strcat(num2str(3),lastlevel_output(2*i,2*(j-1)+1));
%                        size_series_level = size_series_level + 1;
%                        data_state{i,j}{3} = lastlevel_output(2*i,2*(j-1)+1);
%                    end
%                    if(size_series_level >= 2 && series_level{i,j}{size_series_level} == series_level{i,j}{size_series_level-1})
%                        series_level{i,j}(size_series_level) = [];
%                        size_series_level = size_series_level - 1;
%                    end
               end
               if(lastlevel_output(2*i,2*j) ~= data_state{i,j}{4})
                   new_data = 1;
                   if(data_state{i,j}{4} == 'X')
                       for a = 2:1:size_series_level
                           if(extractBefore(series_level{i,j}{a},2) == num2str(4) && extractAfter(series_level{i,j}{a},1) == 'X')
                               series_level{i,j}{a} = strcat(num2str(4),lastlevel_output(2*i,2*j));
                               new_data = 0;
                               data_state{i,j}{4} = lastlevel_output(2*i,2*j);
                               for aa = 1:1:(a-1)
                                   if(series_level{i,j}{a} == series_level{i,j}{aa})
                                       series_level{i,j}(a) = [];
                                       size_series_level = size_series_level - 1;
                                       break;
                                   end
                               end
                               break;
                           end
                       end
                   end
                   if(new_data == 1)
                       series_level{i,j}{size_series_level + 1} = strcat(num2str(4),lastlevel_output(2*i,2*j));
%                        size_series_level = size_series_level + 1;
                       data_state{i,j}{4} = lastlevel_output(2*i,2*j);
                   end
%                    if(lastlevel_output(2*i,2*j) ~= '0' && extractBefore(series_level{i,j}{size_series_level},2) == num2str(4) && data_state{i,j}{4} ~= '0')
%                        series_level{i,j}{size_series_level + 1} = strcat(num2str(4),lastlevel_output(2*i,2*j));
%                        data_state{i,j}{4} = lastlevel_output(2*i,2*j);
%                    else
%                        series_level{i,j}{size_series_level + 1} = strcat(num2str(4),lastlevel_output(2*i,2*j));
%     %                    size_series_level = size_series_level + 1;
%                        data_state{i,j}{4} = lastlevel_output(2*i,2*j);
%                    end
%                    if(size_series_level >= 2 && series_level{i,j}{size_series_level} == series_level{i,j}{size_series_level-1})
%                        series_level{i,j}(size_series_level) = [];
%                        size_series_level = size_series_level - 1;
%                    end
               end
           else
               if(lastlevel_output(2*(i-1)+1,2*(j-1)+1) ~= data_state{i,j}{1})
                   series_level{i,j}{size_series_level + 1} = strcat(num2str(1),lastlevel_output(2*(i-1)+1,2*(j-1)+1));
                   size_series_level = size_series_level + 1;
                   data_state{i,j}{1} = lastlevel_output(2*(i-1)+1,2*(j-1)+1);
               end
               if(lastlevel_output(2*(i-1)+1,2*j) ~= data_state{i,j}{2})
                   series_level{i,j}{size_series_level + 1} = strcat(num2str(2),lastlevel_output(2*(i-1)+1,2*j));
                   size_series_level = size_series_level + 1;
                   data_state{i,j}{2} = lastlevel_output(2*(i-1)+1,2*j);
               end
               if(lastlevel_output(2*i,2*(j-1)+1) ~= data_state{i,j}{3})
                   series_level{i,j}{size_series_level + 1} = strcat(num2str(3),lastlevel_output(2*i,2*(j-1)+1));
                   size_series_level = size_series_level + 1;
                   data_state{i,j}{3} = lastlevel_output(2*i,2*(j-1)+1);
               end
               if(lastlevel_output(2*i,2*j) ~= data_state{i,j}{4})
                   series_level{i,j}{size_series_level + 1} = strcat(num2str(4),lastlevel_output(2*i,2*j));
                   data_state{i,j}{4} = lastlevel_output(2*i,2*j);
               end
           end
       end
    end
    
%     for i = 1:1:size_i
%        for j = 1:1:size_j
%            [~,size_series] = size(series_level{i,j});
%            if(size_series == 0 || series_level{i,j}{1} == '0')
%                series_level{i,j}{1} = lastlevel_output(i,j);
%            else
%                if(series_level{i,j}{size_series} == '0')
%                    series_level{i,j} = {};
%                    series_level{i,j}{1} = lastlevel_output(i,j);
%                else
%                    if(series_level{i,j}{size_series} ~= lastlevel_output(i,j))
%                        series_level{i,j}{size_series + 1} = lastlevel_output(i,j);
%                    end
%                end
%            end
%        end
%     end
%     series_level_buf = series_level;
    
    
    %记得转换成元胞，以及level_1_series转换
    
    series_full = zeros(size_i,size_j);
    %比对模型、创建模型及传输                               
    for i = 1:1:size_i
       for j = 1:1:size_j
           [~,size_series] = size(series_level{i,j});
           if(size_series == 0)
               level_next_data(i,j) = string('0');
               feedback_out((2*(i-1)+1):2*i,(2*(j-1)+1):2*j) = [string(''),string('');string(''),string('')];
           else
               if(series_level{i,j}{1} == '0')
                   level_next_data(i,j) = string('0');
                   feedback_out((2*(i-1)+1):2*i,(2*(j-1)+1):2*j) = [string(''),string('');string(''),string('')];
               else
                   if(data_state{i,j}{1} == '0' && data_state{i,j}{2} == '0' && data_state{i,j}{3} == '0' && data_state{i,j}{4} == '0')
                       series_full(i,j) = 1;
                   end
                   [level_next_data(i,j),model_level{i,j},level_model_more{i,j},level_model_cnt(i,j),feedback_out((2*(i-1)+1):2*i,(2*(j-1)+1):2*j)] = model_match(series_level{i,j},model_level{i,j},level_model_more{i,j},series_full(i,j),feedback_in(i,j),data_out_buf(i,j),per_flag);
%                    [level_next_data(i,j),model_level{i,j}] = model_match(series_level{i,j},model_level{i,j},series_full);
               end
           end
       end
    end
    
end

