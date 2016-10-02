function drag_point(hObject, ~, ax, point, left_line, right_line, eh)

%get dragged coordinates
coords = get(ax, 'CurrentPoint');
x = coords(1,1,1);
y = coords(1,2,1);

%set point position
if(eh)
    point.XData = x;
end
point.YData = y;
%set left line position
if(left_line ~= 0)
    line_y = left_line.YData;
    line_y(2) = y;
    left_line.YData = line_y;
    if(eh)
        line_x = left_line.XData;
        line_x(2) = x;
        left_line.XData = line_x;
    end
end

%set right line position
if(right_line ~= 0)
    line_y = right_line.YData;
    line_y(1) = y;
    right_line.YData = line_y;
    if(eh)
        line_x = right_line.XData;
        line_x(1) = x;
        right_line.XData = line_x;
    end
end

data = guidata(point);
handles = guihandles(point);
data = display_IC_angles(handles, data);
guidata(point, data);

end
