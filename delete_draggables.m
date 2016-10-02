function data = delete_draggables(data)

%clear draggables
for i = 1:length(data.drag_pts)
    delete(data.drag_pts{i});
end
for i = 1:length(data.drag_pt_lines)
    delete(data.drag_pt_lines{i});
end

end
