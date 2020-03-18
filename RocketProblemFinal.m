function RocketProblemFinal

global Mr Mf Burn T RE%Set Parameters
Mr = 100000; %kg
Mf = [2200000,460000,80000]; %kg
Burn = [900,360,165]; %seconds
T = [35000,4400,1000]; %kN
RE = 6.371e+6; %Radius of Earth in m

% [Mass,Time] = Mass_func(Burn,Mf); %Calling mass function
% plot(Time,Mass); %Commented out to run following plots

% [Force, y] = Force_func(); %Calling force function
% plot(y,Force); %Commented out to run following plots

[t, y] = ode45(@(t, y) rate_func(t, y, T, Mr, Mf, Burn), [0, Burn(1)], [RE;0]); %Using ode45 with rate_func and Earth's radius

Position = [y(:,1)]; %using all values in column
Fgrav = Force_func(Position, Mr); 
plot(t, Fgrav); %Plotting force of grav
xlabel('Time');
ylabel('Altitude');

Altitude = Position - RE; %Altitude with respect to Earth's radius 
plot(t, Altitude); %plotting altitude

end

function Mass = Mass_func(t) %mass function
global Mr Mf Burn T RE 

if t <= 900
    Burn(1)
    MassSlope = (Mf(1))/(-Burn(1)); %slope variable
    Mass = MassSlope*Time + Mf(1) + Mr; %returning mass
elseif t>900 && t <= 1260
    Burn(2)
    MassSlope = (Mf(2))/(-Burn(2)); %slope variable
    Mass = MassSlope*Time + Mf(2) + Mr; %returning mass
elseif t > 1260 && t <= 1425
    Burn(3)
    MassSlope = (Mf(3))/(-Burn(3)); %slope variable
    Mass = MassSlope*Time + Mf(3) + Mr; %returning mass
else
end

end

function Force = Force_func(t,y) %Instead of y pass in position
global Mr Mf Burn T RE
G = 6.67e-11; %universal Gravitational Constant
Me = 5.97e24; %Mass of Earth, kg

if t <= 900
    Thrust = T(1);
elseif t>900 && t <=1260
    Thrust = T(2);
elseif t > 1260 && t <= 1425
    Thrust = T(3);
else
end
    
Force = G*((Me + Mr)./(y.^2)) + Thrust; %Elementwise multiplication and division because of matrix

end

function rate = rate_func(t, y, T, Mr, Mf, Burn)
global Mr Mf Burn T RE
G = 6.67e-11; %universal Gravitational Constant
Me = 5.97e24; %Mass of Earth, kg

MassSlope = (Mf(1))/(-Burn(1)); 
MassFuel = MassSlope*t + Mf(1); %To be added to the Mass of the rocket to equal the mass of the system

Fgrav = G*((Me + Mr)/(y(1)^2)); %Force of gravity equation
Accel = (T(1)*1000 - Fgrav)/(Mr + MassFuel); %Equation for Acceleration using mass of system
rate = [y(2); Accel]; %rate output to be called in ode45

end
