function Lorentz

global sigma beta rho x0 y0 z0 

sigma = 10;
beta = 8/3;
rho = 28;
x0 = -8;
y0 = 8;
z0 = 20;
end

function a = dx_dt(x,y)

global sigma
a = -sigma.*x + sigma.*y;
end

function a = dy_dt(x,y,z)

global rho
a = rho.*x - y - x.*z;
end

function a = dz_dt(x,y,z)

global beta
a = -beta.*z + x.*y;
end
