function add_IC_point(hObject, ~)

handles = guihandles(hObject);
data = guidata(hObject);

if(isempty(handles.control_table.Data))
    errordlg('No data loaded');

else

    %get drag point coordinates
    L = length(data.drag_pts);
    [x, y] = get_drag_pt_coords(data);

    if(L >= 10)
        errordlg({'You probably do not need more',...
                'than 10 initial condition points'},...
                'Invalid Addition');
    elseif(isempty(handles.control_table.Data))
        errordlg('No data loaded');

    elseif(data.last_active_pt)

          idx = data.last_active_pt;

          %get the lines adjacent to the clicked point
          if(idx == 1)
              %if the selected point is left most, add a point to the right of it
              %with associated lines
              x_drag = [x(1), mean(x(1:2)), x(2:end)];
              y_drag = [y(1), mean(y(1:2)), y(2:end)];
          elseif(idx == L)
              %if the selected point is right most, add a point to the left of it
              %with associated lines
              x_drag = [x(1:L-1), mean(x(L-1:L)), x(L)];
              y_drag = [y(1:L-1), mean(y(L-1:L)), y(L)];
          else
              %if the selected point isn't on the edges of the IC lines, replace it
              %with two points
              x1 = x(idx-1); y1 = y(idx-1);
              x2 = x(idx+1); y2 = y(idx+1);
              xrange = x2 - x1; yrange = y2 - y1;
              x_drag = [x(1:idx-1), x1 + xrange/3, x2 - xrange/3, x(idx+1:L)];
              y_drag = [y(1:idx-1), y1 + yrange/3, y2 - yrange/3, y(idx+1:L)];
          end

        %clear old draggables
        data = delete_draggables(data);
        %plot new set of draggables
        data = plot_IC_draggables(x_drag, y_drag, handles, data);
        %write angles
        data = display_IC_angles(handles, data);

        %reset last active point
        L = length(data.drag_pts);
        if(idx == 1)
            data.last_active_pt = 2;
            data.drag_pts{2}.Color = data.active_IC_color;
        elseif(idx == L - 1)
            data.last_active_pt = L - 1;
            data.drag_pts{L-1}.Color = data.active_IC_color;
        else
            idx = idx + randi([0 1]);
            data.last_active_pt = idx;
            data.drag_pts{idx}.Color = data.active_IC_color;
        end

        %store data
        guidata(hObject, data);
    end
end
