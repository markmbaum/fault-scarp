function clear_times(hObject, ~)
%clear the solution time text boxes of input

handles = guihandles(hObject);

handles.solution_time_1.String = '';
handles.solution_time_2.String = '';
handles.solution_time_3.String = '';
handles.solution_time_4.String = '';
handles.solution_time_5.String = '';
handles.solution_time_6.String = '';

end
