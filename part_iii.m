function [res] = part_iii(eqn)
%part_iii Inverse iteration algorithm for computing Julia set
%   eqn is the equation number.
%   built off of Greenbaum and Chartier's code
    
switch eqn           % Define the constant in question.
    case 0
        c = 0.279;
        
    case 1
        c = 0;
        x_sample = 2001;
        y_sample = 2001;
        nx = -1;
        ny = -1;
    case 2
        c = - 0.123 - 0.745i;
        x_sample = 3601;
        y_sample = 1401;
        nx = -1.8;
        ny = -0.7;
    otherwise
        c = 0.36 + 0.1i; 
        x_sample = 3601;
        y_sample = 1401;
        nx = -1.8;
        ny = -0.7;
end

res = zeros(1,1000);            % Initialize vector for bounded points
count = 1;                    % keep track of index in result vector
for j=1:y_sample                   % Try initial values with imaginary parts between
  y = ny + (j-1)*.001;        %   -0.7 and 0.7
  for i=1:x_sample                 % and with real parts between 
    x = nx + (i-1)*.001;     %   -1.8 and 1.8.
    if x == 0 && y == 0       % skip the origin
          continue;
    end
    z = x + 1i*y;             % 1i is the MATLAB symbol for sqrt(-1).
    zk = z;
    kount = 0;                % kount is the total number of iterations.

    while kount < 100 
      kount = kount+1;
      sign = rand();          % randomly generates the sign
      if sign < 0.5
          sign = -1;
      else 
          sign = 1;
      end
      zk1 = zk - c;
      zk1r = sqrt(real(zk1)^2 + imag(zk1)^2);  % compute length
      zk1t = atan(imag(zk1)/real(zk1));        % compute angle
      if real(zk1) < 0
          zk1t = zk1t + pi;                    % add pi if real part is negative
      end
      % Fixed point iteration
      zk = sign * sqrt(zk1r) *  (cos(zk1t / 2) + 1i * sin(zk1t / 2));
    end
    %if real(zk)^2 + imag(zk)^2 <= 4    % If orbit is bounded, add this
     if abs(zk) <= 2
        res(count) = zk;
        count = count + 1;
    end
  end
end
