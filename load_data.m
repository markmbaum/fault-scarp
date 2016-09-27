function load_data(hObject, ~)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

handles = guihandles(hObject);
data = guidata(hObject);

%get file name
fn = uigetfile;

data.input_filename = fn;

%attempt to read the file
input_data = dlmread(fn);

%assign the first column to x and the second to y
x = input_data(:,1);
y = input_data(:,2);

%update table
handles.control_table.Data = [x y];

%clear axes
clear_observations(handles);
%update plots of observations
plot_observations(x, y, handles);

guidata(hObject, data);

end
