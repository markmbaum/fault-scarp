function data = plot_IC_draggables(x_drag, y_drag, handles, data)

L = length(x_drag);

%plot line segments in between
data.drag_pt_lines = cell(1, L - 1);
for i = 1:L - 1
    data.drag_pt_lines{i} = line(...
        [x_drag(i) x_drag(i+1)], [y_drag(i) y_drag(i+1)],...
        'Parent', handles.IC_ax,...
        'LineStyle', '--',...
        'Color', data.inactive_IC_color,...
        'LineWidth', 2);
end
%plot the draggable points
data.drag_pts = cell(1, L);
for i = 1:L
    data.drag_pts{i} = line(x_drag(i), y_drag(i),...
        'Parent', handles.IC_ax,...
        'Color', data.inactive_IC_color,...
        'Marker', '.',...
        'MarkerSize', data.IC_point_size,...
        'ButtonDownFcn', @IC_point_click);
end
%set last active point to zero, or null
data.last_active_pt = 0;

end
