function Schrodinger_as_Eigen_value
% Solve the schrodinger equation for a quantum oscillator


% set some parameters
global V0 a hbar m E
V0= 50;
a=1.e-11; % m
hbar=197*1e-9; % hbar-c
m=0.511*1e6; % eV/c2


% set initial conditions (ie at Xstart)

psi0 = 0;
psip0 = 1;
Y0 = [psi0; psip0]; % pack the i.c. into a column vector

% set the space interval for solving  -10a < x < 10a
Xstart=-10*a;
Xend = 10*a;


% open a new figure
figure()
hold on

% solve the ODE for 3 values of E

% 1

E=137.67; % eV Energy level

[x, Pout] = ode45(@schrodinger, [Xstart, Xend], Y0);
psi = Pout(:,1);

% make some nice plots
plot(x(5:end-5), psi(5:end-5))
xlim([-5*a  5*a])

% 2

E=412.75; % eV Energy level

[x, Pout] = ode45(@schrodinger, [Xstart, Xend], Y0);
psi = Pout(:,1);

% make some nice plots
plot(x(5:end-5), 5*psi(5:end-5))
xlim([-5*a  5*a])


% 1

E=687.33; % eV Energy level

[x, Pout] = ode45(@schrodinger, [Xstart, Xend], Y0);
psi = Pout(:,1);

% make some nice plots
plot(x(5:end-5), 10*psi(5:end-5))
xlim([-5*a  5*a])


end

function rate=schrodinger(x, V)
% The time-independent Schrodinger Equation
global V0 a hbar m E

% unpack
    psi = V(1);
    psip = V(2);
        
        
    % compute rates
    dpsi = psip;
    dpsip = -(2*m/hbar^2)*(E - V0*(x^2/a^2))*psi;
        
    % pack rates into column vector
    rate = [dpsi; dpsip];
end
