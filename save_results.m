function save_results(hObject, ~)

handles = guihandles(hObject);
data = guidata(hObject);

%get target path
[pathstr,~,~] = fileparts(data.input_path);

ofile = fopen([pathstr, '/saved-results.txt'], 'w');

[T, ~] = get_solution_times(handles);
rmse = data.RMSE;
sol = data.solutions;
x_sol = data.solution_x;

fprintf(ofile, 'Data read from file: %s\n\n', data.input_path);

fprintf(ofile, 'kappa = %10f m^2/yr\n\n', str2double(handles.kappa.String));


fprintf(ofile, 'Solution Times\n');
for i = 1:length(rmse)-1
  fprintf(ofile, '%10s\t', ['T', num2str(i)]);
end
fprintf(ofile, '%10s\n', ['T', num2str(i+1)]);
for i = 1:length(T)-1
    fprintf(ofile, '%10f\t', T(i));
end
fprintf(ofile, '%10f\n\n', T(end));


fprintf(ofile, 'RMSE Percentages\n');
for i = 1:length(rmse)-1
  fprintf(ofile, '%10s\t', ['rmse', num2str(i)]);
end
fprintf(ofile, '%10s\n', ['rmse', num2str(i+1)]);
for i = 1:length(rmse)-1
    fprintf(ofile, '%10f\t', rmse(i));
end
fprintf(ofile, '%10f\n\n', rmse(end));


fprintf(ofile, 'Solution Profiles\n');
for i = 1:size(sol,2)
    fprintf(ofile, '%10s\t', ['Y', num2str(i)]);
end
fprintf(ofile, '%10s\n', 'X');
for i = 1:size(sol,1)
  for j = 1:size(sol,2)
      fprintf(ofile, '%10f\t', sol(i,j));
  end
  fprintf(ofile, '%10f\n', x_sol(i));
end

fclose(ofile);

end
