function Quantum_oscill
% Solve the schrodinger equation for a quantum oscillator


% set some parameters
global V0 a hbar m E
V0= 50;
a=1.e-11; % m
hbar=197*1e-9; % hbar-c
m=0.511*1e6; % eV/c2
E=413; % eV Energy level


% set initial conditions (ie at Xstart)

psi0 = 0;
psip0 = 1;
Y0 = [psi0; psip0]; % pack the i.c. into a column vector

% set the space interval for solving  -10a < x < 10a
Xstart=-10*a;
Xend = 10*a;


% solve the ODE
[x, Pout] = ode45(@schrodinger, [Xstart, Xend], Y0);
psi = Pout(:,1);

% make some nice plots

plot(x, psi)
xlim([-5*a,5*a])

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