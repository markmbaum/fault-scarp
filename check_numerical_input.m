function check_numerical_input(hObject, ~)

s = hObject.String;
fprintf(s);
if(~strcmp(s, '') && isnan(str2double(s)))
    errordlg('Solution times must be numbers.', 'Input Error')
end

end
