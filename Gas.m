global P T R A B n

n = 1;
P = 1e7;
T = 300;
R = 8.3145;
A = 0.3643;
B = 4.27e-5;

fun = @Gas_Volume;
v0 = (n*R*T)/P;
x = fzero(fun, v0);
disp(x)

