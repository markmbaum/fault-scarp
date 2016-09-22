function plotIC
% plots initial conditions, sets up click/drag for IC segments and
%points

data = get(gcf,'UserData');

'in plotIC'
data

x = data.IC.x;
y = data.IC.y;
h = plot(data.MyHandles.IC_Handle,x,y,'-ks', 'MarkerFaceColor','k');
hold on
xlabel('distance (m)','FontSize', 12)
ylabel('relative height (m)','FontSize', 12)

data.MyHandles.ICLine_Handle = h;
set(gca,'ButtonDownFcn',{@ClickDrag_Callback}) % Sets the ButtonDown Function for the plot
set(gcf,'UserData',data);


end



