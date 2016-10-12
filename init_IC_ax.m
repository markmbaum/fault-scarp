function data = init_IC_ax(x, y, handles, data)

%plot observations in IC axis
axes(handles.IC_ax);
h1 = plot(x, y, 'ko', 'Tag', 'observations');
%set margins
ax_margins(handles.IC_ax, x, y);

%initialize the IC draggables
L = length(x);
xmin = min(x); xmax = max(x);
xrange = xmax - xmin;

%generate coordinates for 4 draggable points
xmin = min(x); xmax = max(x); ymin = min(y); ymax = max(y);
x_drag = [xmin, xmin + xrange/3, xmax - xrange/3, xmax];
y_drag = [ymin, ymin, ymax, ymax];
if(y(1) > y(end))
    y_drag = fliplr(y_drag);
end

%plot points, plot connecting lines, and set last_active_pt to zero
data = plot_IC_draggables(x_drag, y_drag, handles, data);

%set legend
legend([h1, data.drag_pts{1}],...
        {'Observed Scarp Profile',...
            'Initial Scarp Profile (Set by Dragging)'},...
        'Location', 'southoutside',...
        'Orientation', 'horizontal',...
        'Fontsize', 12);

%show the segment angles
data = display_IC_angles(handles, data);

%change x axis color
%handles.IC_ax.XColor = data.inactive_IC_color;

end
