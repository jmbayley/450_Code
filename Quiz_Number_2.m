function Quiz_Number_2
global omega a b Y0
% set some parameters
omega = 4*pi;
a = 2.;
b = 3.;

% set the initial condition
Y0 = 6; % initial condition

[t, p] = ode45(@rate, [0,3], Y0);

% compute an approximate analytic solution over the same time domain as the
% ode45 solution
ta = 0:0.1:3;
pa = approx(ta);

% over lay plots of p and pa in the same figure
figure(1)
hold on

plot(t,p,'b')
plot(ta,pa,'r')
end


function f = rate(t,p)
% Rate function for oscillating growth
global omega a b
f = a.*(1 - b.*sin(omega.*t))*p;
end

function g = approx(t)
% approximate analytic solution
global a Y0
g = Y0.*exp(a.*t);
end