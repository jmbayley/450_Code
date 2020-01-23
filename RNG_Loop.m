greater = 0;
less = 0;

for a = 1:n
x = rand
if x < 0.5
less = less+1;
disp("Less than 0.5")
else 
greater = greater+1;
disp("Greater than 0.5")
end
end

disp("Number less than = " + less);
disp("Number greater than = " +greater);
