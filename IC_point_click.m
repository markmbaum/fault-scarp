function IC_point_click(hObject, ~)

%get data and activate dragging
data = guidata(hObject);
handles = guihandles(hObject);

%reset color of previoulsy active point
if(data.last_active_pt ~= 0)
    data.drag_pts{data.last_active_pt}.Color = data.inactive_IC_color;
end

%get the handle of the clicked point and set its color to the active color
active_pt_idx = 0;
i = 1;
while(active_pt_idx == 0)
    if(data.drag_pts{i} == hObject)
        active_pt_idx = i;
    end
    i = i + 1;
end
active_pt = data.drag_pts{active_pt_idx};
active_pt.Color = data.active_IC_color;
%store index of last active point
data.last_active_pt = active_pt_idx;
guidata(hObject, data);

%get the lines adjacent to the clicked point, setting their colors as well
if(active_pt_idx == 1)
    left_line = 0;
    right_line = data.drag_pt_lines{1};

    right_line.Color = data.active_IC_color;

    enable_horz = false;
elseif(active_pt_idx == length(data.drag_pts))
    left_line = data.drag_pt_lines{length(data.drag_pt_lines)};
    right_line = 0;

    left_line.Color = data.active_IC_color;

    enable_horz = false;
else
    left_line = data.drag_pt_lines{active_pt_idx - 1};
    right_line = data.drag_pt_lines{active_pt_idx};

    left_line.Color = data.active_IC_color;
    right_line.Color = data.active_IC_color;

    enable_horz = true;
end

%set dragging functions
set(data.fig, 'WindowButtonMotionFcn',...
  {@drag_point, handles.IC_ax, active_pt, left_line, right_line, enable_horz});

set(data.fig, 'WindowButtonUpFcn',...
  {@stop_drag, active_pt, left_line, right_line, data.inactive_IC_color});

end
