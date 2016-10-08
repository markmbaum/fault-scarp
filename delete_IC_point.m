function delete_IC_point(hObject, ~)

handles = guihandles(hObject);
data = guidata(hObject);

if(isempty(handles.control_table.Data))
    errordlg('No data loaded');

else
    %get drag point coordinates
    L = length(data.drag_pts);
    [x, y] = get_drag_pt_coords(data);

    if(isempty(handles.control_table.Data))
        errordlg('No data loaded');

    elseif(data.last_active_pt)
        idx = data.last_active_pt;
        if(L < 5)
            %do not allow fewer than 4 points
            errordlg('There may not be fewer than 4 initial condition points.',...
                      'Invalid Deletion');
        elseif((idx == 1) || (idx == L))
            errordlg({'Cannot delete points on the edge.',...
                      'Choose an interior point to delete.'},...
                      'Invalid Deletion');
        else
            %delete the selected drag point
            x_drag = [x(1:idx-1), x(idx+1:L)];
            y_drag = [y(1:idx-1), y(idx+1:L)];

            %clear old draggables
            data = delete_draggables(data);
            %plot new set of draggables
            data = plot_IC_draggables(x_drag, y_drag, handles, data);
            %write angles
            data = display_IC_angles(handles, data);

            %reset last active point
            idx = idx - randi([0 1]);
            data.last_active_pt = idx;
            data.drag_pts{idx}.Color = data.active_IC_color;

            %store data
            guidata(hObject, data);
        end
    end
end

end
