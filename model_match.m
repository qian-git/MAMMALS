function [data_buf,model,model_more,model_select,feedback_out] = model_match(series,model,model_more,series_full,feedback_in,data_out_buf,per_flag)%model_match
%     per_flag = 0.6;
%     per_flag_1 = 0.8;
    feedback_out = strings(2,2);
    [~,size_series] = size(series);
    %模型比较
    [~,size_model] = size(model);
    model_exist = 0;
    for i = 1:1:size_model
        if(~isempty(model{i}))
            model_exist = 1;
            break;
        end
    end
    if(model_exist == 0)%如果没有模型,保存数据
        if(series_full == 1)
            not_modeling = 0;
            for i = 1:1:size_series
                if(extractAfter(series{i},1) == 'X')
                    not_modeling = 1;
                    break;
                end
            end
            if(not_modeling == 0)
                [~,size_series] = size(series);
                model{1}(1,:) = series;
                model_more{1}{1} = series;
                for a = 1:1:size_series
                    model{1}{2,a} = 3;
                end
                model_select = 1;
                data_buf = string('X');
            else
                model_select = 0;
                data_buf = string('0');
            end
        else
            data_buf = string('0');
            model_select = 0;
        end
    else
%--------------------有模型，进行比较--------------------------------------
%--------------------feedback_in，后级反馈调控 --------------------------------------
        LCS_table = cell(1,15);
        if(feedback_in ~= '' && feedback_in ~= '0')
            if(feedback_in == 'A')
                feed_model = 10;
            elseif(feedback_in == 'B')
                feed_model = 11;
            elseif(feedback_in == 'C')
                feed_model = 12;
            elseif(feedback_in == 'D')
                feed_model = 13;
            elseif(feedback_in == 'E')
                feed_model = 14;
            elseif(feedback_in == 'F')
                feed_model = 15;
            else
                feed_model = str2double(feedback_in);
            end
        else
            feed_model = 0;
        end
%--------------------data_out_buf，历史选择修正 --------------------------------------
        if(data_out_buf ~= '' && data_out_buf ~= '0' && data_out_buf ~= 'X')
            if(data_out_buf == 'A')
                data_out = 10;
            elseif(data_out_buf == 'B')
                data_out = 11;
            elseif(data_out_buf == 'C')
                data_out = 12;
            elseif(data_out_buf == 'D')
                data_out = 13;
            elseif(data_out_buf == 'E')
                data_out = 14;
            elseif(data_out_buf == 'F')
                data_out = 15;
            else
                data_out = str2double(data_out_buf);
            end
        else
            data_out = 0;
        end
%--------------------模型匹配选择 --------------------------------------
        PX = zeros(2,size_model);
        if(feed_model ~= 0 && ~isempty(model{feed_model}))
            LCS_table{feed_model} = {};
            model_index = cellfun(@str2double, cellfun(@num2str,model{feed_model}(2,:),'Unif',0));
            if(max(model_index) > 2)
                size_model_one = size(model{feed_model});
                model_common_series = {}; model_common_series_cnt = 0;
                for aa = 1:1:size_model_one(2)
                    model_common_series_cnt = model_common_series_cnt + 1;
                    if(model{feed_model}{2,aa} >= 2)
                        model_common_series(:,model_common_series_cnt) = model{feed_model}(:,aa);
                    else
                        model_common_series(:,model_common_series_cnt) = {string('0');0};
                    end
                end
                LCS_table{feed_model} = Dynamic_programming(model_common_series,series);
            else
                LCS_table{feed_model} = Dynamic_programming(model{feed_model},series);
            end
            [~,size_LCS] = size(LCS_table{feed_model});
            [~,size_series] = size(series);
            size_series_0 = size_series;
            for aa = 1:1:size_series
                if(extractAfter(series{aa},1) == 'X')
                    size_series_0 = size_series_0 - 1;
                end
            end
            PX(1,feed_model) = size_LCS/size_series_0;
            px_model_son = 0;
            for aa = 1:1:size_LCS
                px_model_son = px_model_son + model{feed_model}{2,LCS_table{feed_model}{2,aa}};
            end
            [~,size_model_a] = size(model{feed_model});
            PX(2,feed_model) = px_model_son/size_model_a;
        end
        if(data_out ~= 0 && ~isempty(model{data_out}) && data_out ~= feed_model)
            LCS_table{data_out} = {};
            model_index = cellfun(@str2double, cellfun(@num2str,model{data_out}(2,:),'Unif',0));
            if(max(model_index) > 2)
                size_model_one = size(model{data_out});
                model_common_series = {}; model_common_series_cnt = 0;
                for aa = 1:1:size_model_one(2)
                    model_common_series_cnt = model_common_series_cnt + 1;
                    if(model{data_out}{2,aa} >= 2)
                        model_common_series(:,model_common_series_cnt) = model{data_out}(:,aa);
                    else
                        model_common_series(:,model_common_series_cnt) = {string('0');0};
                    end
                end
                LCS_table{data_out} = Dynamic_programming(model_common_series,series);
            else
                LCS_table{data_out} = Dynamic_programming(model{data_out},series);
            end
            [~,size_LCS] = size(LCS_table{data_out});
            [~,size_series] = size(series);
            size_series_0 = size_series;
            for aa = 1:1:size_series
                if(extractAfter(series{aa},1) == 'X')
                    size_series_0 = size_series_0 - 1;
                end
            end
            PX(1,data_out) = size_LCS/size_series_0;
            px_model_son = 0;
            for aa = 1:1:size_LCS
                px_model_son = px_model_son + model{data_out}{2,LCS_table{data_out}{2,aa}};
            end
            [~,size_model_a] = size(model{data_out});
            PX(2,data_out) = px_model_son/size_model_a;
        end
        if(feed_model ~= 0 && PX(1,feed_model) >= per_flag)
                m_PX = PX(1,feed_model);
                p_PX = feed_model;
