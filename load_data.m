function load_data(hObject, ~)

handles = guihandles(hObject);
data = guidata(hObject);

%get file name
[filename, pathname] = uigetfile({'*.*'}, 'File Selector');
%fn = 'fakedata.txt';

%if filename is successfully chose, read data in
if(filename)

    data.input_path = [pathname, filename];

    %attempt to read the file
    input_data = dlmread(data.input_path);

    %assign the first column to x and the second to y
    x = input_data(:,1);
    y = input_data(:,2);

    %sort by x
    [x, idx] = sort(x);
    y = y(idx);

    %update table
    handles.control_table.Data = [x y];

    %clear axes
    clear_axes(handles);

    %update axes
    data = init_control_ax(x, y, handles, data);
    data = init_IC_ax(x, y, handles, data);

    %make run button available
    handles.run_button.ForegroundColor = [0 0 0];

    %revert save button and associated data
    data.table_edited = false;
    handles.control_button_save.ForegroundColor = [0.5 0.5 0.5];

    %store variables in GUI structure
    guidata(hObject, data);
end

end
