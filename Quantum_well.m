function Quantum_well


% parameters as above
V0= 50;
a=1.e-11; % m
hbar=197*1e-9; % hbar-c
m=0.511*1e6; % eV/c2
xStart = -10*a;
xEnd = 10*a;
% x coordinate -- discretize

N = 100;
d = 20*a/N;
x = -10*a:d:10*a;  % x runs -10a to 10a in 100 steps

% Potential

% FILL IN for:
% Vpot = 0; % a) square well 20a wide
Vpot = V0*(x.^2/a^2);% b) quantum well above

% Input matrix H:
D0 = -2.0*ones(1,N+1);
D1 = ones(1,N);
H =   -(hbar^2)/(2*m*d^2)*( diag(D0) + diag(D1,+1) + diag(D1, -1) );

H = H + diag(Vpot);

% Get the eigen values
[V,D] = eig(H);

% Display the top 5 eigen values (energy levels)
A = diag(D);
disp(A(1:5))
B = V(:,1) + V(:,2) + V(:,3); %Total eigenstate
% plot the top 3 eigenvectors as wave functions vs x
figure()
hold on
for iplt = 1:3
   plot(x,V(:,iplt))% FILL IN
end %for loop end
plot(x,B)
title("Quantum Well")
legend("Psi_1" , "Psi_2", "Psi_3", "Psi_{Total}")

end %function end