%             if(data_out ~= 0 && data_out ~= feed_model && PX(1,data_out) >= per_flag)
%                 if(PX(2,feed_model) >= PX(2,data_out))
%                     m_PX = PX(1,feed_model);
%                     p_PX = feed_model;
%                 else
%                     m_PX = PX(1,data_out);
%                     p_PX = data_out;
%                 end
%             else
%                 m_PX = PX(1,feed_model);
%                 p_PX = feed_model;
%             end
        else
            if(data_out ~= 0 && data_out ~= feed_model && PX(1,data_out) >= per_flag)
                m_PX = PX(1,data_out);
                p_PX = data_out;
            else
                for a = 1:1:size_model 
                    LCS_table{a} = {};
                    if(~isempty(model{a}))
                        model_index = cellfun(@str2double, cellfun(@num2str,model{a}(2,:),'Unif',0));
                        if(max(model_index) > 2)
                            size_model_one = size(model{a});
                            model_common_series = {}; model_common_series_cnt = 0;
                            for aa = 1:1:size_model_one(2)
                                model_common_series_cnt = model_common_series_cnt + 1;
                                if(model{a}{2,aa} >= 2)
                                    model_common_series(:,model_common_series_cnt) = model{a}(:,aa);
                                else
                                    model_common_series(:,model_common_series_cnt) = {string('0');0};
                                end
                            end
                            LCS_table{a} = Dynamic_programming(model_common_series,series);
                        else
                            LCS_table{a} = Dynamic_programming(model{a},series);
                        end
                    end
                end
                PX = zeros(2,size_model);
                for a = 1:1:size_model
                    if(~isempty(LCS_table{a}))
                        [~,size_LCS] = size(LCS_table{a});
                        [~,size_series] = size(series);
                        size_series_0 = size_series;
                        for aa = 1:1:size_series
                            if(extractAfter(series{aa},1) == 'X')
                                size_series_0 = size_series_0 - 1;
                            end
                        end
                        PX(1,a) = size_LCS/size_series_0;
                        px_model_son = 0;
                        for aa = 1:1:size_LCS
                            px_model_son = px_model_son + model{a}{2,LCS_table{a}{2,aa}};
                        end
                        [~,size_model_a] = size(model{a});
                        PX(2,a) = px_model_son/size_model_a;
                    end
                end
                m_PX = 0;p_PX = 0;
                for a = 1:1:size_model
                    if(PX(1,a) >= per_flag && m_PX < PX(2,a))
                        m_PX = PX(2,a);
                        p_PX = a;
                    end
                end
                if(p_PX == 0)
                    m_PX = 0;
                else
                    m_PX = PX(1,p_PX);
                end
%                 [m_PX,p_PX] = max(PX(1,:));
            end
        end
%--------------------反馈与模型融合 --------------------------------------
        if(m_PX >= per_flag) %融合模型LCS_table{p_PX} -> model{p_PX}
            [~,size_model_more] = size(model_more{p_PX});
            px_more = zeros(1,size_model_more);
            LCS_more = {};
            for a = 1:1:size_model_more
                LCS_more{a} = {};
                if(~isempty(model_more{p_PX}{a}))
                    LCS_more{a} = Dynamic_programming(model_more{p_PX}{a},series);
                end
            end
            for a = 1:1:size_model_more
                if(~isempty(LCS_more{a}))
                    [~,size_LCS_more] = size(LCS_more{a});
                    [~,size_more] = size(model_more{p_PX}{a});
                    px_more(1,a) = size_LCS_more/size_more;
                end
            end
            [m_PX_more,p_PX_more] = max(px_more(1,:));
%-------------------------------feedback_out---------------------------------------
            [~,size_PX_1] = size(LCS_more{p_PX_more});
            [~,size_model] = size(model_more{p_PX}{p_PX_more});
            if(size_PX_1 ~= 0)
                size_PX = LCS_more{p_PX_more}{2,size_PX_1};
            else
                size_PX = size_model;
            end
            feedback_out = [string('0'),string('0');string('0'),string('0')];
            if(size_PX < size_model)
                feed1 = cell(1,2);feed2 = cell(1,2);feed3 = cell(1,2);feed4 = cell(1,2);
                feed1{1} = string('0');feed2{1} = string('0');feed3{1} = string('0');feed4{1} = string('0');
                feed1{2} = 0;feed2{2} = 0;feed3{2} = 0;feed4{2} = 0;
                for i = size_PX+1:1:size_model
                    if(extractBefore(model_more{p_PX}{p_PX_more}{1,i},2) == '1' && feed1{2} == 0)
                        if(extractAfter(model_more{p_PX}{p_PX_more}{1,i},1) == '0')
                            feed1{2} = 1;
                        else
                            feed1{1} = extractAfter(model_more{p_PX}{p_PX_more}{1,i},1);
                        end
                    end
                    if(extractBefore(model_more{p_PX}{p_PX_more}{1,i},2) == '2' && feed2{2} == 0)
                        if(extractAfter(model_more{p_PX}{p_PX_more}{1,i},1) == '0')
                            feed2{2} = 1;
                        else
                            feed2{1} = extractAfter(model_more{p_PX}{p_PX_more}{1,i},1);
                        end
                    end
                    if(extractBefore(model_more{p_PX}{p_PX_more}{1,i},2) == '3' && feed3{2} == 0)
                        if(extractAfter(model_more{p_PX}{p_PX_more}{1,i},1) == '0')
                            feed3{2} = 1;
                        else
                            feed3{1} = extractAfter(model_more{p_PX}{p_PX_more}{1,i},1);
                        end
                    end
                    if(extractBefore(model_more{p_PX}{p_PX_more}{1,i},2) == '4' && feed4{2} == 0)
                        if(extractAfter(model_more{p_PX}{p_PX_more}{1,i},1) == '0')
                            feed4{2} = 1;
                        else
                            feed4{1} = extractAfter(model_more{p_PX}{p_PX_more}{1,i},1);
                        end
                    end
                end
                feedback_out(1,1) = feed1{1};feedback_out(1,2) = feed2{1};feedback_out(2,1) = feed3{1};feedback_out(2,2) = feed4{1};
            end
%---------------------feedback_out----------------------------------------------------

