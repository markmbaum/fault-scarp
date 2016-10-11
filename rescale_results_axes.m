function rescale_results_axes(hObject, ~)

%activate IC axes
handles = guihandles(hObject);
axes(handles.results_ax);

if(hObject.Value)
    axis equal
else
    axis normal
end

end
