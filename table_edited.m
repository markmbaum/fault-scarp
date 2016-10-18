function table_edited(hObject, ~)

data = guidata(hObject);
handles = guihandles(hObject);

if(~data.table_edited)

    %GUIdata updates
    data.table_edited = true;
    handles.control_button_save.ForegroundColor = [0, 0, 0];

    %store updates
    guidata(hObject, data);

end

%replot
table_data = handles.control_table.Data;
clear_axes(handles);
data = init_IC_ax(table_data(:,1), table_data(:,2), handles, data);
data = init_control_ax(table_data(:,1), table_data(:,2), handles, data);

guidata(hObject, data);

end
