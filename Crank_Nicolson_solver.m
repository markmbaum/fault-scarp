function y = Crank_Nicolson_solver(dx_hat, y_IC, dt_hat, N_t, s_0, s_L)

%calculate matrix constant lambda
lambda = dt_hat/(dx_hat^2);
hlam = lambda/2;

%store number of internal nodes
m = length(y_IC) - 2;

%construct matrix
A = zeros(m, m);
%first row
A(1,1) = 1 + lambda/3;
A(1,2) = -lambda/3;
%diagonals
for i = 2:m-1
    A(i,i-1) = -hlam;
    A(i,i) = 1 + lambda;
    A(i,i+1) = -hlam;
end
%last row
A(m,m-1) = -lambda/3;
A(m,m) = 1 + lambda/3;

%allocate results variables
y_0 = zeros(N_t, 1);
y = zeros(N_t, m);
y_L = zeros(N_t, 1);

%store the constant slope values
w_0 = -(2/3)*dx_hat*s_0;
w_L = (2/3)*dx_hat*s_L;

%insert initial conditions
y(1,:) = y_IC(2:end-1);
y_0(1) = (4/3)*y(1,1) - (1/3)*y(1,2) + w_0;
y_L(1) = (4/3)*y(1,m) - (1/3)*y(1,m-1) + w_L;

%allocate b vector
b = zeros(m, 1);

for i = 2:N_t %run through time steps, starting at time 2 because time 1 is IC

  %calculate b vector values
  b(1) = (1 - lambda/3)*y(i-1,1) + (lambda/3)*y(i-1,2) + w_0;
  for j = 2:m-1
    b(j) = hlam*y(i-1,j-1) + (1 - lambda)*y(i-1,j) + hlam*y(i-1,j+1);
  end
  b(m) = (1 - lambda/3)*y(i-1,m) + (lambda/3)*y(i-1,m-1) + w_L;

  %solve matrix equation, get interior node values
  y(i,:) = A\b;

  %calculate boundary values
  y_0(i) = (4/3)*y(i,1) - (1/3)*y(i,2) + w_0;
  y_L(i) = (4/3)*y(i,m) - (1/3)*y(i,m-1) + w_L;

end

%concatenate arrays for return
y = [y_0, y, y_L];

end
