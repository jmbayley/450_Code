function ode_example
% Top-level function with no input-output

% initial condition
y0 = 1;

% time range to solve over
t0 = 0;
tend = 1;

% Euler's method

dt = 0.1; % time increment 
n = ((tend-t0)/dt) + 1;  % compute the number of steps (based on dt, t0, tend)

% loop over n time steps and fill in these arrays:
% 1) time -- the values of t for the solution 
% 2) peul -- solution based on eulers method 
% 3) pana -- analytic solution
% Use the functions oscillating_growth and analytic defined below

% create arrays of dimension n to hold results

time = zeros(1,n);
pana = zeros(1,n);
peul = zeros(1,n);

% apply initial conditions
time(1) = t0;
pana(1) = analytic(time(1)); % analytic solution
peul(1) = y0; % Initialize Euler

% run through the rest of the points and use formulas above to fill in arrays
% hint: use recursion so t(i) = t(i-1) + ...
for i = 2:n
   time(i) = time(i-1) + dt;%%%%
   pana(i) = analytic(time(i));%%%%
   peul(i) = peul(i-1) + oscillating_growth(time(i-1),peul(i-1))*dt;%%%%
end

% Call numeric ode solver

[tode45, pode45] = ode45(@oscillating_growth, [t0, tend], y0);

% plot results

hold on
plot(time, peul, 'b')
plot(time, pana, 'r')
plot(tode45,pode45,'g -*')

end 

function f = oscillating_growth(t,y)
% Rate function for oscillating growth 
f = y*(1-sin(4*pi*t)); % fill in
end

function f = analytic(t)
% analytic solution
A = -exp(-1/(4*pi));
f =  -A*(exp((cos(4*pi*t))/(4*pi)))*exp(t);% fill in
end