function run_model(hObject, ~)

handles = guihandles(hObject);
data = guidata(hObject);

error_flag = false;

%check for data
if(isempty(handles.control_table.Data))
    error_flag = true;
    errordlg('No data are loaded. Load data.', 'Missing Data');
end

if(~error_flag)
    %get proposed solution times and initialize error_flag
    [t_sol, error_flag] = get_solution_times(handles);
end

if(~error_flag)
    if(any(diff(t_sol) <= 0))
        error_flag = true;
        errordlg('Solution times must be uniformly increasing.',...
                  'Solution Times Error');
end

%get drag point coordinates and check them for error
if(~error_flag)

  %get the dragged IC points
  [x_drag, y_drag] = get_drag_pt_coords(data);

  %make sure that the points represent a function, no overlap or backtracking
  if(any(diff(x_drag) <= 0))
    error_flag = true;
    errordlg({'The initial condition coordinates must represent a function.',...
            'IC x-coordinates must uniformly increase from left to right.',...
            'An overlap/backtrack was detected. Fix it and proceed.'},...
            'Initial Condition Error');
  end

end

%get kappa and check it
if(~error_flag)

  %get kappa
  kappa = str2double(handles.kappa.String);

  if(isnan(kappa))
    error_flag = true;
    errordlg('Your input for kappa is not a number. Correct and proceed.',...
            'Input Paremeter Error');
  end

end

%run solver
if(~error_flag)

  %calculate initial dimensionless slopes on the edges
  m_0 = (y_drag(2) - y_drag(1))/(x_drag(2) - x_drag(1));
  m_L = (y_drag(end) - y_drag(end-1))/(x_drag(end) - x_drag(end-1));

  %set spatial points for solution
  x_sol = linspace(min(x_drag), max(x_drag), data.N_x_solution);

  %add zero to the solution times
  t_sol = [0; t_sol];

  %get solutions
  sol = solve_diffusion_equation(x_drag, y_drag, x_sol, t_sol, kappa, m_0, m_L);

  %strip the zero time solution
  t_sol = t_sol(2:end);
  sol = sol(2:end,:);

  %plot results
  data = plot_results(handles, data, x_sol, t_sol, sol);

  %switch to results tab
  handles.tabgroup.SelectedTab = handles.results_tab;

  %store solutions
  data.solutions = sol';
  data.solution_x = x_sol;

  %store data
  guidata(hObject, data);

end

end
