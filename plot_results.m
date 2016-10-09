function data = plot_results(handles, data, x_sol, t_sol, sol)

%prepare axis
cla(handles.results_ax);
handles.results_ax.NextPlot = 'add';
axes(handles.results_ax);
hold on;

%plot observed scarp profile
obs = handles.control_table.Data;
x_obs = obs(:,1);
y_obs = obs(:,2);
plot(x_obs, y_obs, 'ko');

%plot IC
[x_drag, y_drag] = get_drag_pt_coords(data);
plot(x_drag, y_drag, 'LineStyle', '--', 'Color', data.inactive_IC_color);

%plot results/solutions
plot(x_sol, sol');

%set legend
leg = cell(1, length(t_sol) + 2);
leg{1} = 'Observed Scarp Profile';
leg{2} = 'Initial Scarp Profile';
for i = 3:length(leg)
    leg{i} = [num2str(t_sol(i-2)), ' year solution'];
end
legend(leg, 'Location', 'eastoutside', 'Fontsize', 12);

%adjust axis margins
ax_margins(handles.results_ax, x_obs, y_obs);

%annotate with RMSE info
r = max(y_obs) - min(y_obs);
[hu, hd] = get_rmse_annotation_handles(handles);
for i = 3:length(leg)
    hu{i-2}.String = leg{i};
    %calculate rmse
    y_sol = interp1(x_sol, sol(i-2,:), x_obs);
    rmse = 100*sqrt(mean((y_obs - y_sol).^2))/r;
    hd{i-2}.String = ['RMSE = ', num2str(round(rmse, 3, 'significant')), ' \%'];
end

end
