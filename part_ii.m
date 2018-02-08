function [M3] = part_ii()
%part_i Contains code for part (ii) of the project
%   Modified version of the code from p.100 of Greenbaum and Chartier
    
phi = inline('z^2 + 0.36 + 0.1i');          % Define the function whose fixed points we seek.

fixpt1 = 0.360966 + 0.359625i;     % These are the fixed points.
fixpt2 = 0.639034 - 0.359625i;

M3 = 2*ones(141,361);          % Initialize array of point colors to 2 (white).

parfor j=1:141                   % Try initial values with imaginary parts between
  y = -.7 + (j-1)*.01;        %   -0.7 and 0.7
  for i=1:361                 % and with real parts between
    x = -1.8 + (i-1)*.01;     %   -1.8 and 1.8.
    z = x + 1i*y;             % 1i is the MATLAB symbol for sqrt(-1).
    zk = z;
    iflag1 = 0;               % iflag1 and iflag2 count the number of iterations
    iflag2 = 0;               %   when a root is within 1.e-6 of a fixed point;
    kount = 0;                % kount is the total number of iterations.

    while kount < 100 & abs(zk) < 2 & iflag1 < 5 & iflag2 < 5 
      kount = kount+1;
      zk = phi(zk);           % This is the fixed point iteration.
      err1 = abs(zk-fixpt1);  % Test for convergence to fixpt1.
      if err1 < 1.e-6 
         iflag1 = iflag1 + 1;
      else
         iflag1 = 0;
      end
      err2 = abs(zk-fixpt2);  % Test for convergence to fixpt2.
      if err2 < 1.e-6
        iflag2 = iflag2 + 1;
      else
        iflag2 = 0;
      end
    end
    if iflag1 >= 5 | iflag2 >= 5 | kount >= 100   % If orbit is bounded, set this
      M3(j,i) = 1;                                  %   point color to 1 (red).
    end
  end
end



end

