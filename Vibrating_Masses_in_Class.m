function Vibrating_Masses_in_Class

% set the time array
T = 10; 
dt = 0.01;
% 1) Fill in the time array:
t=0:dt:T; 

% 2) Create the Matrix M and find the eigenvalues and eigenvectors
k1 = 3;
k2 = 1;

beta = k1+k2;
alpha = k2;
M = [-beta alpha; alpha -beta];

[V,D] = eig(M);

% 3) Create the time series of the motion of each mass as cosines 
%    for the first eigenvalue/eigenvector
% What is omega for the selected mode?
% What is v1 and v2?

omega_1 = sqrt(-D(1,1));
omega_2 = sqrt(-D(2,2));
v1 = V(:,1);
v2 = V(:,2);
x1 = v1*cos(omega_1.*t);
x2 = v2*cos(omega_2.*t);


plot(t,x1, t,x2)
legend('x1','x2')

% now repeat for the other eigenvalue/eigenvector pair

end