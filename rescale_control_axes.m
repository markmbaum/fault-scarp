function rescale_control_axes(hObject, ~)

%activate IC axes
handles = guihandles(hObject);
axes(handles.control_ax);

if(hObject.Value)
    axis equal
else
    axis normal
end

end
