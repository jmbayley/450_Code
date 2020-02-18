function HeatBar_matrix
% Solve Heat Equation numerically using a time and space mesh

% Parameters for the problem

% Spatial Grid
L = 15;  % Length of bar
dx = .1; % Spacing of points on bar
nx = (L/dx) + 1; % number of points

x = 0:dx:L; % x grid


% Time grid
stopTime = 100; % Time to run the simulation
dt = .01; % Size of time step
nt = (stopTime/dt) + 1; % number of time points

time = 0:dt:stopTime; % time grid

% heat conduction
K = 0.5;

% Set the initial condition

T(1:nx,1) = 50; % constant initial state

% Boundary Condition

Ta = 100.; % left side
Tb = 0.; % right side


% Create Matrix for iterating forward in time

Tdiag = diag(ones(nx-1,1),+1)-2*eye(nx)+diag(ones(nx-1,1),-1);
I = eye(nx);

M = ((K*dt)/dx^2)*Tdiag + I; % time iteration matrix

% loop forward in time and compute temperature along the bar
for it = 2:nt% Fill in
    % Calculate the future temperature along the bar
    
    
    % center of bar in matrix form. Note that heat source is added at each
    % time step
    
    T(:,it) = M*T(:,it-1); % Fill in
    
    % apply left side boundary condition
    T(1,it) = Ta; % fixed temperature
    % apply right side boundary condition
    T(nx,it) = Tb; % fixed temperature
end


% Make some plots

figure(1)
plot(x, T(:,nt))
xlabel('Distance')
ylabel('Temperature')
title('Steady State Solution')


% Animated graph for every 10th time step
figure(2)
for it = 1:10:nt
    plot(0:dx:L, T(:,it))
    axis([0 L 0 210])
    xlabel('Distance')
    ylabel('Temperature')
    title('Transient Solution')
    
    
    pause(.00001)
end
end
