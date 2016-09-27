function save_data(hObject, ~)

handles = guihandles(hObject);
data = guidata(hObject);

if(data.table_edited)
    [pathstr,name,ext] = fileparts(data.input_filename);
    table_data = handles.control_table.Data;
    if(isempty(pathstr))
        fn = [name '-edited.csv'];
    else
        fn = [pathstr '/' name '-edited.csv'];
    end
    dlmwrite(fn, table_data);
    fprintf('Edited data written to file: %s\n', fn);
end

end
