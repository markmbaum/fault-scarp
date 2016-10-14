function save_image(hObject, ~)

data = guidata(hObject);

[pathstr,~,~] = fileparts(data.input_path);

saveas(data.fig, [pathstr, '/saved-image.jpg'], 'jpeg');

end
