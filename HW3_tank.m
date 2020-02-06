function HW3_tank %Main/Top-level function

global v_tap g D0 tap_diam h0 t0 tend

%v_tap = sqrt(2*g*depth(t)); %outgoing velocity of the water
g = 9.81; %in m/s
D0 = 1; %diameter at top and bottom in meters
tap_diam = 0.02; %tap diameter in meters
h0 = 2; %height of tank in meters
t0 = 0;
tend = 100;
%--------------------------------------
%Function test for diameter function
% 
% h = 0:0.1:h0;
% diam = D(h);
% plot(h,diam)
%--------------------------------------
%Function test for height function
% h = 0:0.1:h0;
% t = 0:100:2000;
% height = rate(t,h);
% plot(t, height)
%--------------------------------------
% Function test for depth function
depth(2000)
end

function diam = D(h) %Diameter function as sine function WRT height
global v_tap g D0 tap_diam h0 t0 tend
diam = D0 + D0*0.1*sin((h/h0)*pi);
end

function height_dt = rate(t,h) %Rate of change for height of water
global v_tap g D0 tap_diam h0 t0 tend
height_dt = (-sqrt(g./2).*((tap_diam.^2)./(D(h).^2)).*t + sqrt(h0)).^2;
end

function depth(t) %Depth of water @ time t using ODE45
global v_tap g D0 tap_diam h0 t0 tend
ode45(@rate, [t0,t], h0);
end

function height_difference = height_diff(t) %Height difference between height @ time t and desired depth




end

function analytic_time = analytic(d,h) %General time to drain a tank of diameter d




end
