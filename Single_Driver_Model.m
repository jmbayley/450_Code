function Single_Driver_Model
global v0 Thead a b delta s0 lveh Xblock

% set model parameters
v0 = 28; % m/s (28 m/s ~ 60 mph)
Thead = 2.0; % s; follow time gap between cars
a = 0.7; % m/s^2
b = 2; % m/s^2
delta = 4; % exponent
s0 = 2; % m gap
lveh = 5; % m -- vehicle length
Xblock = 3000; % blockage

x_naught = 0;
v_naught = 0;
Y0 = [x_naught; v_naught]; % pack the i.c. into a column vector

% set the space interval for solving  -10a < x < 10a
Tstart = 0;
Tend = 300;


% solve the ODE
[Tout, Vout] = ode45(@drive_rate, [Tstart, Tend], Y0);
x_t = Vout(:,1);
v_t = Vout(:,2);

% make some nice plots

plot(Tout,x_t,Tout,v_t)

end


function rate = drive_rate(~, T)
% The time-independent Schrodinger Equation
global v0 Thead a b delta s0 lveh Xblock


% unpack
x = T(1);
v = T(2);
        
s_star = s0 + v*Thead + (v*v)/(2*sqrt(a*b));
s = (Xblock - lveh) - x;        
% compute rates
dx_dt = v;
dv_dt = a*(1 - (v/v0)^delta - (s_star/s)^2);
        
% pack rates into column vector
rate = [dx_dt; dv_dt];

end
