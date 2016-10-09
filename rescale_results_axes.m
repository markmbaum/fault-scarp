function rescale_results_axes(hObject, ~)

%activate IC axes
handles = guihandles(hObject);
axes(handles.results_ax);

if(hObject.Value)
    axis equal
    data = handles.control_table.Data;
    if(~isempty(data))
        ax_margins(handles.results_ax, data(:,1), data(:,2));
    end
else
    axis normal
end

end
