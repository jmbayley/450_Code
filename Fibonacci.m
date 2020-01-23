% fib_num = (1:1:10);
% 
% for i = 1:10
%     F_n(i) = (1/sqrt(5))*[(((1+sqrt(5))/2)^i) - (((1-sqrt(5))/2)^i)];
%     fib_num(i) = F_n(i)
% end
% %-----------------------------------
% 
% F1 = 1;
% F2 = 1;
% 
% for n = 3:10
%     F = F1 + F2;
%     F1 = F2;
%     F2 = F;
%     disp(F)
% end
% %-----------------------------------
%Function Portion
function Fibonacci(n)

for i = 1:n
    F(i) = (1/sqrt(5))*[(((1+sqrt(5))/2)^i) - (((1-sqrt(5))/2)^i)];
end
Fibonacci = F(i);
end
