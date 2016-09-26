function [T, total_time] = get_solution_times(handles)

%get solution times from input box strings
T = [str2double(handles.solution_time_1.String),
    str2double(handles.solution_time_2.String),
    str2double(handles.solution_time_3.String),
    str2double(handles.solution_time_4.String),
    str2double(handles.solution_time_5.String)];

%filter out NaNs
T = T(~isnan(T));

total_time = str2double(handles.total_time.String);

if(isnan(total_time) || (total_time < max(T)))
    errordlg('The total time must be a number and larger than all solution times.',...
              'Total Time Error');
end

end
