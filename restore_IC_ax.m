function restore_IC_ax(hObject, ~)

handles = guihandles(hObject);
data = guidata(hObject);

%get x and y observation data
table_data = handles.control_table.Data;
x = table_data(:,1);
y = table_data(:,2);

%reinitialize the IC axes
cla(handles.IC_ax);
data = init_IC_ax(x, y, handles, data);

guidata(hObject, data);

end
