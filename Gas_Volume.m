function a = Gas_Volume(V)
global P T R A B n
a = ((P + A*(n/V)^2)*(V-n*B)) - (n*R*T);
end