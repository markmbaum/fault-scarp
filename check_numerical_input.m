function check_numerical_input(hObject, ~)

s = hObject.String;

if(~isempty(s) && isnan(str2double(s)))
    hObject.BackgroundColor = 'r';
    errordlg('Input value must be a number.', 'Input Error')
    hObject.BackgroundColor = [0.94 0.94 0.94];
    hObject.String = '';
end

end
