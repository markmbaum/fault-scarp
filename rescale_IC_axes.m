function rescale_IC_axes(hObject, ~)

%activate IC axes
handles = guihandles(hObject);
axes(handles.IC_ax);

if(hObject.Value)
    axis equal
else
    axis normal
end

end
