function [varargout] = fault_scarp(varargin)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%open figure
fig_pos = [1, 1, 1250, 750];
fig = figure('name', 'Fault Scarp Age Estimation with Diffusion',...
            'NumberTitle', 'off',... %get rid of the 'Figure 1:'
            'MenuBar', 'none',... %remove 'File', 'Edit', etc. menu
            'ToolBar', 'none',... %remove icon based lower toolbar
            'Resize', 'off',... %disable resizing
            'Position', fig_pos,... %figure size in pixels
            'DeleteFcn', @DeleteFcn,... %function called upon figure close
            'Tag', 'main_window');
        
%create tabs/panels in the GUI
tabgroup = uitabgroup('Parent', fig);
control_tab = uitab('Parent', tabgroup, 'Title', 'Program Controls');
IC_tab = uitab('Parent', tabgroup, 'Title', 'Initial Conditions');
results_tab = uitab('Parent', tabgroup, 'Title', 'Results');

%CONSTRUCT CONTROL TAB
pos = fig_frac(fig_pos, [0, 0, 0.11, .95]);
w = fig_width_frac(fig_pos, 0.042);
control_table = uitable('Parent', control_tab,...
                        'ColumnName', {'X'; 'Y'},...
                        'ColumnWidth', {w, w},...
                        'Position', pos);
%CONSTRUCT IC TAB


%CONSTRUCT RESULTS TAB
 ter

end