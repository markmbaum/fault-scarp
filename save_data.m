function save_data(hObject, ~)

handles = guihandles(hObject);
data = guidata(hObject);

if(data.table_edited)
    %get file path to save at
    [pathstr,name,ext] = fileparts(data.input_filename);
    table_data = handles.control_table.Data;
    if(isempty(pathstr))
        fn = [name '-edited.csv'];
    else
        fn = [pathstr '/' name '-edited.csv'];
    end
    %write data and print a message
    dlmwrite(fn, table_data);
    fprintf('Edited data written in Current Folder to file: %s\n', fn);

    %revert save button and associated data
    data.table_edited = false;
    handles.control_button_save.ForegroundColor = [0.5 0.5 0.5];

    guidata(hObject, data);

end

end
