function stop_drag(hObject, ~, point, left_line, right_line, inactive_color)

data = guidata(hObject);
handles = guihandles(hObject);

%unset dragging functions
set(data.fig, 'WindowButtonMotionFcn', '');
set(data.fig, 'WindowButtonUpFcn', '');

%revert colors of lines
if(left_line ~= 0)
    left_line.Color = inactive_color;
end
if(right_line ~= 0)
    right_line.Color = inactive_color;
end

data = display_IC_angles(handles, data);

guidata(point, data);

end
