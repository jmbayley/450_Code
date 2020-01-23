D = 10;
V = 45;
C = (1/2);
fun = @vol;

h0 = 5;

x = fzero(fun,h0);
disp(x)

%y = fplot(@vol);




