function SetKappa

data = get(gcf,'Userdata');
num = get(findobj(gcf,'Tag','SetKappa'),'String')
data.kappa = str2double(num);
disp(data.kappa)
set(gcf,'UserData',data);