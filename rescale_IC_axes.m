function rescale_IC_axes(hObject, ~)

%activate IC axes
handles = guihandles(hObject);
axes(handles.IC_ax);

if(hObject.Value)
    axis equal
    data = handles.control_table.Data;
    if(~isempty(data))
        ax_margins(handles.IC_ax, data(:,1), data(:,2));
    end
else
    axis normal
end

end
