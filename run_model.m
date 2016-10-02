function run_model(hObject, ~)

handles = guihandles(hObject);
data = guidata(hObject);

%get the dragged IC points
[x_drag, y_drag] = get_drag_pt_coords(data);

%interpolate between IC points to get spatial nodes for solver
N_x = 15;
x = linspace(x_drag(1), x_drag(end), N_x);
y = interp1(x_drag, y_drag, x);

end
