function HW3_tank %Main/Top-level function

global v_tap g D0 tap_diam h0

%v_tap = sqrt(2*g*depth(t)); %outgoing velocity of the water
g = 9.81; %in m/s
D0 = 1; %diameter at top and bottom in meters
tap_diam = 0.02; %tap diameter in meters
h0 = 2; %height of tank in meters
%--------------------------------------
%Function test for diameter function
% disp(D(pi/2)) 
% fun = @D;
% y = fplot(fun, [0 pi]);
% disp(y)
%--------------------------------------
%Function test for height function
height = zeros(10);
for a = 1:10
    for b = 0:0.1:1
        height(a) = rate(a,b);
    end
end
disp(height)
%fplot(height)
end

function diam = D(h) %Diameter function as sine function WRT height
global v_tap g D0 tap_diam h0
diam = 1.1*D0*sin(h*pi);
if h == 0 || h == pi
    diam = D0;
end
end

function height_dt = rate(t,h) %Rate of change for height of water
global v_tap g D0 tap_diam h0
height_dt = (-sqrt(g/2)*((tap_diam^2)/(D(h)^2))*t + sqrt(h0))^2;

end

function depth_at_time = depth(t) %Depth of water @ time t using ODE45




end

function height_difference = height_diff(t) %Height difference between height @ time t and desired depth




end

function analytic_time = analytic(d,h) %General time to drain a tank of diameter d




end
