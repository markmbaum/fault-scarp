function data = display_IC_angles(handles, data)

%delete previous angles, if any
for i = 1:length(data.angles)
    if(~isempty(data.angles{i}))
        delete(data.angles{i});
    end
end

%get drag point coordinates
[x, y] = get_drag_pt_coords(data);

%get y location
yloc = max(handles.IC_ax.YLim);

%write angles
data.angles = cell(1, length(x) - 1);
for i = 1:length(x)-1
    xloc = (x(i) + x(i+1))/2;
    dy = y(i+1) - y(i);
    dx = x(i+1) - x(i);
    theta = round(atan2d(dy, dx), 3, 'significant');
    data.angles{i} = text(xloc, yloc,...
            ['Angle = ', num2str(theta), '^{\circ}'],...
            'VerticalAlignment', 'bottom',...
            'HorizontalAlignment', 'center',...
            'Fontsize', 12);
end

end
