function initialize_IC_tab(tabgroup)

%CONSTRUCT IC TAB
IC_tab = uitab('Parent', tabgroup,...,
        'Title', 'Initial Conditions',...
        'Tag', 'IC_tab');

IC_ax = axes('Parent', IC_tab,...
        'Units', 'normalized',...
        'Tag', 'IC_ax',...
        'Box', 'on',...
        'XGrid', 'on',...
        'YGrid', 'on',...
        'PlotBoxAspectRatioMode', 'manual',...
        'DataAspectRatioMode', 'manual',...
        'NextPlot', 'add');
        IC_ax.YLabel.String = 'Y';
        IC_ax.XLabel.String = 'X';
        IC_ax.Position = [0.05 0.05 0.9 0.75];
        IC_ax.XAxis.FontSize = 12;
        IC_ax.YAxis.FontSize = 12;
        axis equal;
        text(0.5, 0.5,...
            'Load Scarp Profile Data Before Setting Initial Conditions',...
            'HorizontalAlignment', 'center',...
            'VerticalAlignment', 'middle',...
            'Tag', 'IC_ax_text',...
            'Fontsize', 14);
IC_buttongroup = uibuttongroup('Parent', IC_tab,...
        'Units', 'normalized',...
        'Position', [0.3 0.845 0.4 0.14],...
        'Title', 'Initial Conditon Controls',...
        'Fontsize', 12);
%IC_restore_button
uicontrol('Parent', IC_buttongroup,...
        'Style', 'pushbutton',...
        'Units', 'normalized',...
        'Position', [0.01 0.4 0.2375 0.6],...
        'String', 'Restore',...
        'FontSize', 12,...
        'Callback', @restore_IC_ax);
%IC_add_point_button
uicontrol('Parent', IC_buttongroup,...
        'Style', 'pushbutton',...
        'Units', 'normalized',...
        'Position', [0.2575 0.4 0.2375 0.6],...
        'String', 'Add Segment',...
        'FontSize', 12,...
        'Callback', @add_IC_point);
%IC_del_point_button
uicontrol('Parent', IC_buttongroup,...
        'Style', 'pushbutton',...
        'Units', 'normalized',...
        'Position', [0.505 0.4 0.2375 0.6],...
        'String', 'Delete Segment',...
        'FontSize', 12,...
        'Callback', @delete_IC_point);
%IC_help_button
uicontrol('Parent', IC_buttongroup,...
        'Style', 'pushbutton',...
        'Units', 'normalized',...
        'Position', [0.7525 0.4 0.2375 0.6],...
        'String', 'Help',...
        'FontSize', 12,...
        'Callback', @IC_help);
%IC_exag_checkbox
uicontrol('Parent', IC_buttongroup,...
        'Style', 'checkbox',...
        'Units', 'normalized',...
        'Position', [.35 .1 .666 .2],...
        'String', 'Scale Axes Equally',...
        'FontSize', 12,...
        'Value', 1,...
        'Callback', @rescale_IC_axes);

end
