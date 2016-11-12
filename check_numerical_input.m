function check_numerical_input(hObject, ~)
%check that input to numerical text box fields is acceptable
% and provide easter eggs

s = lower(hObject.String);

if(~isempty(s) && isnan(str2double(s)))

    %easter eggs
    if(strcmp(s, 'hanlon'))
        figure;
        img = load('i1.mat');
        image(img.i);
        axis equal;
    elseif(strcmp(s, 'dade'))
        figure;
        img = load('i2.mat');
        image(img.i);
        axis equal;
    else
        errordlg('Input value must be a number.', 'Input Error');
    end

    hObject.BackgroundColor = 'r';
    hObject.BackgroundColor = [0.94 0.94 0.94];
    hObject.String = '';
end

end
