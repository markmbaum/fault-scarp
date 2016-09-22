function  PlotData
%Plots fault scarp field data in main window
cla
data=get(gcf,'UserData');
plotyes= 0;

% read data
x=data.obs.fieldx;
h=data.obs.fieldh;


if isempty(x) == 0
	hold on
		ymin = min([0.9*min(h) 0]);
		ymax = max([1.1*max(h) 0]);
        xmin = min([0.9*min(x) 0]);
		xmax = max([1.1*max(x) 0]);
		axis([xmin xmax ymin ymax]);
end
% plot data if it exists.

if isfield(data,'obs') 				% if field exists
	if ~isempty('data.obs') 		% and has some contents
		%  shift data if necessary
		plot(x,h,'ro');
		set(gca,'Tag','IC_Axes','FontSize',14)  % should not be necessary but somehow MATLAB loses this info
        plot(data.MyHandles.IC_Handle,x,h,'ro', 'MarkerFaceColor','r');

	end
end
hold on
%replot IC -- not sure why they disappear
plotIC
hold on
'in plotData'
data
set(gcf,'UserData',data)
end

