function SetTime(i)
% time = character variable corresponding to which time has been changed
% i = index to which time 

tag = {'Time1', 'Time2', 'Time3', 'Time4','Time5'};
data = get(gcf,'Userdata');
data.t(i) = str2double(get(findobj(gcf,'Tag',tag{i}),'String'));
set(gcf,'UserData',data);