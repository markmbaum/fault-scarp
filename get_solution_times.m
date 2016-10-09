function [T, error_flag] = get_solution_times(handles)

%get solution times from input box strings
T = [str2double(handles.solution_time_1.String),
    str2double(handles.solution_time_2.String),
    str2double(handles.solution_time_3.String),
    str2double(handles.solution_time_4.String),
    str2double(handles.solution_time_5.String),
    str2double(handles.solution_time_6.String)];

%filter out NaNs
T = T(~isnan(T));

if(isempty(T))
    error_flag = true;
    errordlg(...
      {'You must choose solution times to compare with the observed data!',...
      'That''s the whole point!'},...
      'Solution Times Error')

elseif(length(T) < 2)
    error_flag = true;
    errordlg(...
      'You must enter at least 2 solution times.', 'Solution Times Error');

elseif(any(T <= 0))
    error_flat = true;
    errordlg('Solution times must be greater than zero', 'Solution times error')

else
    error_flag = false;
end

end
