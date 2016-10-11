function check_numerical_input(hObject, ~)

s = lower(hObject.String);

if(~isempty(s) && isnan(str2double(s)))

    %easter eggs
    if(strcmp(s, 'handel'))
        load handel;
        sound(y, Fs);
    elseif(strcmp(s, 'penny'))
        figure;
        penny;
    elseif(strcmp(s, 'image'))
        figure;
        image;
    elseif(strcmp(s, 'logo'))
        logo;
    elseif(strcmp(s, 'lorenz'))
        lorenz;
    elseif(strcmp(s, 'why'))
        why;
    elseif(strcmp(s, 'fifteen'))
        fifteen;
    elseif(strcmp(s, 'xpbombs'))
        xpbombs;
    elseif(strcmp(s, 'heart') || strcmp(s, 'love'))
        x=[-2:.001:2];
        y=(sqrt(cos(x)).*cos(200*x)+sqrt(abs(x))-0.7).*(4-x.*x).^0.01;
        figure;
        plot(x,y);
    elseif(strcmp(s, 'life'))
        life;
    elseif(strcmp(s, 'hanlon'))
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
