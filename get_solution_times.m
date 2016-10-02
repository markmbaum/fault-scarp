function [T, total_time, error_flag] = get_solution_times(handles)

%get solution times from input box strings
T = [str2double(handles.solution_time_1.String),
    str2double(handles.solution_time_2.String),
    str2double(handles.solution_time_3.String),
    str2double(handles.solution_time_4.String),
    str2double(handles.solution_time_5.String)];

%filter out NaNs
T = T(~isnan(T));

total_time = str2double(handles.total_time.String);

if(isempty(T))
    error_flag = true;
    errordlg(...
      {'You must choose solution times to compare with the observed data!',...
      'That''s the whole point!'},...
      'Solution Times Error')

elseif(isnan(total_time) || (total_time < max(T)))
    error_flag = true;
    errordlg(...
      {'The total time must be a number which is greater than or equal to',...
      'the highest solution time. The following condition must be met:',...
      '    total_time >= max(solution_times)'},...
      'Total Time Error');

else
    error_flag = false;
end

end
