function fault_scarp
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%check screen size to make sure the figure isn't opened larger than it
fig_pos = [10, 10, 1250, 750];
sz = get(groot, 'Screensize');
if(sz(3) < fig_pos(3))
    fig_pos(3) = sz(3);
end
if(sz(4) < fig_pos(4))
    fig_pos(4) = sz(4);
end
%open figure
fig = figure('name',...
    'Fault Scarp Age Estimation with the Diffusion-Heat-Erosion Equation!',...
    'NumberTitle', 'off',... %get rid of the 'Figure 1:'
    'MenuBar', 'none',... %remove 'File', 'Edit', etc. menu
    'ToolBar', 'none',... %remove icon based lower toolbar
    'Resize', 'off',...
    'Position', fig_pos,... %figure size in pixels
    'DeleteFcn', @DeleteFcn,... %function called upon figure close
    'Tag', 'main_window');

%create tabs/panels in the GUI
tabgroup = uitabgroup('Parent', fig);

%place the ui objects in each tab
init_control_tab(tabgroup);
init_IC_tab(tabgroup);
init_results_tab(tabgroup);

%init guidata
data = guidata(fig);
data.fig = fig;
data.input_filename = '';
data.inactive_IC_color = 'b';
data.active_IC_color = 'r';
data.IC_point_size = 45;
data.table_edited = false;
data.drag_pts = cell(1,4);
data.last_active_pt = 0;
data.drag_pt_lines = cell(1,3);
data.angles = cell(1,3);
data.N_x_lower_limit = 100;
data.N_t_lower_limit = 100;
data.target_lambda = 0.1;

guidata(fig, data);

end
