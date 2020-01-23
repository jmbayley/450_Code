vector = 100-rand(1,10)*200;
matrix = 100-rand(10,5)*200;

columns = vector';
%-----------------------------------
%Problem 1
disp(vector)

vectorA = vector(5:9);
vectorB = [vector(3), vector(9), vector(10)];

vectorB(3) = 12;
%-----------------------------------
%Problem 2
disp(matrix)

matrixA = matrix(5:7);
matrixA(1,2) = 10;
matrixA(2,3) = -10;
%-----------------------------------
%Problem 3
vector > 0 
vector(3:10) > 0

matrix < 30
0 < matrix & matrix < 2
matrix(1:3,2:4) > 2

size(vector)
length(vector)
size(matrix)
length(matrix)
%-----------------------------------
%Problem 4
x = 0:0.1:1;
y = 10*x;
z = x*y;

z = x.*y
w = x.^2

