function load_data(hObject, ~)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

handles = guihandles(hObject);
data = guidata(hObject);

%get file name
fn = uigetfile({'*.*'});
%fn = 'fakedata.txt';

%if filename is successfully chose, read data in
if(fn)

    data.input_filename = fn;

    %attempt to read the file
    input_data = dlmread(fn);

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

    %store variables in GUI structure
    guidata(hObject, data);
end

end
