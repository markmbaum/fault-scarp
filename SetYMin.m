function SetYMin
data = get(gcf,'UserData');
num = (get(findobj(gcf,'Tag','YMin'),'String'));
data.IC.y_min = str2double(num);
axis([data.IC.x_min data.IC.x_max data.IC.y_min data.IC.y_max]);

    
set(gcf,'UserData',data);