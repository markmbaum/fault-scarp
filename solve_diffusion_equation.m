function sol = solve_diffusion_equation(x_drag,y_drag,x_sol,t_sol,kappa,m_0,m_L)
%https://www.mathworks.com/help/matlab/ref/pdepe.html

sol = pdepe(0,...
        @governing_equation,...
        @initial_condition,...
        @boundary_condition,...
        x_sol, t_sol);

  function y = initial_condition(x_sample)
  %the initial conditions are scarp profile heights interpolated between the
  %draggable IC points

  y = interp1(x_drag, y_drag, x_sample);
  end

  function [c, f, s] = governing_equation(x, t, y, dydx)
  %the c term is a function of x,t,y and dydx that acts as a coefficient
  %of the first time derivative: c(x,t,y,dy/dx)*dy/dt = ...
  c = 1;
  %the function f can be complicated but in this case is simply the
  %second spatial derivative: d^2y/dx^2
  f = kappa*dydx;
  %the s term is a function that is added to f: ... = f + s(x,t,y,dy/dx)
  %and in this case is always zero
  s = 0;
  end

  function [p_0, q_0, p_L, q_L] = boundary_condition(x_0, y_0, x_L, y_L, t)
  %boundary conditions satisfy a function in the form:
  %   p(x,t,y) + q(x,t)*f(x,t,y,dy/dx) = 0
  %the values of p and q must be returned for each side
  %because f = kappa*dy/dx and the slopes on each end need to be fixed:
  p_0 = -m_0*kappa;
  q_0 = 1;
  p_L = -m_L*kappa;
  q_L = 1;
  end

end
