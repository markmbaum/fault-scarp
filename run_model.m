function run_model(hObject, ~)

handles = guihandles(hObject);
data = guidata(hObject);

%get proposed solution times and initialize error_flag
[solution_times, total_time, error_flag] = get_solution_times(handles);

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

  %automatically determine spatial and temporal resolution needed to have
  % stability criterion lambda <= data.target_lambda
  target_lambda = data.target_lambda;
  N_x = data.N_x_lower_limit;
  L = max(x_drag);
  N_t = ceil((total_time/L)*(N_x - 1)^2 + 1);
  %increase resolutions if N_t is fairly small, until they reach acceptable
  % levels
  while(N_t < data.N_t_lower_limit)
    N_x = N_x + 1;
    N_t = ceil((total_time/L)*(N_x - 1)^2 + 1);
  end

  %get dimensional x values and resolution
  x = linspace(min(x_drag), L, N_x);
  dx = x(2) - x(1);
  %get dimensional t values
  t = linspace(0, total_time, N_t);
  dt = t(2) - t(1);

  %update display of numerical parameters
  handles.delta_x.String = [num2str(dx), ' meters'];
  handles.N_x.String = [num2str(N_x), ' points'];
  handles.delta_t.String = [num2str(dt), ' years'];
  handles.N_t.String = [num2str(N_t), ' points'];

  %get initial y values by linear interpolation
  y_IC = interp1(x_drag, y_drag, x);

  %nondimensionalize spatial and temporal vectors and resolutions
  x_hat = x/L;
  dx_hat = dx/L;
  t_hat = t*(kappa/L^2);
  dt_hat = dt*(kappa/L^2);

  %calculate initial dimensionless slopes on the edges
  s_0 = (y_drag(2) - y_drag(1))/((x_drag(2) - x_drag(1))/L);
  s_L = (y_drag(end) - y_drag(end-1))/((x_drag(end) - x_drag(end-1))/L);


  %run the solver
  y = Crank_Nicolson_solver(dx_hat, y_IC, dt_hat, N_t, s_0, s_L);

  %plot results for inspection
  figure;
  hold on;
  plot(x, y(1,:));
  for i = 1:10
    plot(x, y(round(i*N_t/10),:));
  end


end

end
