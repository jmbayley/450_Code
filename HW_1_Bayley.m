
 %Problem 1%
 %John Bayley%
 m = 9.11e-31;
 hbar = 6.582e-16;
 k1 = sqrt(2*m*10)/hbar;
 k2 = sqrt(2*m)/hbar;
  
 T = (4*k1*k2)/((k1+k2)^2);
 R = ((k1-k2)/(k1+k2))^2;
  
 disp("Transmission probability is: " + T*100 + "%")
Transmission probability is: 73.0126%
 disp("Reflection probability is " + R*100 + "%")
Reflection probability is 26.9874%

%------------------------------------------------------------%

%Problem 2

kids = -1*ones(100,1);
for check = 1:100
for kid_check = check:100
if mod(kid_check,check) == 0
kids(kid_check) = kids(kid_check)*-1;
end
end
end
disp(kids == 1);
 
%I don't know how to get it to individually display the children that are
%left with a stick, I can only get it to print the total array and evaluate
%the ones with a value of '1' to determine who has sticks.
