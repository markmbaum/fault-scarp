function table_edited(hObject, ~)

data = guidata(hObject);
handles = guihandles(hObject);

if(~data.table_edited)

    %GUIdata updates
    data.table_edited = true;
    handles.control_button_save.ForegroundColor = [0 0 0];

    %store updates
    guidata(hObject, data);

end

%replot
table_data = handles.control_table.Data;
clear_observations(handles);
plot_observations(table_data(:,1), table_data(:,2), handles);

end