%---------------------模型融合----------------------------------------------------
            
            not_modeling = 0;
            for i = 1:1:size_series
                if(extractAfter(series{i},1) == 'X')
                    not_modeling = 1;
                    break;
                end
            end
            if(series_full == 1 && not_modeling == 0 && m_PX_more < 0.9)
                for i = 1:1:size_model_more
                    if(isempty(model_more{p_PX}{i}))
                        model_more{p_PX}{i} = series;
                        break;
                    end
                end
            end
            if(series_full == 1 && not_modeling == 0)
                
                model_index = cellfun(@str2double, cellfun(@num2str,model{p_PX}(2,:),'Unif',0));
                model_common_series = {};
                if(max(model_index) > 2)
                    size_model_one = size(model{p_PX});
                     model_common_series_cnt = 0;
                    for aa = 1:1:size_model_one(2)
                        model_common_series_cnt = model_common_series_cnt + 1;
                        if(model{p_PX}{2,aa} >= 2)
                            model_common_series{model_common_series_cnt} = model{p_PX}{1,aa};
                        else
                            model_common_series{model_common_series_cnt} = string('0');
                        end
                    end
                else
                    model_common_series = model{p_PX}(1,:);
                end
                
                [~,size_PX] = size(LCS_table{p_PX});
                for i = 1:1:size_PX %模型+1
                    if(~isempty(series{LCS_table{p_PX}{3,i}}))
                        model{p_PX}{2,LCS_table{p_PX}{2,i}} = model{p_PX}{2,LCS_table{p_PX}{2,i}} + 1;
                    end
                end
                [~,size_model] = size(model{p_PX});
                for i = 1:1:size_model
                    if(model{p_PX}{2,i} >= 12)
                        for j = 1:1:size_model
                            model{p_PX}{2,j} = fix(model{p_PX}{2,j} / 2);
                            if(model{p_PX}{2,j} < 1)
                                model{p_PX}{1,j} = [];
                                model{p_PX}{2,j} = [];
                            end
                        end
                        break;
                    end
                end
                new_model = {};[~,size_new_model] = size(new_model);
                cnt_model = 1;cnt_series = 1;cnt_p = 1;
                while(cnt_model <= size_model || cnt_series <= size_series)
                    if(cnt_p <= size_PX)
                        if(cnt_model < LCS_table{p_PX}{2,cnt_p})
                            if(~isempty(model{p_PX}{1,cnt_model}))
                                if(model_common_series{cnt_model} == '0')
                                    data_in = 0;
                                    for i = cnt_series:1:(LCS_table{p_PX}{3,cnt_p} - 1)
                                        if(model{p_PX}{1,cnt_model} == series{1,i})
                                            data_in = i;
                                            break;
                                        end
                                    end
                                    if(data_in ~= 0)
                                        if(data_in > cnt_series)
                                            cnt_series_i = cnt_series;
                                            for i = cnt_series_i:1:(data_in-1)
                                                new_model{1,size_new_model+1} = series{1,i};
                                                new_model{2,size_new_model+1} = 2;
                                                size_new_model = size_new_model + 1;
                                                cnt_series = cnt_series + 1;
                                            end
                                        end
                                        new_model{1,size_new_model+1} = model{p_PX}{1,cnt_model};
                                        new_model{2,size_new_model+1} = model{p_PX}{2,cnt_model} + 1;
                                        size_new_model = size_new_model + 1;
                                        cnt_series = cnt_series + 1;
                                    else
                                        new_model{1,size_new_model+1} = model{p_PX}{1,cnt_model};
                                        new_model{2,size_new_model+1} = model{p_PX}{2,cnt_model};
                                        size_new_model = size_new_model + 1;
                                    end
                                else
                                    new_model{1,size_new_model+1} = model{p_PX}{1,cnt_model};
                                    new_model{2,size_new_model+1} = model{p_PX}{2,cnt_model};
                                    size_new_model = size_new_model + 1;
                                end
                            end
                            cnt_model = cnt_model + 1;
                        else
                            if(cnt_series < LCS_table{p_PX}{3,cnt_p})
                                if(~isempty(series{cnt_series}))
                                    new_model{1,size_new_model+1} = series{1,cnt_series};
                                    new_model{2,size_new_model+1} = 3;
                                    size_new_model = size_new_model + 1;
                                end
                                cnt_series = cnt_series + 1;
                            else
                                if(~isempty(model{p_PX}{1,cnt_model}))
                                    new_model{1,size_new_model+1} = model{p_PX}{1,cnt_model};
                                    new_model{2,size_new_model+1} = model{p_PX}{2,cnt_model};
                                    size_new_model = size_new_model + 1;
                                end
                                cnt_model = cnt_model + 1;cnt_series = cnt_series + 1;cnt_p = cnt_p + 1;
                            end
                        end
                    else
                        if(cnt_model <= size_model)
                            if(isempty(model{p_PX}{1,cnt_model}))
                                cnt_model = cnt_model + 1;
                            else
                                new_model{1,size_new_model+1} = model{p_PX}{1,cnt_model};
                                new_model{2,size_new_model+1} = model{p_PX}{2,cnt_model};
                                size_new_model = size_new_model + 1;
                                cnt_model = cnt_model + 1;
                            end
                        else
                            if(cnt_series <= size_series)
                                new_model{1,size_new_model+1} = series{1,cnt_series};
                                new_model{2,size_new_model+1} = 3;
                                size_new_model = size_new_model + 1;
                                cnt_series = cnt_series + 1;
                            end
                        end
                    end
                end
                model{p_PX} = new_model;
                %增加一个新子模型
                %model_more{p_PX}{a} = series;
                model_select = p_PX;
            else
                model_select = 0;
            end
            
%---------------------模型融合----------------------------------------------------
%---------------------向后输出：data_buf----------------------------------------------------
            for i = 1:1:16
                if(p_PX < 10)
                    data_buf = string(num2str(p_PX));
                elseif(p_PX == 10)
                    data_buf = string('A');
                elseif(p_PX == 11)
                    data_buf = string('B');
                elseif(p_PX == 12)
                    data_buf = string('C');
                elseif(p_PX == 13)
                    data_buf = string('D');
                elseif(p_PX == 14)
                    data_buf = string('E');
                elseif(p_PX == 15)
                    data_buf = string('F');
                else
                    data_buf = string('Y');
                end
            end
