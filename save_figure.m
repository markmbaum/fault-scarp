function save_figure(hObject, ~)

data = guidata(hObject);

[pathstr,~,~] = fileparts(data.input_path);

saveas(data.fig, [pathstr, '/saved-figure']);

end
