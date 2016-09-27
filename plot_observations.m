function plot_observations(x, y, handles)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%plot in control tab axes
axes(handles.control_ax);
plot(x, y, 'ko', 'Tag', 'observations');
legend({'Observed Scarp Profile'},...
        'Location', 'eastoutside',...
        'Fontsize', 12);

%remove IC axis text
t = get(handles.IC_ax, 'Children');
for i = 1:length(t)
    if(strcmp(t(i).Tag, 'IC_ax_text'))
        t(i).Visible = 'off';
    end
end

%plot observations in IC axis
axes(handles.IC_ax);
plot(x, y, 'ko', 'Tag', 'observations');
legend({'Observed Scarp Profile'},...
        'Location', 'southoutside',...
        'Orientation', 'horizontal',...
        'Fontsize', 12);

%draw draggable line in IC axis
xmin = min(x); xmax = max(x); ymin = min(y); ymax = max(y);
x = linspace(xmin, xmax, 4);
y = 0.5*(ymin + ymax)*ones(1,4);
%h = imline(handles.IC_ax, x, y);

end
