function save_data(hObject, ~)

handles = guihandles(hObject);
data = guidata(hObject);

if(data.table_edited)

    %write data and print a message
    dlmwrite(data.input_path, handles.control_table.Data);

    fprintf('Edited data written to file: %s\n', data.input_path);

    %revert save button and associated data
    data.table_edited = false;
    handles.control_button_save.ForegroundColor = [0.5 0.5 0.5];

    guidata(hObject, data);

end

end
