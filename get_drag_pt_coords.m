function [x,y] = get_drag_pt_coords(data)

%get drag point coordinates
L = length(data.drag_pts);
x = zeros(1, L);
y = zeros(1, L);
for i = 1:L
    x(i) = data.drag_pts{i}.XData;
    y(i) = data.drag_pts{i}.YData;
end

end