%---------------------向后输出：data_buf----------------------------------------------------
        else
            if(series_full == 1)
                not_modeling = 0;
                for i = 1:1:size_series
                    if(extractAfter(series{i},1) == 'X')
                        not_modeling = 1;
                        break;
                    end
                end
                if(not_modeling == 0)
                    for i = 1:1:size_model
                        if(isempty(model{i}))
%                             seriess_1 = cell(1,4);seriess_2 = cell(1,4);seriess_3 = cell(1,4);seriess_4 = cell(1,4);
%                             seriess_1{2} = 0;seriess_2{2} = 0;seriess_3{2} = 0;seriess_4{2} = 0;
%                             seriess_1{1} = 0;seriess_2{1} = 0;seriess_3{1} = 0;seriess_4{1} = 0;
%                             seriess_1{3} = string('');seriess_2{3} = string('');seriess_3{3} = string('');seriess_4{3} = string('');
%                             seriess_1{4} = 0;seriess_2{4} = 0;seriess_3{4} = 0;seriess_4{4} = 0;
%                             for a = 2:1:size_series
%                                 if(extractBefore(series{a},2) == '1')
%                                     if(extractAfter(series{a},1) ~= '0')
%                                         seriess_1{2} = a;
%                                         seriess_1{3} = extractAfter(series{a},1);
%                                         seriess_1{4} = 1;
%                                     else
%                                         seriess_1{4} = 0;
%                                     end
%                                     if(seriess_1{4} == 0)
%                                         if(seriess_1{1} ~= 0)
%                                             series{seriess_1{1}} = string([num2str(1),char(seriess_1{3})]);
%                                         end
%                                         seriess_1{1} = 0;seriess_1{3} = string('');seriess_1{2} = 0;
%                                     else
%                                         if(seriess_1{1} == 0)
%                                             seriess_1{1} = seriess_1{2};seriess_1{2} = 0;
%                                         else
%                                             series{seriess_1{2}} = [];
%                                         end
%                                     end
%                                 elseif(extractBefore(series{a},2) == '2')
%                                     if(extractAfter(series{a},1) ~= '0')
%                                         seriess_2{2} = a;
%                                         seriess_2{3} = extractAfter(series{a},1);
%                                         seriess_2{4} = 1;
%                                     else
%                                         seriess_2{4} = 0;
%                                     end
%                                     if(seriess_2{4} == 0)
%                                         if(seriess_2{1} ~= 0)
%                                             series{seriess_2{1}} = string([num2str(2),char(seriess_2{3})]);
%                                         end
%                                         seriess_2{1} = 0;seriess_2{3} = string('');seriess_2{2} = 0;
%                                     else
%                                         if(seriess_2{1} == 0)
%                                             seriess_2{1} = seriess_2{2};seriess_2{2} = 0;
%                                         else
%                                             series{seriess_2{2}} = [];
%                                         end
%                                     end
%                                 elseif(extractBefore(series{a},2) == '3')
%                                     if(extractAfter(series{a},1) ~= '0')
%                                         seriess_3{2} = a;
%                                         seriess_3{3} = extractAfter(series{a},1);
%                                         seriess_3{4} = 1;
%                                     else
%                                         seriess_3{4} = 0;
%                                     end
%                                     if(seriess_3{4} == 0)
%                                         if(seriess_3{1} ~= 0)
%                                             series{seriess_3{1}} = string([num2str(3),char(seriess_3{3})]);
%                                         end
%                                         seriess_3{1} = 0;seriess_3{3} = string('');seriess_3{2} = 0;
%                                     else
%                                         if(seriess_3{1} == 0)
%                                             seriess_3{1} = seriess_3{2};seriess_3{2} = 0;
%                                         else
%                                             series{seriess_3{2}} = [];
%                                         end
%                                     end
%                                 elseif(extractBefore(series{a},2) == '4')
%                                     if(extractAfter(series{a},1) ~= '0')
%                                         seriess_4{2} = a;
%                                         seriess_4{3} = extractAfter(series{a},1);
%                                         seriess_4{4} = 1;
%                                     else
%                                         seriess_4{4} = 0;
%                                     end
%                                     if(seriess_4{4} == 0)
%                                         if(seriess_4{1} ~= 0)
%                                             series{seriess_4{1}} = string([num2str(4),char(seriess_4{3})]);
%                                         end
%                                         seriess_4{1} = 0;seriess_4{3} = string('');seriess_4{2} = 0;
%                                     else
%                                         if(seriess_4{1} == 0)
%                                             seriess_4{1} = seriess_4{2};seriess_4{2} = 0;
%                                         else
%                                             series{seriess_4{2}} = [];
%                                         end
%                                     end
%                                 end
% %                             for a = 2:1:size_series
% %                                 if(a >= 3 && extractBefore(series{a-1},2) == extractBefore(series{a},2) && extractAfter(series{a},1) ~= '0' && extractAfter(series{a-1},1) ~= '0')
% %                                     series{a-1} = [];
% %                                 end
%                             end
%                             series(cellfun(@isempty,series))=[];
                            [~,size_series] = size(series);
                            model{i}(1,:) = series;
                            model_more{i}{1} = series;
                            for a = 1:1:size_series
                                model{i}{2,a} = 3;
                            end
                            model_select = i;
                            break;
                        else
                            if(i == size_model)
                                model_select = 0;
                            end
                        end
                    end
                else
                    model_select = 0;
                end
            else
                model_select = 0;
            end
            data_buf = string('X');
        end
    end
%     model_buf = model;
end

