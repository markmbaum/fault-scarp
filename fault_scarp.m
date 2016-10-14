function fault_scarp
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%check screen size to make sure the figure isn't opened larger than it
fig_pos = [1, 1, 1250, 750];
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
    'DeleteFcn', @close_gui,... %function called upon figure close
    'Tag', 'main_window');

%init guidata
data = guidata(fig);
data.fig = fig;
data.input_path = '';
data.inactive_IC_color = [0, 0.4470, 0.7410];
data.active_IC_color = [0.8500, 0.3250,0.0980];
data.IC_point_size = 50;
data.table_edited = false;
data.drag_pts = cell(1,4);
data.last_active_pt = 0;
data.drag_pt_lines = cell(1,3);
data.angles = cell(1,3);
data.N_x_solution = 250;
data.min_rmse_color = [0 0.5 0];
data.solutions = [];
data.solution_x = [];
data.RMSE = [];

%create tabs/panels in the GUI
tabgroup = uitabgroup('Parent', fig, 'Tag', 'tabgroup');

%place the ui objects in each tab
init_control_tab(tabgroup);
init_IC_tab(tabgroup);
init_results_tab(tabgroup);

guidata(fig, data);

end
