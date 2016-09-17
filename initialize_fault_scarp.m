function initialize_fault_scarp
% inialize many of the variables in data structure
data = get(gcf,'UserData');
data.IC.x_max = 10;
data.IC.x_min = 0;
data.IC.y_min = 0;
data.IC.y_max = 3;
data.IC.not_a_point = 1;
width = data.IC.x_max - data.IC.x_min;
height = data.IC.y_max - data.IC.y_min;
data.IC.x = [data.IC.x_min data.IC.x_min + 0.3*width  data.IC.x_min + 0.7*width  data.IC.x_max];
data.IC.y = [data.IC.y_min data.IC.y_min + 0.1*height data.IC.y_min + 0.9*height data.IC.y_max];
data.t = [ 1000 2000 3000 4000 5000];

data.IC.nsegments = length(data.IC.x) - 1;
data.kappa = 1.e-5;
data.plotting.colors = ['b', 'r' ,'g' ,'m' ,'c' ];  
data.plotting.fixaxes='n';
set(gcf,'UserData',data);

'in initialize_fault_scarp'
data
