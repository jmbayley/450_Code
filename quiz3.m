function quiz3

%% 1) Use a for loop to build a 10-element array u
u = 1:10;
for i = 1:10
    u(i) = i.^2;
end

disp(u)

%% 2)  Use a for loop to build a 10-element array v 
v = 1:10;
for a = 1:10
    v(a) = sin((a-1).*(pi/10));
end

disp(v)

%% 3) Use double for loops to build a 10x10 matrix M
M = zeros(10);
for i = 1:10
    for j = 1:10
        M(i,j) = i*j;
    end
end

disp(M)

%% 4)  make an 10-element array a with elements 1-5 taken from of u and 
%      elements 6-10 taken from v
a = 1:10;
for i = 1:10
    if i<=5
        a(i) = u(i);
    else
        a(i) = v(i);
    end
end

disp(a)

%% 5) Create an array f from the 4th row of M 

f = M(4,:);
disp(f) 

%% 6) Create an array g from the 3rd column of M 

g = M(:,3);
disp(g)%% 
end