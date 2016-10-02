function y = Crank_Nicolson_solver(dx_hat, y_IC, dt_hat, N_t, s_0, s_L)

%matrix constant
lambda = dt_hat/(dx_hat^2);

%number of internal spatial nodes
m = length(y_IC) - 2;

%construct matrix
A = zeros(m, m);
%first row
A(1,1) = 1 + lambda/3;
A(1,2) = -lambda/3;
%diagonals
for i = 2:m-1
   A(i,i-1) = -lambda/2;
   A(i,i) = 1 + lambda;
   A(i,i+1) = -lambda/2;
end
%last row
A(m,m-1) = -lambda/3;
A(m,m) = 1 + lambda/3;

%allocate space to store results
y_0 = zeros(N_t, 1);
y = zeros(N_t, m);
y_L = zeros(N_t, 1);

%insert initial conditions
y_0(1) = y_IC(1);
y(1,:) = y_IC(2:end-1);
y_L(1) = y_IC(end);

%allocation matrix solving vector
b = zeros(m, 1);

%slope constants
w_0 = -(2/3)*dx_hat*s_0;
w_L = -(2/3)*dx_hat*s_L;

for i = 2:N_t %start at 2 because t = 0 counts as a temporal point/node

  %calculate the b vector
  b(1) = (1 - lambda/3)*y(i-1,1) + (lambda/3)*y(i-1,2) - w_0;
  for j = 2:m-1
    b(j) = -(lambda/2)*y(i-1,j-1) + (1 - lambda)*y(i-1,j) - (lambda/2)*y(i-1,j+1);
  end
  b(m) = (1 - lambda/3)*y(i-1,m) + (lambda/3)*y(i-1,m-1) - w_L;


  y(i,:) = A\b;
  y_0(i) = w_0 + (4/3)*y(i,1) - (1/3)*y(i,2);
  y_L(i) = w_L + (4/3)*y(i,m) - (1/3)*y(i,m-1);

end

%concatenate arrays for return
y = [y_0, y, y_L];

end
