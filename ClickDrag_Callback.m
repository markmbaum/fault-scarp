function ClickDrag_Callback(hObject,eventdata)

data = get(gcf,'UserData');

%set ButtonMotion and ButtonUp functions
set(gcf,'WindowButtonDownFcn',{@ClickDrag_Callback})
 set(gcf,'WindowButtonMotionFcn',{@ClickDragMotion})
 set(gcf,'WindowButtonUpFcn',{@ClickDragUp})




% get location clicked on
point = get(gca,'CurrentPoint');
start_x  = point(1,1);
start_y = point(1,2);


% determine which point in IC it's closest to
xIC = data.IC.x;
yIC = data.IC.y;
dist = sqrt((start_x - xIC).^2 + (start_y-yIC).^2);
data.IC.imin=find(dist==min(dist));  % imin is index to point in IC closest to click point
data.IC.not_a_point = 0;

%what if too far from a point? If too far
%from a point (3 percent of x or y range), don't do anything
xlimits = get(gca,'XLim');
xrange = xlimits(2)-xlimits(1);
ylimits = get(gca,'YLim');
yrange = ylimits(2)-ylimits(1);
if dist > 0.03*xrange & dist > 0.03*yrange
    data.IC.not_a_point = 1;
end

% save data, including imin
set(gcf,'UserData',data);

%re-set button down function -- seems to need this
set(gca,'ButtonDownFcn',{@ClickDrag_Callback})




function ClickDragMotion(hObject, eventdata)
% executes when dragging a point with mouse click down, as long as mouse down event was
% close enough to a point

data = get(gcf,'UserData');
if data.IC.not_a_point ~= 1
i = data.IC.imin; % index to point being moved

current_point = get(gca,'CurrentPoint');
current_x = current_point(1,1);
current_y = current_point(1,2);

h = data.MyHandles.ICLine_Handle; % handle to line
xpoints = get(h,'xdata');  % old x points (before moving)
ypoints = get(h,'ydata');

% change x, y values of point being dragged
xpoints(i) = current_x;
ypoints(i) = current_y;

% delete old labels (coordinates of points)

s = findall(gca,'Type','text');
delete(s)

% write new labels   
xlimits = get(gca,'XLim');
xrange = xlimits(2)-xlimits(1);
ylimits = get(gca,'YLim');
yrange = ylimits(2)-ylimits(1);

for j = 1:length(xpoints)
    string = [num2str(xpoints(j),'%5.2f'),', ',num2str(ypoints(j),'%5.2f')];
    text(xpoints(j) + xrange*.01, ypoints(j),string,'FontSize',8)
end

% calculate scarp dip


% save data
set(h,'xdata',xpoints);
set(h,'ydata',ypoints);
set(gcf,'UserData',data);


end

function ClickDragUp(hObject,eventdata)

% executes when mouse button is released, as long as mouse down click was
% close enough to a point

data = get(gcf,'UserData');
if data.IC.not_a_point ~= 1

% get handle to line
%h = data.MyHandles.ICLine_Handle; 
i = data.IC.imin; % index to point being moved
current_point = get(gca,'CurrentPoint');

%store new coordinates
data.IC.x(i) = current_point(1,1);
data.IC.y(i)= current_point(1,2);

% plot value of coord next to point
xlimits = get(gca,'XLim');
xrange = xlimits(2)-xlimits(1);
ylimits = get(gca,'YLim');
yrange = ylimits(2)-ylimits(1);

% delete old labels

s = findall(gca,'Type','text');
delete(s)

% write new labels: coordinates of segment ends, dips and lengths of segments  
for j = 1:length(data.IC.x)
    string = [num2str(data.IC.x(j),'%5.2f'),', ',num2str(data.IC.y(j),'%5.2f')];
    text(data.IC.x(j) + xrange*.01, data.IC.y(j),string,'FontSize',8)
end
data.dips = atan(diff(data.IC.y)./diff(data.IC.x))*180/pi;
data.lengths = sqrt(diff(data.IC.y).^2 + diff(data.IC.x).^2);
for i = 1:length(data.dips)
    dips{i+1} = num2str(data.dips(i),'%5.0f');
    seg_length{i+1} = [num2str(data.lengths(i),'%5.1f')];
end
        
dips{1} = 'Dips (\circ)';
seg_length{1} = 'Lengths (m)';
text(xrange*.01, yrange*.90, dips, 'FontSize',10)
text(xrange*.11,yrange*.90,seg_length, 'FontSize',10)


set(gcf,'UserData',data)
end

%restore button function -- seems to need this 
set(gca,'ButtonDownFcn',{@ClickDrag_Callback})
set(gcf,'WindowButtonMotionFcn','')
set(gcf,'WindowButtonUpFcn','')