% function [data_buf,model,model_select,feedback_out] = model_match(series,model,series_full,feedback_in,data_out_buf,per_flag)%model_match
% %     per_flag = 0.6;
% %     per_flag_1 = 0.8;
%     feedback_out = strings(2,2);
%     [~,size_series] = size(series);
%     %模型比较
%     [~,size_model] = size(model);
%     model_exist = 0;
%     for i = 1:1:size_model
%         if(~isempty(model{i}))
%             model_exist = 1;
%             break;
%         end
%     end
%     if(model_exist == 0 && series_full == 1)%如果没有模型,保存数据
%         not_modeling = 0;
%         for i = 1:1:size_series
%             if(extractAfter(series{i},1) == 'X')
%                 not_modeling = 1;
%                 break;
%             end
%         end
%         if(not_modeling == 0)
%             seriess_1 = cell(1,4);seriess_2 = cell(1,4);seriess_3 = cell(1,4);seriess_4 = cell(1,4);
%             seriess_1{2} = 0;seriess_2{2} = 0;seriess_3{2} = 0;seriess_4{2} = 0;
%             seriess_1{1} = 0;seriess_2{1} = 0;seriess_3{1} = 0;seriess_4{1} = 0;
%             seriess_1{3} = string('');seriess_2{3} = string('');seriess_3{3} = string('');seriess_4{3} = string('');
%             seriess_1{4} = 0;seriess_2{4} = 0;seriess_3{4} = 0;seriess_4{4} = 0;
%             for a = 2:1:size_series
%                 if(extractBefore(series{a},2) == '1')
%                     if(extractAfter(series{a},1) ~= '0')
%                         seriess_1{2} = a;
%                         seriess_1{3} = extractAfter(series{a},1);
%                         seriess_1{4} = 1;
%                     else
%                         seriess_1{4} = 0;
%                     end
%                     if(seriess_1{4} == 0)
%                         if(seriess_1{1} ~= 0)
%                             series{seriess_1{1}} = string([num2str(1),char(seriess_1{3})]);
%                         end
%                         seriess_1{1} = 0;seriess_1{3} = string('');seriess_1{2} = 0;
%                     else
%                         if(seriess_1{1} == 0)
%                             seriess_1{1} = seriess_1{2};seriess_1{2} = 0;
%                         else
%                             series{seriess_1{2}} = [];
%                         end
%                     end
%                 elseif(extractBefore(series{a},2) == '2')
%                     if(extractAfter(series{a},1) ~= '0')
%                         seriess_2{2} = a;
%                         seriess_2{3} = extractAfter(series{a},1);
%                         seriess_2{4} = 1;
%                     else
%                         seriess_2{4} = 0;
%                     end
%                     if(seriess_2{4} == 0)
%                         if(seriess_2{1} ~= 0)
%                             series{seriess_2{1}} = string([num2str(2),char(seriess_2{3})]);
%                         end
%                         seriess_2{1} = 0;seriess_2{3} = string('');seriess_2{2} = 0;
%                     else
%                         if(seriess_2{1} == 0)
%                             seriess_2{1} = seriess_2{2};seriess_2{2} = 0;
%                         else
%                             series{seriess_2{2}} = [];
%                         end
%                     end
%                 elseif(extractBefore(series{a},2) == '3')
%                     if(extractAfter(series{a},1) ~= '0')
%                         seriess_3{2} = a;
%                         seriess_3{3} = extractAfter(series{a},1);
%                         seriess_3{4} = 1;
%                     else
%                         seriess_3{4} = 0;
%                     end
%                     if(seriess_3{4} == 0)
%                         if(seriess_3{1} ~= 0)
%                             series{seriess_3{1}} = string([num2str(3),char(seriess_3{3})]);
%                         end
%                         seriess_3{1} = 0;seriess_3{3} = string('');seriess_3{2} = 0;
%                     else
%                         if(seriess_3{1} == 0)
%                             seriess_3{1} = seriess_3{2};seriess_3{2} = 0;
%                         else
%                             series{seriess_3{2}} = [];
%                         end
%                     end
%                 elseif(extractBefore(series{a},2) == '4')
%                     if(extractAfter(series{a},1) ~= '0')
%                         seriess_4{2} = a;
%                         seriess_4{3} = extractAfter(series{a},1);
%                         seriess_4{4} = 1;
%                     else
%                         seriess_4{4} = 0;
%                     end
%                     if(seriess_4{4} == 0)
%                         if(seriess_4{1} ~= 0)
%                             series{seriess_4{1}} = string([num2str(4),char(seriess_4{3})]);
%                         end
%                         seriess_4{1} = 0;seriess_4{3} = string('');seriess_4{2} = 0;
%                     else
%                         if(seriess_4{1} == 0)
%                             seriess_4{1} = seriess_4{2};seriess_4{2} = 0;
%                         else
%                             series{seriess_4{2}} = [];
%                         end
%                     end
%                 end
% %                 if(a >= 3 && extractBefore(series{a-1},2) == extractBefore(series{a},2) && extractAfter(series{a},1) ~= '0' && extractAfter(series{a-1},1) ~= '0')
% %                     series{a-1} = [];
% %                 end
%             end
%             series(cellfun(@isempty,series))=[];
%             [~,size_series] = size(series);
%             model{1}(1,:) = series;
%             for a = 1:1:size_series
%                 model{1}{2,a} = 4;
%             end
%             model_select = 1;
%             data_buf = string('X');
%         else
%             model_select = 0;
%             data_buf = string('0');
%         end
%     else
% %--------------------有模型，进行比较--------------------------------------
% %--------------------feedback_in，后级反馈调控 --------------------------------------
%         LCS_table = cell(1,15);
%         if(feedback_in ~= '' && feedback_in ~= '0')
%             if(feedback_in == 'A')
%                 feed_model = 10;
%             elseif(feedback_in == 'B')
%                 feed_model = 11;
%             elseif(feedback_in == 'C')
%                 feed_model = 12;
%             elseif(feedback_in == 'D')
%                 feed_model = 13;
%             elseif(feedback_in == 'E')
%                 feed_model = 14;
%             elseif(feedback_in == 'F')
%                 feed_model = 15;
%             else
%                 feed_model = str2double(feedback_in);
%             end
%         else
%             feed_model = 0;
%         end
% %--------------------data_out_buf，历史选择修正 --------------------------------------
%         if(data_out_buf ~= '' && data_out_buf ~= '0' && data_out_buf ~= 'X')
%             if(data_out_buf == 'A')
%                 data_out = 10;
%             elseif(data_out_buf == 'B')
%                 data_out = 11;
%             elseif(data_out_buf == 'C')
%                 data_out = 12;
%             elseif(data_out_buf == 'D')
%                 data_out = 13;
%             elseif(data_out_buf == 'E')
%                 data_out = 14;
%             elseif(data_out_buf == 'F')
%                 data_out = 15;
%             else
%                 data_out = str2double(data_out_buf);
%             end
%         else
%             data_out = 0;
%         end
% %--------------------模型匹配选择 --------------------------------------
%         PX = zeros(2,size_model);
%         if(feed_model ~= 0 && ~isempty(model{feed_model}))
%             LCS_table{feed_model} = {};
%             LCS_table{feed_model} = Dynamic_programming(model{feed_model},series);
%             [~,size_LCS] = size(LCS_table{feed_model});
%             [~,size_series] = size(series);
%             size_series_0 = size_series;
%             for aa = 1:1:size_series
%                 if(extractAfter(series{aa},1) == 'X')
%                     size_series_0 = size_series_0 - 1;
%                 end
%             end
%             PX(1,feed_model) = size_LCS/size_series_0;
%             px_model_son = 0;
%             for aa = 1:1:size_LCS
%                 px_model_son = px_model_son + model{feed_model}{2,LCS_table{feed_model}{2,aa}};
%             end
%             [~,size_model_a] = size(model{feed_model});
%             PX(2,feed_model) = px_model_son/size_model_a;
%         end
%         if(data_out ~= 0 && ~isempty(model{data_out}) && data_out ~= feed_model)
%             LCS_table{data_out} = {};
%             LCS_table{data_out} = Dynamic_programming(model{data_out},series);
%             [~,size_LCS] = size(LCS_table{data_out});
%             [~,size_series] = size(series);
%             size_series_0 = size_series;
%             for aa = 1:1:size_series
%                 if(extractAfter(series{aa},1) == 'X')
%                     size_series_0 = size_series_0 - 1;
%                 end
%             end
%             PX(1,data_out) = size_LCS/size_series_0;
%             px_model_son = 0;
%             for aa = 1:1:size_LCS
%                 px_model_son = px_model_son + model{data_out}{2,LCS_table{data_out}{2,aa}};
%             end
%             [~,size_model_a] = size(model{data_out});
%             PX(2,data_out) = px_model_son/size_model_a;
%         end
%         if(feed_model ~= 0 && PX(1,feed_model) >= per_flag)
%             if(data_out ~= 0 && data_out ~= feed_model && PX(1,data_out) >= per_flag)
%                 if(PX(2,feed_model) >= PX(2,data_out))
%                     m_PX = PX(1,feed_model);
%                     p_PX = feed_model;
%                 else
%                     m_PX = PX(1,data_out);
%                     p_PX = data_out;
%                 end
%             else
%                 m_PX = PX(1,feed_model);
%                 p_PX = feed_model;
%             end
%         else
%             if(data_out ~= 0 && data_out ~= feed_model && PX(1,data_out) >= per_flag)
%                 m_PX = PX(1,data_out);
%                 p_PX = data_out;
%             else
%                 for a = 1:1:size_model 
%                     LCS_table{a} = {};
%                     LCS_table{a} = Dynamic_programming(model{a},series);
%                 end
%                 PX = zeros(2,size_model);
%                 for a = 1:1:size_model
%                     if(~isempty(LCS_table{a}))
%                         [~,size_LCS] = size(LCS_table{a});
%                         [~,size_series] = size(series);
%                         size_series_0 = size_series;
%                         for aa = 1:1:size_series
%                             if(extractAfter(series{aa},1) == 'X')
%                                 size_series_0 = size_series_0 - 1;
%                             end
%                         end
%                         PX(1,a) = size_LCS/size_series_0;
%                         px_model_son = 0;
%                         for aa = 1:1:size_LCS
%                             px_model_son = px_model_son + model{a}{2,LCS_table{a}{2,aa}};
%                         end
%                         [~,size_model_a] = size(model{a});
%                         PX(2,a) = px_model_son/size_model_a;
%                     end
%                 end
%                 m_PX = 0;p_PX = 0;
% %                 for a = 1:1:size_model
% %                     if(PX(1,a) >= per_flag && m_PX < PX(2,a))
% %                         m_PX = PX(2,a);
% %                         p_PX = a;
% %                     end
% %                 end
% %                 if(p_PX == 0)
% %                     m_PX = 0;
% %                 else
% %                     m_PX = PX(1,p_PX);
% %                 end
%                 [m_PX,p_PX] = max(PX(1,:));
%             end
%         end
% %--------------------反馈与模型融合 --------------------------------------
%         if(m_PX >= per_flag) %融合模型LCS_table{p_PX} -> model{p_PX}
% %-------------------------------feedback_out---------------------------------------
%             [~,size_PX_1] = size(LCS_table{p_PX});
%             size_PX = LCS_table{p_PX}{2,size_PX_1};
%             [~,size_model] = size(model{p_PX});
%             feedback_out = [string('0'),string('0');string('0'),string('0')];
%             if(size_PX < size_model)
%                 feed1 = cell(1,3);feed2 = cell(1,3);feed3 = cell(1,3);feed4 = cell(1,3);
%                 feed1{1} = string('0');feed2{1} = string('0');feed3{1} = string('0');feed4{1} = string('0');
%                 feed1{2} = 0;feed2{2} = 0;feed3{2} = 0;feed4{2} = 0;
%                 feed1{3} = 0;feed2{3} = 0;feed3{3} = 0;feed4{3} = 0;
%                 for i = size_PX+1:1:size_model
%                     if(extractBefore(model{p_PX}{1,i},2) == '1' && model{p_PX}{2,i} >= 3 && feed1{2} == 0)
%                         if(extractAfter(model{p_PX}{1,i},1) == '0')
%                             feed1{2} = 1;
%                         else
%                             if(model{p_PX}{2,i} >= feed1{3})
%                                 feed1{3} = model{p_PX}{2,i};
%                                 feed1{1} = extractAfter(model{p_PX}{1,i},1);
%                             end
%                         end
%                     end
%                     if(extractBefore(model{p_PX}{1,i},2) == '2' && model{p_PX}{2,i} >= 3 && feed2{2} == 0)
%                         if(extractAfter(model{p_PX}{1,i},1) == '0')
%                             feed2{2} = 1;
%                         else
%                             if(model{p_PX}{2,i} >= feed2{3})
%                                 feed2{3} = model{p_PX}{2,i};
%                                 feed2{1} = extractAfter(model{p_PX}{1,i},1);
%                             end
%                         end
%                     end
%                     if(extractBefore(model{p_PX}{1,i},2) == '3' && model{p_PX}{2,i} >= 3 && feed3{2} == 0)
%                         if(extractAfter(model{p_PX}{1,i},1) == '0')
%                             feed3{2} = 1;
%                         else
%                             if(model{p_PX}{2,i} >= feed3{3})
%                                 feed3{3} = model{p_PX}{2,i};
%                                 feed3{1} = extractAfter(model{p_PX}{1,i},1);
%                             end
%                         end
%                     end
%                     if(extractBefore(model{p_PX}{1,i},2) == '4' && model{p_PX}{2,i} >= 3 && feed4{2} == 0)
%                         if(extractAfter(model{p_PX}{1,i},1) == '0')
%                             feed4{2} = 1;
%                         else
%                             if(model{p_PX}{2,i} >= feed4{3})
%                                 feed4{3} = model{p_PX}{2,i};
%                                 feed4{1} = extractAfter(model{p_PX}{1,i},1);
%                             end
%                         end
%                     end
%                 end
%                 feedback_out(1,1) = feed1{1};feedback_out(1,2) = feed2{1};feedback_out(2,1) = feed3{1};feedback_out(2,2) = feed4{1};
%             end
% %---------------------feedback_out----------------------------------------------------
% %---------------------模型融合----------------------------------------------------
%             not_modeling = 0;
%             for i = 1:1:size_series
%                 if(extractAfter(series{i},1) == 'X')
%                     not_modeling = 1;
%                     break;
%                 end
%             end
%             if(series_full == 1 && not_modeling == 0)
%                 [~,size_PX] = size(LCS_table{p_PX});
%                 for i = 1:1:size_PX %模型+1
%                     if(~isempty(series{LCS_table{p_PX}{3,i}}))
%                         model{p_PX}{2,LCS_table{p_PX}{2,i}} = model{p_PX}{2,LCS_table{p_PX}{2,i}} + 1;
%                     end
%                 end
%                 [~,size_model] = size(model{p_PX});
%                 for i = 1:1:size_model
%                     if(model{p_PX}{2,i} >= 8)
%                         for j = 1:1:size_model
%                             model{p_PX}{2,j} = fix(model{p_PX}{2,j} / 2);
%                             if(model{p_PX}{2,j} < 1)
%                                 model{p_PX}{1,j} = [];
%                                 model{p_PX}{2,j} = [];
%                             end
%                         end
%                         break;
%                     end
%                 end
%                 new_model = {};[~,size_new_model] = size(new_model);
%                 cnt_model = 1;cnt_series = 1;cnt_p = 1;
%                 while(cnt_model <= size_model || cnt_series <= size_series)
%                     if(cnt_p <= size_PX)
%                         if(cnt_model < LCS_table{p_PX}{2,cnt_p})
%                             if(~isempty(model{p_PX}{1,cnt_model}))
%                                 new_model{1,size_new_model+1} = model{p_PX}{1,cnt_model};
%                                 new_model{2,size_new_model+1} = model{p_PX}{2,cnt_model};
%                                 size_new_model = size_new_model + 1;
%                             end
%                             cnt_model = cnt_model + 1;
%                         else
%                             if(cnt_series < LCS_table{p_PX}{3,cnt_p})
%                                 if(~isempty(series{cnt_series}))
%                                     new_model{1,size_new_model+1} = series{1,cnt_series};
%                                     new_model{2,size_new_model+1} = 2;
%                                     size_new_model = size_new_model + 1;
%                                 end
%                                 cnt_series = cnt_series + 1;
%                             else
%                                 if(~isempty(model{p_PX}{1,cnt_model}))
%                                     new_model{1,size_new_model+1} = model{p_PX}{1,cnt_model};
%                                     new_model{2,size_new_model+1} = model{p_PX}{2,cnt_model};
%                                     size_new_model = size_new_model + 1;
%                                 end
%                                 cnt_model = cnt_model + 1;cnt_series = cnt_series + 1;cnt_p = cnt_p + 1;
%                             end
%                         end
%                     else
%                         if(cnt_model <= size_model)
%                             if(isempty(model{p_PX}{1,cnt_model}))
%                                 cnt_model = cnt_model + 1;
%                             else
%                                 new_model{1,size_new_model+1} = model{p_PX}{1,cnt_model};
%                                 new_model{2,size_new_model+1} = model{p_PX}{2,cnt_model};
%                                 size_new_model = size_new_model + 1;
%                                 cnt_model = cnt_model + 1;
%                             end
%                         else
%                             if(cnt_series <= size_series)
%                                 new_model{1,size_new_model+1} = series{1,cnt_series};
%                                 new_model{2,size_new_model+1} = 2;
%                                 size_new_model = size_new_model + 1;
%                                 cnt_series = cnt_series + 1;
%                             end
%                         end
%                     end
%                 end
%                 model{p_PX} = new_model;
%                 model_select = p_PX;
%             else
%                 model_select = 0;
%             end
% %---------------------模型融合----------------------------------------------------
% %---------------------向后输出：data_buf----------------------------------------------------
%             for i = 1:1:16
%                 if(p_PX < 10)
%                     data_buf = string(num2str(p_PX));
%                 elseif(p_PX == 10)
%                     data_buf = string('A');
%                 elseif(p_PX == 11)
%                     data_buf = string('B');
%                 elseif(p_PX == 12)
%                     data_buf = string('C');
%                 elseif(p_PX == 13)
%                     data_buf = string('D');
%                 elseif(p_PX == 14)
%                     data_buf = string('E');
%                 elseif(p_PX == 15)
%                     data_buf = string('F');
%                 else
%                     data_buf = string('Y');
%                 end
%             end
% %---------------------向后输出：data_buf----------------------------------------------------
%         else
%             if(series_full == 1)
%                 not_modeling = 0;
%                 for i = 1:1:size_series
%                     if(extractAfter(series{i},1) == 'X')
%                         not_modeling = 1;
%                         break;
%                     end
%                 end
%                 if(not_modeling == 0)
%                     for i = 1:1:size_model
%                         if(isempty(model{i}))
%                             seriess_1 = cell(1,4);seriess_2 = cell(1,4);seriess_3 = cell(1,4);seriess_4 = cell(1,4);
%                             seriess_1{2} = 0;seriess_2{2} = 0;seriess_3{2} = 0;seriess_4{2} = 0;
%                             seriess_1{1} = 0;seriess_2{1} = 0;seriess_3{1} = 0;seriess_4{1} = 0;
%                             seriess_1{3} = string('');seriess_2{3} = string('');seriess_3{3} = string('');seriess_4{3} = string('');
%                             seriess_1{4} = 0;seriess_2{4} = 0;seriess_3{4} = 0;seriess_4{4} = 0;
%                             for a = 2:1:size_series
%                                 if(extractBefore(series{a},2) == '1')
%                                     if(extractAfter(series{a},1) ~= '0')
%                                         seriess_1{2} = a;
%                                         seriess_1{3} = extractAfter(series{a},1);
%                                         seriess_1{4} = 1;
%                                     else
%                                         seriess_1{4} = 0;
%                                     end
%                                     if(seriess_1{4} == 0)
%                                         if(seriess_1{1} ~= 0)
%                                             series{seriess_1{1}} = string([num2str(1),char(seriess_1{3})]);
%                                         end
%                                         seriess_1{1} = 0;seriess_1{3} = string('');seriess_1{2} = 0;
%                                     else
%                                         if(seriess_1{1} == 0)
%                                             seriess_1{1} = seriess_1{2};seriess_1{2} = 0;
%                                         else
%                                             series{seriess_1{2}} = [];
%                                         end
%                                     end
%                                 elseif(extractBefore(series{a},2) == '2')
%                                     if(extractAfter(series{a},1) ~= '0')
%                                         seriess_2{2} = a;
%                                         seriess_2{3} = extractAfter(series{a},1);
%                                         seriess_2{4} = 1;
%                                     else
%                                         seriess_2{4} = 0;
%                                     end
%                                     if(seriess_2{4} == 0)
%                                         if(seriess_2{1} ~= 0)
%                                             series{seriess_2{1}} = string([num2str(2),char(seriess_2{3})]);
%                                         end
%                                         seriess_2{1} = 0;seriess_2{3} = string('');seriess_2{2} = 0;
%                                     else
%                                         if(seriess_2{1} == 0)
%                                             seriess_2{1} = seriess_2{2};seriess_2{2} = 0;
%                                         else
%                                             series{seriess_2{2}} = [];
%                                         end
%                                     end
%                                 elseif(extractBefore(series{a},2) == '3')
%                                     if(extractAfter(series{a},1) ~= '0')
%                                         seriess_3{2} = a;
%                                         seriess_3{3} = extractAfter(series{a},1);
%                                         seriess_3{4} = 1;
%                                     else
%                                         seriess_3{4} = 0;
%                                     end
%                                     if(seriess_3{4} == 0)
%                                         if(seriess_3{1} ~= 0)
%                                             series{seriess_3{1}} = string([num2str(3),char(seriess_3{3})]);
%                                         end
%                                         seriess_3{1} = 0;seriess_3{3} = string('');seriess_3{2} = 0;
%                                     else
%                                         if(seriess_3{1} == 0)
%                                             seriess_3{1} = seriess_3{2};seriess_3{2} = 0;
%                                         else
%                                             series{seriess_3{2}} = [];
%                                         end
%                                     end
%                                 elseif(extractBefore(series{a},2) == '4')
%                                     if(extractAfter(series{a},1) ~= '0')
%                                         seriess_4{2} = a;
%                                         seriess_4{3} = extractAfter(series{a},1);
%                                         seriess_4{4} = 1;
%                                     else
%                                         seriess_4{4} = 0;
%                                     end
%                                     if(seriess_4{4} == 0)
%                                         if(seriess_4{1} ~= 0)
%                                             series{seriess_4{1}} = string([num2str(4),char(seriess_4{3})]);
%                                         end
%                                         seriess_4{1} = 0;seriess_4{3} = string('');seriess_4{2} = 0;
%                                     else
%                                         if(seriess_4{1} == 0)
%                                             seriess_4{1} = seriess_4{2};seriess_4{2} = 0;
%                                         else
%                                             series{seriess_4{2}} = [];
%                                         end
%                                     end
%                                 end
% %                             for a = 2:1:size_series
% %                                 if(a >= 3 && extractBefore(series{a-1},2) == extractBefore(series{a},2) && extractAfter(series{a},1) ~= '0' && extractAfter(series{a-1},1) ~= '0')
% %                                     series{a-1} = [];
% %                                 end
%                             end
%                             series(cellfun(@isempty,series))=[];
%                             [~,size_series] = size(series);
%                             model{i}(1,:) = series;
%                             for a = 1:1:size_series
%                                 model{i}{2,a} = 4;
%                             end
%                             model_select = i;
%                             break;
%                         else
%                             if(i == size_model)
%                                 model_select = 0;
%                             end
%                         end
%                     end
%                 else
%                     model_select = 0;
%                 end
%             else
%                 model_select = 0;
%             end
%             data_buf = string('X');
%             
%         end
%     end
% %     model_buf = model;
% end
