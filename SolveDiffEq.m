function SolveDiffEq

data = get(gcf,'Userdata');

% get initial conditions  -- these are endpoints of the line segments
% making  up the IC
x_ic = data.IC.x;
y_ic = data.IC.y;

% determine slopes that will become the BC
ffslope0 = (y_ic(1)-y_ic(2))/(x_ic(1)-x_ic(2));
ffslope1 = (y_ic(end-1)-y_ic(end))/(x_ic(end-1)-x_ic(end));

%define constants
kappa = data.kappa;
m = 0;  % constant for pde solver



% set grid points in x at which solution is desired
x =linspace(x_ic(1),x_ic(end),51);

% get times for which to plot the solution
plottimes = [0 data.t] 

%-------- main call to pdepe ---------------------------------------------
solution = pdepe(m,@diffusion_pde,@diffusion_ic,@diffusion_bc,x,plottimes);

% extract just the first element as the solution u
h=solution(:,:,1);

%plot solution, as well as IC
data.figID = figure()
colors = data.colors;
plot(x,h)
x1 = min(x)-0.05*(max(x)-min(x));
x2 = max(x)+0.05*(max(x)-min(x));
h1 = min(min(h))-0.05*(max(max(h))-min(min(h)));
h2 = max(max(h))+0.05*(max(max(h))-min(min(h)));
xlim([x1 x2]);
ylim([h1 h2]);
labels = num2str(plottimes)
legend(num2str(plottimes), 'Location','SouthEast')
xlabel('distance (m)')
ylabel('height (m)')

%Plot field data, if data file has been opened
if isempty(data.obs.fieldx) == 0
    save on
    plot(data.obs.fieldx,data.obs.fieldh,'bo')
end


% save all the data
set(gcf,'UserData',data)

%-------------------------
% subfunction to define the pde
function [c,f,s] = diffusion_pde(x,t,u,DuDx)
c=1;
f = kappa*DuDx;
s=0.0;
end

%--------------------------

function u0 = diffusion_ic(x)
% subfunction to define the initial conditions (initial scarp profile)
% Three line segments defined by vectors x_ic, y_ic
iOK = 0;
    for i = 1: length(x_ic)-1
        
        % find which segment x lies on
        if x >= x_ic(i) && x <= x_ic(i+1) % if yes, then interpolate
            u0 = y_ic(i) + (x - x_ic(i))*(y_ic(i+1)-y_ic(i))/(x_ic(i+1)-x_ic(i));
            iOK = 1;
        end
    end
    if iOK == 0 
        disp(['for x = ' num2str(x) 'error, no IC found'])
    end
end


%--------------------------
% subfunction to define the boundary conditions (using far field slope)
function [p1,q1,pr,qr] = diffusion_bc(x1,xr,u1,ur,t)
p1=-kappa*ffslope0;
q1=1;
pr=-kappa*ffslope1;
qr=1;
end

end
