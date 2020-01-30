function coffee
  % Define parameters of the problem
global HotCoffeeTemp CreamTemp CoolCoffee RoomTemp CoffeeVol CreamVol r 

HotCoffeeTemp = 90;
CreamTemp = 20;
RoomTemp = 20;
CoffeeVol = 8;
CreamVol = 1;
CoolCoffee = 60;
r = 0.001;

z = rate_func(0,90);
disp(z)

ode45(@rate_func, [0, 7200], HotCoffeeTemp);
y = CoffeeTemp(3600);
disp(y + " degrees");
disp(mix_func(CoffeeVol, y, CreamVol, CreamTemp))
end

function rate = rate_func(t,y)
        % This function specifies the right-hand-side of the newtonian
        % cooling differential equation. We will use it later in ode45
        global HotCoffeeTemp CreamTemp CoolCoffee RoomTemp CoffeeVol CreamVol r 
        rate = -r*(y-RoomTemp);
end

function  Temp = CoffeeTemp(t)
% call ode45 using rate_func to compute temperature after t seconds 
%    starting with the correct initial temperature
%    what is end_time if you want temperature after cooling for t seconds?

  global HotCoffeeTemp CreamTemp CoolCoffee RoomTemp CoffeeVol CreamVol r 

  [time, ctemp] = ode45(@rate_func, [0, t], HotCoffeeTemp);

% Save the final value in variable Temp
  Temp = ctemp(end); %%%%
end

function Tmix = mix_func(V1,T1,V2,T2)
% Calculates the final temperature of two liquids after they have been
% mixed based upon the initial temperature and volume of each individual liquid.
% Function is passed:
global HotCoffeeTemp CreamTemp CoolCoffee RoomTemp CoffeeVol CreamVol r
% V1 = CoffeeVol; % V1, initial Volume of liquid one
% T1 = HotCoffeeTemp;% T1, initial temperature of liquid one
% V2 = CreamVol;% V2, initial Volume of liquid two
% T2 = CreamTemp;% T2, initial temperature of liquid two
Tmix = ((V1*T1) + (V2*T2))/(V1 + V2); % Tmix, the temperature of the mixture 
end
