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
x_drag = [x(1), x(1) + xrange/3, x(L) - xrange/3, x(L)];
y_drag = [y(1), y(1), y(L), y(L)];

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
handles.IC_ax.XColor = data.inactive_IC_color;

end
