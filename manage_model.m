function [ model_cnt,model ] = manage_model( buffer_level,model_cnt,model,series_full )
[row,col] = size(buffer_level);
    for i = 1:1:row
        for j = 1:1:col
            if(series_full(i,j) ~= 0)
                if(buffer_level(i,j) ~= 0)
                    if(model_cnt{i,j}(buffer_level(i,j)) >= 3)
                        model_cnt{i,j}(buffer_level(i,j)) = 5;
                    else
                        model_cnt{i,j}(buffer_level(i,j)) = model_cnt{i,j}(buffer_level(i,j)) + 2;
                    end
                end
                for k = 1:1:15
                    if(~isempty(model{i,j}{k}))
                        if(model_cnt{i,j}(k) > 0)
                            model_cnt{i,j}(k) = model_cnt{i,j}(k) - 1;
                        else
                            model_cnt{i,j}(k) = 0;
                        end
                        if(model_cnt{i,j}(k) == 0)
                            [~,model_size] = size(model{i,j}{k});
                            for m = 1:1:model_size
                                if(model{i,j}{k}{2,m} <= 1)
                                    model{i,j}{k}{2,m} = 0;
                                else
                                    model{i,j}{k}{2,m} = model{i,j}{k}{2,m} - 1;
                                end
                            end

                            need_delete = 1;
                            for m = 1:1:model_size
                                if(model{i,j}{k}{2,m} ~= 0)
                                    need_delete = 0;
                                    break;
                                end
                            end
                            if(need_delete == 1)
                                model{i,j}{k} = {};
                            end
                            model_cnt{i,j}(k) = 5;
                        end
                    else
                        model_cnt{i,j}(k) = 5;
                    end
                end
            end
        end
    end
end

