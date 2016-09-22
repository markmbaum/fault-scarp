function SetXMax
data = get(gcf,'UserData');
num = get(findobj(gcf,'Tag','XMax'),'String');
data.IC.x_max = str2double(num);
axis([data.IC.x_min data.IC.x_max data.IC.y_min data.IC.y_max])
    
set(gcf,'UserData',data);