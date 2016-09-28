function fault_scarp
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%open figure
fig_pos = [10, 10, 1250, 750];
fig = figure('name', 'Fault Scarp Age Estimation with Diffusion',...
        'NumberTitle', 'off',... %get rid of the 'Figure 1:'
        'MenuBar', 'none',... %remove 'File', 'Edit', etc. menu
        'ToolBar', 'none',... %remove icon based lower toolbar
        'Resize', 'on',... %enable resizing
        'Position', fig_pos,... %figure size in pixels
        'DeleteFcn', @DeleteFcn,... %function called upon figure close
        'Tag', 'main_window');

%create tabs/panels in the GUI
tabgroup = uitabgroup('Parent', fig);

%place the ui objects in each tab
make_control_tab(tabgroup);
make_IC_tab(tabgroup);
make_results_tab(tabgroup);

%init guidata
guidata(fig, struct(...
        'input_filename', '',...
        'table_edited', false));

end
