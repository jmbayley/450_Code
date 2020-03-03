function Population_as_a_Matrix

b = [400; -100; -100; 0; 0];

A = [-0.2 0.1 0 0 0; 0.1 -0.4 0 0.1 0; 0.1 0.2 -0.5 0.1 0; 0 0.1 0.2 -0.4 0; 0 0 0.3 0 -0.5];

x = ones(5,12)*10000;

for i = 2:12
    x(:,i) = x(:,i-1) + (A*x(:,i-1) + b);
%     disp(['month: ', num2str(i)])
%     disp(x(:,i))

end
  disp(x(:,12))
  figure()
  hold on
  plot((1:12),x(1,:))
  plot((1:12),x(2,:))
  plot((1:12),x(3,:))
  plot((1:12),x(4,:))
  plot((1:12),x(5,:))
  legend('Downtown','Capital Hill','Ballard','U-District','Fremont')
end
